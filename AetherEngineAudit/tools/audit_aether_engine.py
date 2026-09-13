#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
audit_aether_engine.py — deterministic full-system consistency audit of the
AetherEngine rebuild (github.com/engine-dev01/AetherEngine) against

  (a) its own internal contracts (Dart <-> Kotlin <-> JNI <-> C++ <-> manifest), and
  (b) the committed reverse-engineering evidence in Codes/SnakeLogic
      (F2 dex natives, F3 manifest, F4 libengine JNI surface).

Design rules (inherited from tools/build_call_linkage.py):
  * every finding carries file:line evidence taken from the working tree;
  * no network, no timestamps, no host paths in the output -> byte-stable reruns;
  * a finding is only emitted when the check actually observes it (no hard-coded
    verdicts); judgment calls are marked KIND=design and still cite the lines.

Usage:
    python3 tools/audit_aether_engine.py [--aether DIR] [--evidence DIR] [--out DIR]

Outputs (in --out, default = this bundle directory):
    findings.csv          one row per finding, stable order
    audit_facts.json      machine-readable facts behind every row
    AUDIT_SUMMARY.txt     human-readable console digest (also printed to stdout)
"""

from __future__ import annotations

import argparse
import csv
import json
import os
import re
import sys
from collections import OrderedDict

SCHEMA = "aether-audit/1"

# --------------------------------------------------------------------------
# helpers
# --------------------------------------------------------------------------


def read(path):
    with open(path, "r", encoding="utf-8", errors="replace") as fh:
        return fh.read()


def strip_comments(text):
    """Remove /* */ and // comments (line structure preserved for line numbers)."""
    out = []
    in_block = False
    for line in text.splitlines():
        res = []
        i = 0
        while i < len(line):
            two = line[i:i + 2]
            if in_block:
                if two == "*/":
                    in_block = False
                    i += 2
                    continue
                i += 1
                continue
            if two == "/*":
                in_block = True
                i += 2
                continue
            if two == "//":
                break
            res.append(line[i])
            i += 1
        out.append("".join(res))
    return "\n".join(out)


def line_of(text, needle, start=0):
    """1-based line number of the first occurrence of needle at/after start."""
    idx = text.find(needle, start)
    if idx < 0:
        return 0
    return text.count("\n", 0, idx) + 1


def rel(path, root):
    return os.path.relpath(path, root).replace(os.sep, "/")


def walk(root, exts, skip=(".git", "build", ".dart_tool", "test-stubs")):
    hits = []
    for dirpath, dirnames, filenames in os.walk(root):
        dirnames[:] = [d for d in dirnames if d not in skip]
        for name in sorted(filenames):
            if os.path.splitext(name)[1] in exts:
                hits.append(os.path.join(dirpath, name))
    return sorted(hits)


def brace_body(text, open_idx):
    """Return the body of the { ... } block that starts at text[open_idx] == '{'."""
    depth = 0
    for i in range(open_idx, len(text)):
        c = text[i]
        if c == "{":
            depth += 1
        elif c == "}":
            depth -= 1
            if depth == 0:
                return text[open_idx + 1:i]
    return text[open_idx + 1:]


class Report(object):
    def __init__(self):
        self.findings = []
        self.facts = OrderedDict()

    def add(self, fid, check, sev, kind, title_en, title_th, evidence, impact, fix):
        self.findings.append(OrderedDict([
            ("id", fid),
            ("check", check),
            ("severity", sev),
            ("kind", kind),
            ("title_en", title_en),
            ("title_th", title_th),
            ("evidence", evidence),
            ("impact", impact),
            ("fix", fix),
        ]))

    def fact(self, key, value):
        self.facts[key] = value


# --------------------------------------------------------------------------
# C1 — Flutter MethodChannel parity (Dart <-> Kotlin)
# --------------------------------------------------------------------------

def check_channel_parity(rep, A):
    dart_files = walk(os.path.join(A, "app", "lib"), (".dart",))
    called = {}
    for path in dart_files:
        text = read(path)
        for m in re.finditer(r"invokeMethod(?:<[^;]*?>)?\(\s*'([A-Za-z0-9_]+)'", text):
            called.setdefault(m.group(1), []).append(
                "%s:%d" % (rel(path, A), line_of(text, m.group(0))))

    bridge = os.path.join(A, "app/android/app/src/main/kotlin/com/aether/EngineBridge.kt")
    btext = read(bridge)
    handled = {}
    for m in re.finditer(r'"([A-Za-z0-9_]+)"\s*->\s*result\.', btext):
        handled[m.group(1)] = line_of(btext, m.group(0))

    rep.fact("channel.dart_calls", sorted(called))
    rep.fact("channel.kotlin_branches", sorted(handled))
    rep.fact("channel.dart_only", sorted(set(called) - set(handled)))
    rep.fact("channel.kotlin_only", sorted(set(handled) - set(called)))

    for name in sorted(set(called) - set(handled)):
        rep.add("C1-%s" % name, "C1 channel parity", "P0", "wiring",
                "Dart calls channel method '%s' with no Kotlin handler" % name,
                "Dart เรียก '%s' แต่ฝั่ง Kotlin ไม่มี branch รองรับ" % name,
                "; ".join(called[name]),
                "invokeMethod throws MissingPluginException -> the button appears dead",
                "add a when-branch in EngineBridge.onMethodCall")

    dead = sorted(set(handled) - set(called))
    if dead:
        rep.add("C1-dead-branches", "C1 channel parity", "P3", "hygiene",
                "Kotlin handler branches never called from Dart: %s" % ", ".join(dead),
                "branch ฝั่ง Kotlin ที่ Dart ไม่เคยเรียก: %s" % ", ".join(dead),
                "%s:%s" % (rel(bridge, A), ",".join(str(handled[d]) for d in dead)),
                "dead surface; each branch is untested and drifts silently",
                "wire them to a UI control or delete them")
    return called, handled


# --------------------------------------------------------------------------
# C2 — boot-path bounce map (every place the Play button can silently return)
# --------------------------------------------------------------------------

def check_bounce_paths(rep, A):
    targets = [
        ("app/lib/screens/home_screen.dart", "_launchGameInProcess"),
        ("app/android/app/src/main/kotlin/com/aether/EngineBridge.kt", "launchInSandbox"),
        ("aether-android/aether-app/src/main/kotlin/com/aether/engine/proxy/AetherOrchestrator.kt",
         "fun launchInSandbox"),
        ("aether-android/aether-app/src/main/kotlin/com/aether/engine/proxy/ProxyActivity.kt",
         "override fun onCreate"),
    ]
    rows = []
    for path, anchor in targets:
        full = os.path.join(A, path)
        if not os.path.exists(full):
            rows.append((path, anchor, "MISSING FILE", 0))
            continue
        text = read(full)
        start = text.find(anchor)
        body = brace_body(text, text.find("{", start)) if start >= 0 else ""
        finishes = [m.start() for m in re.finditer(r"\bfinish\(\)", body)]
        falses = [m.start() for m in re.finditer(r"return false\b", body)]
        early = [m.start() for m in re.finditer(r"\breturn\b(?!\s+false)", body)]
        rows.append((path, anchor,
                     "finish()=%d return_false=%d return=%d" % (len(finishes), len(falses), len(early)),
                     line_of(text, anchor)))
    rep.fact("bounce_paths", rows)

    pa = os.path.join(A, "aether-android/aether-app/src/main/kotlin/com/aether/engine/proxy/ProxyActivity.kt")
    text = read(pa)
    guard = line_of(text, "relaunch reached bootstrap")
    failed = line_of(text, "// Launch failed — nothing to show")
    if guard:
        rep.add("C2-bounce-guard", "C2 boot path", "P0", "design",
                "ProxyActivity.onCreate has 3 distinct silent-exit paths (swap-miss guard, "
                "load-failure finish, non-virtual finish) - all of them return the user to the "
                "home screen with no on-screen reason",
                "ProxyActivity.onCreate มีทางจบแบบเงียบ 3 ทาง (guard ตอน swap ไม่เกิด, "
                "finish ตอน load fail, finish โหมด non-virtual) - ทั้ง 3 ทางพาผู้ใช้กลับหน้าเดิม"
                "โดยไม่บอกเหตุผลบนจอ",
                "ProxyActivity.kt:%d (guard), :%d (launch-failed finish)" % (guard, failed),
                "this is exactly the reported symptom: กดปุ่มรันเกมแล้วเด้งกลับหน้าเดิม",
                "surface the failure: write the reason to DiagLog AND return it through the "
                "channel (launchInSandbox should return a String/Map, not Boolean) so the UI "
                "can show which of the 3 paths fired")
    return rows


# --------------------------------------------------------------------------
# C3 — JNI surface: Engine.kt <-> RegisterNatives <-> C++ defs <-> Kotlin callers
# --------------------------------------------------------------------------

def check_jni(rep, A):
    eng = os.path.join(A, "aether-core/src/main/kotlin/com/aether/Engine.kt")
    cpp = os.path.join(A, "aether-native/src/main/cpp/aether_core.cpp")
    etext, ctext = read(eng), read(cpp)

    kt = OrderedDict()
    # line-anchored: an unanchored \s* after ')' crosses the newline and swallows
    # the NEXT declaration (that bug hid setBinderCallingPidOverride from the scan)
    for m in re.finditer(r"^[ \t]*external fun (\w+)\s*\(([^)]*)\)[ \t]*(?::[ \t]*([^\n]*))?",
                         etext, re.M):
        kt.setdefault(m.group(1), []).append((m.group(2).strip(), (m.group(3) or "").strip()))

    table = OrderedDict()
    for m in re.finditer(r'\{"(\w+)","(\([^"]*\)\S*)",\(void\*\)(\w+)\}', ctext):
        table.setdefault(m.group(1), []).append((m.group(2), m.group(3), line_of(ctext, m.group(0))))

    defined = set(re.findall(r"JNICALL\s+(Java_com_aether_Engine_\w+)", ctext))

    # Kotlin call sites (comments stripped so commented-out calls do not count)
    callers = {}
    for path in walk(A, (".kt",)):
        if os.path.basename(path) == "Engine.kt" or "/test" in path.replace(os.sep, "/"):
            continue
        text = strip_comments(read(path))
        for name in kt:
            n = len(re.findall(r"Engine\." + name + r"\s*\(", text))
            if n:
                callers.setdefault(name, []).append("%s x%d" % (os.path.basename(path), n))

    dead = sorted(n for n in kt if n not in callers)
    live = sorted(n for n in kt if n in callers)
    missing_table = sorted(set(kt) - set(table))
    missing_def = sorted(
        fn for fn in set(f for v in table.values() for (_, f, _) in v) if fn not in defined)

    rep.fact("jni.engine_kt_decls", len(kt))
    rep.fact("jni.register_natives_entries", sum(len(v) for v in table.values()))
    rep.fact("jni.cpp_definitions", len(defined))
    rep.fact("jni.live", live)
    rep.fact("jni.dead", dead)
    rep.fact("jni.dead_callers_detail", {n: callers.get(n, []) for n in dead})
    rep.fact("jni.missing_from_table", missing_table)
    rep.fact("jni.table_symbol_without_definition", missing_def)

    if dead:
        rep.add("C3-dead-natives", "C3 JNI surface", "P1", "wiring",
                "%d of %d registered JNI methods have no Kotlin call site: %s"
                % (len(dead), len(kt), ", ".join(dead)),
                "JNI %d จาก %d ตัวที่ลงทะเบียนไว้ ไม่มีจุดเรียกใน Kotlin: %s"
                % (len(dead), len(kt), ", ".join(dead)),
                "Engine.kt external funs vs call-site scan of %d .kt files" % len(walk(A, (".kt",))),
                "the parity gate (scripts/jni_parity.py) only compares names+descriptors, so it "
                "reports PASS while a third of the native surface is unreachable",
                "either call them from the hop that needs them (see C4) or delete the "
                "declaration + table entry + C++ definition together")
    for name in missing_table:
        rep.add("C3-notable-%s" % name, "C3 JNI surface", "P0", "wiring",
                "Engine.kt declares '%s' but RegisterNatives has no entry" % name,
                "Engine.kt ประกาศ '%s' แต่ไม่มีในตาราง RegisterNatives" % name,
                "aether-core/src/main/kotlin/com/aether/Engine.kt",
                "UnsatisfiedLinkError at the first call", "add the table entry")
    for fn in missing_def:
        rep.add("C3-nodef-%s" % fn, "C3 JNI surface", "P0", "wiring",
                "RegisterNatives points at %s which is not defined in aether_core.cpp" % fn,
                "RegisterNatives ชี้ไปที่ %s ซึ่งไม่มีการนิยามใน aether_core.cpp" % fn,
                "aether-native/src/main/cpp/aether_core.cpp",
                "link error / dlopen failure -> whole engine dead", "implement or remove")
    return kt, table, callers, dead


# --------------------------------------------------------------------------
# C4 — C++ implementation status (real vs empty stub) + orphan translation units
# --------------------------------------------------------------------------

STUB_PAT = re.compile(r"^\s*(?:(?:LOGD|LOGI|LOGW|LOGE)\s*\([^;]*\)\s*;?\s*|"
                      r"\(void\)\s*\w[\w:]*\([^;]*\)\s*;\s*)*$")


def classify_body(body):
    b = strip_comments(body).strip()
    if b in ("", ";"):
        return "EMPTY"
    if STUB_PAT.match(b.replace("\n", " ")):
        return "LOG-ONLY"
    # trivial constant returns
    if re.fullmatch(r"return (nullptr|NULL|0|false|true|JNI_FALSE|JNI_TRUE|-1);" , b.replace("\n", " ")):
        return "CONST-RETURN"
    return "REAL"


def check_native_impl(rep, A, table, kt, callers):
    cpp_path = os.path.join(A, "aether-native/src/main/cpp/aether_core.cpp")
    text = read(cpp_path)
    status = OrderedDict()
    for m in re.finditer(r"JNIEXPORT\s+(\S+)\s+JNICALL\s+(Java_com_aether_Engine_\w+)\s*\([^)]*\)\s*\{",
                         text):
        body = brace_body(text, m.end() - 1)
        status[m.group(2)] = (classify_body(body), line_of(text, m.group(0)), m.group(1))

    # chain-critical set = the 5 SNAKE natives that scripts/native_chain_parity.py
    # declares as required hops (ic, i, ac, pjowqpxe, update).
    chain = OrderedDict([
        ("nativeInitContext", "SNAKE Native.ic (hop17, yu0.f after loadLibrary)"),
        ("nativeSetSeed", "SNAKE Native.i (hop21, jv0.O2:245 bind path)"),
        ("nativeProcessPair", "SNAKE Native.ac (hop23, b8.callActivityOnResume)"),
        ("nativeProcessTriple", "SNAKE Native.pjowqpxe (hidden dex)"),
        ("nativeReflectUpdate", "SNAKE Native.update (hidden dex, MethodUtils)"),
    ])
    rows = []
    hollow = []
    for fn, role in chain.items():
        sym = "Java_com_aether_Engine_" + fn
        st = status.get(sym, ("ABSENT", 0, ""))[0]
        ln = status.get(sym, ("ABSENT", 0, ""))[1]
        rows.append((fn, role, st, ln))
        if st in ("EMPTY", "LOG-ONLY", "CONST-RETURN", "ABSENT"):
            hollow.append("%s (%s, aether_core.cpp:%d = %s)" % (fn, role, ln, st))
    rep.fact("native.chain_required", rows)
    if hollow:
        rep.add("C4-hollow-chain", "C4 native implementation", "P0", "substance",
                "%d of the %d chain-required JNI hops are registered and called from the 'correct' "
                "Kotlin file, but their C++ bodies do nothing: %s"
                % (len(hollow), len(chain), "; ".join(hollow)),
                "hop ระดับ native %d จาก %d ตัวที่ gate รับรองว่า 'วางถูกตำแหน่ง' มี body ว่างเปล่า: %s"
                % (len(hollow), len(chain), "; ".join(hollow)),
                "aether-native/src/main/cpp/aether_core.cpp",
                "scripts/native_chain_parity.py prints PASS ('ทุก hop chain-required ... call-site "
                "ถูกตำแหน่ง') while the native layer contributes zero behaviour - a green gate "
                "over a hollow chain",
                "extend the gate: after placement, assert the C++ body is not EMPTY/LOG-ONLY; "
                "then implement the hops (or record them as deliberately no-op in the gate "
                "output instead of PASS)")

    # quadrant: called-from-Kotlin x has-a-real-C++-body (per Engine.kt name)
    stub_syms = {fn.replace("Java_com_aether_Engine_", "").split("__")[0]
                 for fn, (st, _, _) in status.items() if st in ("EMPTY", "LOG-ONLY", "CONST-RETURN")}
    quad = {"live_real": [], "live_hollow": [], "dead_real": [], "dead_hollow": []}
    for name in sorted(kt):
        k = ("live" if name in callers else "dead") + ("_hollow" if name in stub_syms else "_real")
        quad[k].append(name)
    rep.fact("jni.quadrant", quad)

    stubs = sorted(fn for fn, (st, _, _) in status.items() if st in ("EMPTY", "LOG-ONLY", "CONST-RETURN"))
    rep.fact("native.stub_implementations", [(fn, status[fn][0], status[fn][1]) for fn in stubs])
    rep.fact("native.real_implementations",
             sorted(fn for fn, (st, _, _) in status.items() if st == "REAL"))
    if stubs:
        rep.add("C4-stubs", "C4 native implementation", "P1", "substance",
                "%d of %d JNI implementations are empty/log-only/constant-return: %s"
                % (len(stubs), len(status), ", ".join(s.replace("Java_com_aether_Engine_", "")
                                                       for s in stubs)),
                "JNI %d จาก %d ตัวเป็น body ว่าง/แค่ log/คืนค่าคงที่: %s"
                % (len(stubs), len(status), ", ".join(s.replace("Java_com_aether_Engine_", "")
                                                      for s in stubs)),
                "aether_core.cpp (AETHER_DEBUG=0 -> LOGD compiles to ((void)0), so LOG-ONLY == EMPTY)",
                "Kotlin logs claim success for work the native layer never performs "
                "(see C4-false-telemetry)",
                "implement, or return an explicit failure so callers can tell")

    # false telemetry: enableIO/addIORule are stubs but Kotlin logs "IO enabled ... registered"
    io_stub = status.get("Java_com_aether_Engine_enableIO", ("", 0))[0] in ("EMPTY", "LOG-ONLY")
    rule_stub = status.get("Java_com_aether_Engine_addIORule", ("", 0))[0] in ("EMPTY", "LOG-ONLY")
    orch = os.path.join(A, "aether-android/aether-app/src/main/kotlin/com/aether/engine/proxy/AetherOrchestrator.kt")
    otext = read(orch)
    claim = line_of(otext, "VirtualFS: IO enabled,")
    if io_stub and rule_stub and claim:
        rep.add("C4-false-telemetry", "C4 native implementation", "P0", "consistency",
                "AetherOrchestrator logs 'VirtualFS: IO enabled, N redirect rules registered' but "
                "Engine.enableIO() and Engine.addIORule() are empty C++ stubs - no path is ever "
                "redirected natively",
                "AetherOrchestrator log ว่า 'VirtualFS: IO enabled, N redirect rules registered' "
                "แต่ enableIO()/addIORule() เป็น stub ว่างใน C++ - ไม่มี path redirect เกิดจริง",
                "AetherOrchestrator.kt:%d vs aether_core.cpp enableIO/addIORule" % claim,
                "the UI diagnostic (testVirtualFS / getVirtualAppStatus) reports a working "
                "virtual FS that does not exist; guest file I/O lands on host paths",
                "wire enableIO/addIORule to layer/bindmount/virtual_fs.cpp (already written, "
                "see C5-orphans) and make the Kotlin log report the native return value")
    return status


def check_native_orphans(rep, A):
    """Objective reachability: the JNI TU (aether_core.cpp) is the only entry point
    into libaether.so. A TU whose header is not in the transitive #include closure
    of that entry cannot be called; with -Wl,--gc-sections it is not even linked in.
    A second, weaker category: header IS included but every call site is commented out.
    """
    base = os.path.join(A, "aether-native/src/main/cpp")
    tus = walk(base, (".cpp",))
    jni = os.path.join(base, "aether_core.cpp")

    def includes_of(path):
        out = []
        for inc in re.findall(r'#include\s+"([^"]+)"', read(path)):
            for cand in (os.path.join(os.path.dirname(path), inc), os.path.join(base, inc)):
                if os.path.exists(cand):
                    out.append(os.path.normpath(cand))
                    break
        return out

    seen, stack = set(), [jni]
    while stack:
        cur = stack.pop()
        for inc in includes_of(cur):
            if inc not in seen:
                seen.add(inc)
                stack.append(inc)

    orphans, uncalled = [], []
    for tu in tus:
        if tu == jni:
            continue
        hdr = os.path.join(os.path.dirname(tu), os.path.basename(tu)[:-4] + ".hpp")
        lines = len(read(tu).splitlines())
        if os.path.exists(hdr) and os.path.normpath(hdr) not in seen:
            orphans.append((rel(tu, A), lines))
            continue
        # header reachable: are its symbols actually used in live (non-comment) code
        # ANYWHERE in the library (not just the JNI TU)?
        live_text = ""
        for other in walk(base, (".cpp", ".hpp")):
            if other not in (tu, hdr):
                live_text += strip_comments(read(other)) + "\n"
        htext = read(hdr) if os.path.exists(hdr) else ""
        syms = set(re.findall(r"(?:class|struct)\s+(\w+)", htext))
        syms |= {s.split("::")[-1] for s in re.findall(r"namespace\s+([\w:]+)", htext)}
        syms = {s for s in syms if len(s) > 3}
        used = any(re.search(r"\b" + re.escape(s) + r"\s*::", live_text) for s in syms)
        if syms and not used:
            uncalled.append((rel(tu, A), lines))

    rep.fact("native.orphan_translation_units", orphans)
    rep.fact("native.included_but_uncalled", uncalled)
    if orphans:
        rep.add("C5-orphans", "C5 native linkage", "P1", "wiring",
                "%d native translation unit(s) are compiled into libaether.so but their header is "
                "not in the #include closure of the only JNI entry point (aether_core.cpp), so no "
                "code path can reach them and -Wl,--gc-sections drops them from the binary: %s"
                % (len(orphans), ", ".join("%s (%d lines)" % o for o in orphans)),
                "ไฟล์ C++ %d ไฟล์ถูกคอมไพล์เข้า libaether.so แต่ header ไม่ได้อยู่ใน #include closure "
                "ของ JNI entry เดียว (aether_core.cpp) จึงไม่มีทางเรียกถึง และ --gc-sections ทิ้งออกจาก "
                "binary: %s" % (len(orphans), ", ".join("%s (%d บรรทัด)" % o for o in orphans)),
                "aether-native/src/main/cpp/CMakeLists.txt (L1_SOURCES) vs aether_core.cpp includes",
                "the bind-mount virtual FS, the package.conf manifest snapshot and the root-spoof "
                "module exist as finished code but are unreachable - the features they implement "
                "(path redirect, manifest snapshot, module hiding) are therefore absent at runtime",
                "include and call them from the JNI entries that exist for exactly this purpose "
                "(enableIO/addIORule -> VirtualFS, hideXposed -> RootSpoof)")
    if uncalled:
        rep.add("C5-uncalled", "C5 native linkage", "P2", "wiring",
                "%d TU(s) are included by aether_core.cpp but every call into them is commented "
                "out: %s" % (len(uncalled), ", ".join("%s (%d lines)" % o for o in uncalled)),
                "%d ไฟล์ถูก include ใน aether_core.cpp แต่ทุกจุดเรียกถูกคอมเมนต์ทิ้ง: %s"
                % (len(uncalled), ", ".join("%s (%d บรรทัด)" % o for o in uncalled)),
                "aether_core.cpp JNI_OnLoad ('[CUT 2026-09-11]' lines)",
                "deliberate cuts, but they are invisible in the gate output - the parity script "
                "still counts these natives as present",
                "record each cut in docs/ with the reason and the date, and have the gate print "
                "them as CUT rather than PASS")
    return orphans, uncalled


# --------------------------------------------------------------------------
# C6 — hidden-API reflection surface vs absence of any exemption
# --------------------------------------------------------------------------

HIDDEN_TARGETS = [
    ("ActivityThread.currentActivityThread", "framework entry point for every hook"),
    ("ActivityThread.mInstrumentation", "Instrumentation swap (activity virtualization)"),
    ("ActivityThread.mInitialApplication", "guest Application publish"),
    ("ActivityThread.mAllApplications", "guest Application list"),
    ("LoadedApk.mApplication", "framework component factory resolution"),
    ("LoadedApk.mClassLoader", "guest class loader publish"),
    ("LoadedApk.mDataDirFile", "data dir re-root"),
    ("LoadedApk.mCredentialProtectedDataDirFile", "data dir re-root"),
    ("LoadedApk.mDeviceProtectedDataDirFile", "data dir re-root"),
    ("ContextImpl.mPackageInfo", "LoadedApk handle"),
    ("ContextImpl.mApplicationInfo", "ApplicationInfo override"),
    ("ContextWrapper.mBase", "attachBaseContext bypass"),
    ("AssetManager.addAssetPath", "guest arsc injection"),
    ("Activity.mActivityInfo", "guest theme/flags install"),
    ("Activity.mTheme", "theme cache clear"),
    ("Activity.mResources", "guest Resources install"),
    ("AppCompatActivity.mDelegate", "AppCompat delegate rebuild"),
    ("IActivityManagerSingleton", "AMS singleton replace"),
    ("Singleton.mInstance", "AMS/IPMS singleton replace"),
    ("ServiceManager.sCache", "binder wrapper install"),
    ("AppBindData.processName", "process name spoof"),
]


def check_hidden_api(rep, A):
    kt_files = [p for p in walk(A, (".kt", ".java")) if "/test" not in p.replace(os.sep, "/")]
    hits = OrderedDict()
    for path in kt_files:
        text = strip_comments(read(path))
        for target, _why in HIDDEN_TARGETS:
            key = target.split(".")[-1]
            needle = '"%s"' % key
            if needle in text:
                hits.setdefault(target, []).append(
                    "%s:%d" % (rel(path, A), line_of(text, needle)))
    all_src = []
    for ext in (".kt", ".java", ".cpp", ".hpp", ".dart"):
        all_src += walk(A, (ext,))
    exemption = []
    for path in all_src:
        text = read(path)
        for needle in ("setHiddenApiExemptions", "VMRuntime", "hiddenapi", "HiddenApi",
                       "freeReflection", "metaReflect", "getDeclaredMethod(\"forName\""):
            if needle in text:
                exemption.append("%s:%d (%s)" % (rel(path, A), line_of(text, needle), needle))
    rep.fact("hidden_api.targets_used", {k: v for k, v in hits.items()})
    rep.fact("hidden_api.exemption_calls", exemption)
    rep.fact("hidden_api.distinct_targets", len(hits))

    if hits and not exemption:
        rep.add("C6-no-exemption", "C6 hidden API", "P0", "substance",
                "the boot chain reflects into %d restricted framework members (%s) and the repo "
                "contains no hidden-API exemption/bypass anywhere (0 hits for "
                "setHiddenApiExemptions / VMRuntime / hiddenapi in %d source files)"
                % (len(hits), ", ".join(sorted(hits)), len(all_src)),
                "chain การ boot ยิง reflection เข้า framework member ที่ถูกจำกัด %d จุด (%s) "
                "แต่ทั้ง repo ไม่มีการขอ hidden-API exemption เลย (0 hit ใน %d ไฟล์)"
                % (len(hits), ", ".join(sorted(hits)), len(all_src)),
                "; ".join("%s -> %s" % (k, v[0]) for k, v in sorted(hits.items())[:8]),
                "on Android 9+ every blocked member throws NoSuchField/NoSuchMethod; each site is "
                "wrapped in try/catch, so the chain degrades silently to 'passthrough' and "
                "ProxyActivity finishes -> the UI bounces back with no error",
                "install an exemption once per process before any hook runs - the JNI slots for it "
                "already exist and are empty: Engine.setAccessible(Field)/setAccessible(Method) "
                "(see C3-dead-natives); call them from AetherApp.onCreate right after "
                "EngineLoader.load(), then re-check with the chainCheck button")
    return hits, exemption


# --------------------------------------------------------------------------
# C7 — manifest <-> source <-> slot-count parity, and SNAKE F3 component diff
# --------------------------------------------------------------------------

def check_manifest(rep, A, E):
    manifests = [
        os.path.join(A, "app/android/app/src/main/AndroidManifest.xml"),
        os.path.join(A, "aether-android/aether-app/src/main/AndroidManifest.xml"),
    ]
    declared = OrderedDict()
    for mf in manifests:
        text = read(mf)
        # namespace of the module that owns this manifest (for '.Class' shorthand)
        ns = "com.aether"
        gradle = os.path.join(os.path.dirname(mf), "..", "..", "build.gradle")
        if os.path.exists(gradle):
            m = re.search(r'namespace\s*=\s*"([\w.]+)"', read(gradle))
            if m:
                ns = m.group(1)
        for m in re.finditer(r'<(activity|service|provider|receiver)[^>]*android:name="([^"]+)"', text):
            name = m.group(2)
            if name.startswith("."):
                name = ns + name
            declared.setdefault(name, set()).add(m.group(1))

    # source classes
    src = {}
    for path in walk(A, (".kt", ".java")):
        text = read(path)
        pm = re.search(r"^package\s+([\w.]+)", text, re.M)
        pkg = pm.group(1) if pm else ""
        for m in re.finditer(r"^\s*(?:open |abstract |sealed |data |inner )*class\s+(\w+)", text, re.M):
            src.setdefault(pkg + "." + m.group(1), rel(path, A))

    missing = []
    for name in declared:
        base = name.split("$")[0]
        nested = name.split("$")[1] if "$" in name else None
        key = base + "." + nested if nested else base
        if key not in src and base not in src:
            missing.append(name)
    rep.fact("manifest.declared_components", len(declared))
    rep.fact("manifest.missing_source", missing)
    for name in missing:
        rep.add("C7-nosrc-%s" % name, "C7 manifest", "P0", "wiring",
                "manifest declares %s but no source class defines it" % name,
                "manifest ประกาศ %s แต่ไม่มี class รองรับในซอร์ส" % name,
                "; ".join(manifests), "process crash the moment the component is used",
                "add the class or remove the declaration")

    # slot parity: P<n> stubs per family vs GuestProcessTable.MAX_SLOTS
    fam = {}
    for name in declared:
        m = re.match(r"(.*)\$P(\d+)(_L)?$", name)
        if m:
            fam.setdefault(m.group(1) + ("_L" if m.group(3) else ""), set()).add(int(m.group(2)))
    reg = os.path.join(A, "aether-android/aether-app/src/main/kotlin/com/aether/engine/proxy/GuestProcessRegistry.kt")
    rtext = read(reg)
    mm = re.search(r"MAX_SLOTS\s*=\s*(\d+)", rtext)
    maxslots = int(mm.group(1)) if mm else -1
    rep.fact("manifest.stub_families", {k: sorted(v) for k, v in sorted(fam.items())})
    rep.fact("manifest.MAX_SLOTS", maxslots)
    for family, slots in sorted(fam.items()):
        if maxslots > 0 and max(slots) + 1 != maxslots:
            rep.add("C7-slots-%s" % family.split(".")[-1], "C7 manifest", "P1", "consistency",
                    "%s declares stubs P%s but GuestProcessTable.MAX_SLOTS=%d"
                    % (family, sorted(slots), maxslots),
                    "%s ประกาศ stub P%s แต่ MAX_SLOTS=%d" % (family, sorted(slots), maxslots),
                    "GuestProcessRegistry.kt:%d" % line_of(rtext, "MAX_SLOTS"),
                    "allocate() can hand out a slot whose stub does not exist -> "
                    "ActivityNotFoundException -> launchInSandbox returns false -> bounce",
                    "keep stub count and MAX_SLOTS in one place (generate the manifest entries "
                    "or assert equality in preflight)")

    # SNAKE F3 evidence diff. The rebuild renames every com.snake.helper.* component,
    # so the comparison is done on FAMILY level with an explicit, documented rename
    # map (derived from the two manifests + the source inventory, not guessed).
    f3 = os.path.join(E, "fragments/F3_manifest.txt")
    if os.path.exists(f3):
        text = read(f3)
        snake = sorted(set(re.findall(
            r"(?:activity|service|provider|receiver)\s+(com\.snake\.[\w.$]+)", text)))
        RENAME_FULL = {
            # SNAKE nests the inner service; the rebuild promotes it to a top-level class
            "DaemonService$DaemonInnerService": "AetherDaemonInnerService",
        }
        RENAME = {
            "DaemonService": "AetherDaemonService",
            "DaemonService$DaemonInnerService": "AetherDaemonInnerService",
            "FileProvider": "AetherFileProvider",
            "ProxyBroadcastReceiver": "AetherStubReceiver",
            "ProxyVpnService": "AetherVpnService",
            "SystemCallProvider": "AetherSystemCallProvider",
        }

        def fam(items, strip_prefixes):
            out = set()
            for it in items:
                short = it
                for p in strip_prefixes:
                    if short.startswith(p):
                        short = short[len(p):]
                        break
                short = RENAME_FULL.get(short, short)
                base = short.split("$")[0]
                short = RENAME.get(base, base) + ("$" + short.split("$")[1] if "$" in short else "")
                # collapse the slot number, keep the _L (landscape) variant distinct
                out.add(re.sub(r"\$P\d+_L$", "$Pn_L", re.sub(r"\$P\d+$", "$Pn", short)))
            return out

        sf = fam(snake, ("com.snake.helper.", "com.snake."))
        of = fam(sorted(declared), ("com.aether.engine.proxy.", "com.aether.engine.ipc.",
                                    "com.aether.engine.daemon.", "com.aether.engine.vpn.",
                                    "com.aether."))
        rep.fact("manifest.snake_families", sorted(sf))
        rep.fact("manifest.our_families", sorted(of))
        rep.fact("manifest.rename_map", dict(RENAME_FULL, **RENAME))
        gap = sorted(sf - of)
        rep.fact("manifest.parity_gap_vs_snake", gap)
        if gap:
            rep.add("C7-parity-gap", "C7 manifest", "P1", "parity",
                    "component families present in the SNAKE reference manifest (F3, 51 components) "
                    "but absent from AetherEngine after applying the documented rename map: %s"
                    % ", ".join(gap),
                    "ตระกูล component ที่มีใน manifest ต้นแบบ SNAKE (F3, 51 ตัว) แต่หายไปใน "
                    "AetherEngine หลังเทียบผ่าน rename map: %s" % ", ".join(gap),
                    "Codes/SnakeLogic/fragments/F3_manifest.txt",
                    "$Pn_L are the LANDSCAPE proxy stubs: a virtual-app engine needs one stub per "
                    "orientation because the guest declares orientation-locked activities - with "
                    "only $P0..$P3 there is no stub to land an orientation change on; the bare "
                    "ProxyActivity (non-slotted) is also declared by SNAKE and missing here",
                    "add the $P0_L..$P3_L family (and decide explicitly whether the bare "
                    "ProxyActivity is needed), or record the drop as a deliberate deviation")
    return declared, fam


# --------------------------------------------------------------------------
# C8 — lifecycle: guest session is never closed
# --------------------------------------------------------------------------

def check_lifecycle(rep, A):
    allkt = walk(A, (".kt",))
    def callers(needle, exclude=()):
        out = []
        for p in allkt:
            if any(x in p for x in exclude):
                continue
            t = strip_comments(read(p))
            if needle in t:
                out.append("%s:%d" % (rel(p, A), line_of(t, needle)))
        return out

    close = callers("GuestRuntimeBridge.close()")
    suspend = callers(".suspend()")
    resume = callers(".resume()")
    pa = os.path.join(A, "aether-android/aether-app/src/main/kotlin/com/aether/engine/proxy/ProxyActivity.kt")
    patext = read(pa)
    has_destroy = bool(re.search(r"override fun onDestroy", patext))
    doc_claim = line_of(read(os.path.join(
        A, "aether-android/aether-app/src/main/kotlin/com/aether/engine/proxy/GuestRuntimeBridge.kt")),
        "ProxyActivity.onDestroy()")

    rep.fact("lifecycle.close_callers", close)
    rep.fact("lifecycle.suspend_callers", suspend)
    rep.fact("lifecycle.resume_callers", resume)
    rep.fact("lifecycle.ProxyActivity_has_onDestroy", has_destroy)

    if not close and not has_destroy:
        rep.add("C8-never-closed", "C8 lifecycle", "P1", "wiring",
                "GuestRuntimeBridge.close() has 0 callers and ProxyActivity does not override "
                "onDestroy, although the bridge's own KDoc says close() must be called from "
                "ProxyActivity.onDestroy()",
                "GuestRuntimeBridge.close() ไม่มีคนเรียก และ ProxyActivity ไม่ override onDestroy "
                "ทั้งที่ KDoc ของ bridge ระบุให้เรียกจาก ProxyActivity.onDestroy()",
                "GuestRuntimeBridge.kt:%d (doc claim) vs ProxyActivity.kt (only onCreate is overridden)"
                % doc_claim,
                "the guest session, the ActivityThread binds and the installed Instrumentation "
                "wrapper survive the stub activity; a second Play press reuses stale state "
                "(activeRuntime, AetherInstrumentation.installed) instead of rebuilding it",
                "override onDestroy/onNewIntent in ProxyActivity: close the runtime, reset "
                "AetherInstrumentation.installed, and clear VirtualAppContainer identity")

    inst = os.path.join(A, "aether-android/aether-app/src/main/kotlin/com/aether/engine/proxy/AetherInstrumentation.kt")
    itext = read(inst)
    guard = line_of(itext, "if (installed) return true")
    if guard:
        rep.add("C8-stale-hook", "C8 lifecycle", "P1", "design",
                "AetherInstrumentation.install() captures stubComponent/guestClassLoader/guestApp "
                "once and then returns early on 'installed' - a second guest (or a re-launch after "
                "the guest died) keeps the FIRST guest's class loader",
                "AetherInstrumentation.install() จับ stubComponent/guestClassLoader/guestApp ไว้ครั้งเดียว "
                "แล้ว return ทันทีถ้า installed -> guest ตัวที่สอง (หรือ relaunch หลัง guest ตาย) "
                "ยังใช้ classloader ของตัวแรก",
                "AetherInstrumentation.kt:%d" % guard,
                "swap instantiates guest classes through a stale loader -> ClassNotFoundException "
                "in :pN -> process death -> bounce",
                "make install() rebind the wrapper's fields when the identity changes, and reset "
                "'installed' when the runtime is closed")
    return close, has_destroy


# --------------------------------------------------------------------------
# C9 — Hook A (execStartActivity) can never be invoked
# --------------------------------------------------------------------------

def check_hook_a(rep, A):
    inst = os.path.join(A, "aether-android/aether-app/src/main/kotlin/com/aether/engine/proxy/AetherInstrumentation.kt")
    text = read(inst)
    m = re.search(r"^\s*(override\s+)?fun execStartActivity\s*\(", text, re.M)
    if not m:
        return
    is_override = bool(m.group(1))
    ln = text.count("\n", 0, m.start()) + 1
    rewrite = line_of(text, "rewriteToStub(intent)")
    rep.fact("hookA.is_override", is_override)
    rep.fact("hookA.line", ln)
    if not is_override:
        rep.add("C9-hookA-dead", "C9 activity virtualization", "P0", "design",
                "AetherInstrumentation.execStartActivity is declared WITHOUT 'override' - it is a "
                "new method on the subclass, so ActivityThread (which calls the framework "
                "Instrumentation.execStartActivity overloads) never dispatches to it; rewriteToStub() "
                "therefore never runs",
                "AetherInstrumentation.execStartActivity ประกาศโดยไม่มี 'override' - เป็น method ใหม่"
                "ของ subclass จึงไม่มีทางที่ ActivityThread จะเรียก; rewriteToStub() ไม่เคยทำงาน",
                "AetherInstrumentation.kt:%d (declaration), :%d (rewriteToStub call)" % (ln, rewrite),
                "Hook A is the mechanism that keeps every SUBSEQUENT guest activity launch inside "
                "the sandbox. Without it only the first (bootstrap) launch is stubbed; the moment "
                "the guest starts another activity AMS resolves it to the real installed app or "
                "fails -> visible as 'game does not boot / bounces back'",
                "implement Hook A the way VirtualApp does: replace ActivityThread.mInstrumentation "
                "AND hook the IActivityManager/ATMS binder proxy (ServiceBinderProxy already wraps "
                "'activity'), rewriting the Intent inside the binder call - or delete execStartActivity "
                "and stop documenting it as an active hook")
    return


# --------------------------------------------------------------------------
# C10 — CI/gate reproducibility
# --------------------------------------------------------------------------

def check_gates(rep, A):
    scripts = walk(os.path.join(A, "scripts"), (".py", ".sh"))
    abs_paths = []
    for path in scripts:
        text = read(path)
        for m in re.finditer(r'["\'](/[\w./-]{12,})["\']', text):
            p = m.group(1)
            if p.startswith("/tmp") or p.startswith("/usr") or p.startswith("/proc"):
                continue
            abs_paths.append((rel(path, A), line_of(text, m.group(0)), p))
    rep.fact("gates.absolute_paths", abs_paths)
    for f, ln, p in abs_paths:
        exists = os.path.exists(p)
        rep.add("C10-abspath-%s" % os.path.basename(f), "C10 gate reproducibility",
                "P1" if not exists else "P2", "consistency",
                "%s:%d hard-codes the absolute path %s (exists on this machine: %s)"
                % (f, ln, p, exists),
                "%s:%d ฝัง path แบบ absolute %s (มีอยู่จริงบนเครื่องนี้: %s)" % (f, ln, p, exists),
                "%s:%d" % (f, ln),
                "the gate crashes with FileNotFoundError on any other checkout, and preflight G3b "
                "counts that crash as FAIL for the wrong reason - the parity claim is unverifiable "
                "for anyone else",
                "resolve the evidence directory from an env var / CLI flag with a repo-relative "
                "default, and vendor the needed fragment (F2) under reference/")

    cited = set()
    for path in walk(A, (".kt", ".py", ".md", ".sh")):
        text = read(path)
        for m in re.finditer(r"([A-Z0-9_]{4,}\.md)", text):
            cited.add(m.group(1))
    present = {os.path.basename(p) for p in walk(os.path.join(A, "docs"), (".md",))}
    present |= {os.path.basename(p) for p in walk(A, (".md",))}
    missing_docs = sorted(d for d in cited if d not in present)
    rep.fact("gates.cited_docs", sorted(cited))
    rep.fact("gates.cited_but_absent", missing_docs)
    if missing_docs:
        rep.add("C10-missing-evidence", "C10 gate reproducibility", "P1", "evidence",
                "source/comments cite %d document(s) that are not committed anywhere in the repo: %s"
                % (len(missing_docs), ", ".join(missing_docs)),
                "โค้ด/คอมเมนต์อ้างถึงเอกสาร %d ชิ้นที่ไม่ได้ commit ไว้ใน repo: %s"
                % (len(missing_docs), ", ".join(missing_docs)),
                "grep of *.kt/*.py/*.md/*.sh vs docs/ inventory",
                "the SNAKE parity claims (a7.m / jv0.P2 / jv0.O2 / b8 hop numbers, "
                "'_Engine_|_init_process_' schema) rest on these transcripts; nobody can re-verify "
                "them, and the committed evidence in Codes/SnakeLogic does NOT contain the strings "
                "they quote",
                "commit the transcripts under reference/ (or link the Codes/SnakeLogic fragment "
                "that does contain the fact) and mark every claim that has no committed evidence "
                "as UNVERIFIED")
    return abs_paths, missing_docs


# --------------------------------------------------------------------------
# C11 — test coverage of the boot chain
# --------------------------------------------------------------------------

def check_tests(rep, A):
    tests = [p for p in walk(A, (".kt",)) if "/src/test/" in p.replace(os.sep, "/")]
    total = 0
    chain_covered = []
    for p in tests:
        t = read(p)
        total += len(re.findall(r"@Test", t))
        for needle in ("bindToActivityThread", "launchInSandbox", "newActivity",
                       "handleInit", "spawnAndConfig", "installProviders"):
            if needle in t:
                chain_covered.append((rel(p, A), needle))
    rep.fact("tests.files", [rel(p, A) for p in tests])
    rep.fact("tests.count", total)
    rep.fact("tests.chain_coverage", chain_covered)
    stubs = walk(os.path.join(A, "aether-android/test-stubs"), (".kt",), skip=(".git", "build"))
    at = [p for p in stubs if p.endswith("ActivityThread.kt")]
    null_thread = False
    if at:
        stext = read(at[0])
        null_thread = bool(re.search(r"currentActivityThread\s*\([^)]*\)[^\n]*=\s*null", stext)
                           or "return null" in stext)
    rep.fact("tests.aosp_stub_ActivityThread_returns_null", bool(null_thread))
    if chain_covered and null_thread:
        rep.add("C11-degraded-only", "C11 test coverage", "P1", "coverage",
                "%d tests touch chain entry points (%s) but the AOSP test stub makes "
                "ActivityThread.currentActivityThread() return null, so every one of them asserts "
                "the DEGRADED path (install() == false, bind refused) - the success path of the "
                "boot chain has no automated coverage at all"
                % (len(chain_covered), ", ".join(sorted({c[1] for c in chain_covered}))),
                "test %d เคสแตะ entry point ของ chain (%s) แต่ stub AOSP ทำให้ "
                "currentActivityThread() คืน null ทุกเคสจึงยืนยันเฉพาะ path ที่ degraded "
                "(install() == false, bind ถูกปฏิเสธ) - path ที่สำเร็จของ chain การ boot ไม่มี test เลย"
                % (len(chain_covered), ", ".join(sorted({c[1] for c in chain_covered}))),
                "aether-android/test-stubs/android/app/ActivityThread.kt + " +
                "; ".join(c[0] for c in chain_covered),
                "CI green == 'the chain fails safely', not 'the chain works'; that is why every "
                "regression is only found on a device",
                "introduce a seam (interface for the framework probes) with two stubs - one that "
                "returns null and one that returns a fake ActivityThread - and assert BOTH paths")
    if not chain_covered:
        rep.add("C11-no-chain-test", "C11 test coverage", "P1", "coverage",
                "%d unit tests across %d files, none of them touches a boot-chain entry point "
                "(bindToActivityThread / launchInSandbox / newActivity / handleInit / spawnAndConfig); "
                "the AOSP stubs make ActivityThread.currentActivityThread() return null, so every "
                "hook test asserts the DEGRADED path"
                % (total, len(tests)),
                "unit test %d เคสใน %d ไฟล์ ไม่มีเคสไหนแตะ entry point ของ chain การ boot เลย; "
                "stub AOSP ทำให้ currentActivityThread() คืน null - test ทุกตัวจึงยืนยัน path ที่ degraded"
                % (total, len(tests)),
                "; ".join(rel(p, A) for p in tests) + " | aether-android/test-stubs/android/app/ActivityThread.kt",
                "CI is green while the boot chain has zero automated coverage - regressions are only "
                "found on a device, one commit at a time (which is what the recent fix-spawn / "
                "fix-proxy / fix-activity commit series shows)",
                "add a fakeable seam: an interface for the framework probes (ActivityThread handle, "
                "LoadedApk fields) so the 3-pass bind, the provider handshake and the newActivity "
                "swap can be unit-tested on the JVM")
    return total, chain_covered


# --------------------------------------------------------------------------
# C12 — cross-checks against the committed SNAKE evidence
# --------------------------------------------------------------------------

def check_evidence_mapping(rep, A, E):
    f2 = os.path.join(E, "fragments/F2_dex_natives.txt")
    if not os.path.exists(f2):
        rep.fact("evidence.F2", "MISSING")
        return
    text = read(f2)
    snake_natives = sorted(set(re.findall(r"native \(\S+\) (\w+)\s*$", text, re.M)))
    callers = sorted(set(re.findall(r"<- (L[\w/$]+;->[\w<>$]+\([^)]*\)\S*)\s+@(0x[0-9a-f]+)", text)))
    rep.fact("evidence.snake_natives", snake_natives)
    rep.fact("evidence.snake_native_callers", len(callers))

    mapping = {
        "ic": "nativeInitContext", "i": "nativeSetSeed", "ac": "nativeProcessPair",
        "pjowqpxe": "nativeProcessTriple", "update": "nativeReflectUpdate",
    }
    unmapped = sorted(set(snake_natives) - set(mapping))
    rep.fact("evidence.mapping", mapping)
    rep.fact("evidence.cut_or_unmapped", unmapped)

    if unmapped:
        rep.add("C12-unmapped", "C12 evidence mapping", "P2", "parity",
                "%d of the %d SNAKE dex natives have no counterpart in Engine.kt and are recorded "
                "only inside a script constant (CUT): %s"
                % (len(unmapped), len(snake_natives), ", ".join(unmapped)),
                "native ฝั่ง SNAKE %d จาก %d ตัวไม่มีคู่ใน Engine.kt และถูกบันทึกไว้แค่ในค่าคงที่ของ "
                "สคริปต์ (CUT): %s" % (len(unmapped), len(snake_natives), ", ".join(unmapped)),
                "Codes/SnakeLogic/fragments/F2_dex_natives.txt",
                "the cut decision lives in scripts/native_chain_parity.py only - there is no "
                "committed record of what each cut native did, so the rebuild cannot be checked "
                "for completeness",
                "write the cut list with a one-line rationale per native into docs/ and reference "
                "the fragment line that proves the signature")

    # SNAKE loads libengine from App.<clinit>; AetherEngine loads from AetherApp.onCreate
    app_clinit = "Lcom/snake/App;-><clinit>()V" in text
    rep.fact("evidence.snake_loadlibrary_site", app_clinit)
    loader = os.path.join(A, "aether-android/aether-app/src/main/kotlin/com/aether/engine/app/AetherApp.kt")
    if os.path.exists(loader):
        ltext = read(loader)
        rep.fact("aether_loadlibrary_site", "AetherApp.onCreate -> EngineLoader.load (line %d)"
                 % line_of(ltext, "EngineLoader.load(this)"))
    return snake_natives, callers


# --------------------------------------------------------------------------
# C13 — internal contradictions found by reading the boot path
# --------------------------------------------------------------------------

def check_contradictions(rep, A):
    items = []

    # (1) bootstrapGameData: comment says package.conf is no longer fabricated,
    #     the code immediately below writes it.
    sm = os.path.join(A, "aether-core/src/main/kotlin/com/aether/SandboxManager.kt")
    t = read(sm)
    c1 = line_of(t, "generatePackageConf ถูก deprecate")
    c2 = line_of(t, "val bytes = generatePackageConf(targetPkg)")
    if c1 and c2:
        items.append(("C13-pkgconf-comment", "P2", "consistency",
            "SandboxManager.bootstrapGameData says in a comment that package.conf is no longer "
            "fabricated ('generatePackageConf ถูก deprecate') and then calls generatePackageConf() "
            "%d lines later to write it" % (c2 - c1),
            "คอมเมนต์ใน bootstrapGameData บอกว่าไม่ fabricate package.conf แล้ว (generatePackageConf "
            "ถูก deprecate) แต่โค้ดถัดไปอีก %d บรรทัดเรียก generatePackageConf() เพื่อเขียนไฟล์" % (c2 - c1),
            "SandboxManager.kt:%d (comment) vs :%d (call)" % (c1, c2),
            "two committed revisions of the same decision coexist; a reader cannot tell which "
            "behaviour is intended (the numbering in that block also skips step 2)",
            "delete the stale comment or the stale call"))

    # (2) AetherApp logs the wrong directory for nativeHydratePayloads
    ap = os.path.join(A, "aether-android/aether-app/src/main/kotlin/com/aether/engine/app/AetherApp.kt")
    t = read(ap)
    if "payloadDir.absolutePath" in t and "loaded from ${filesDir.absolutePath}" in t:
        items.append(("C13-hydrate-log", "P3", "consistency",
            "AetherApp passes payloadDir (dataDir/root/files) to nativeHydratePayloads but logs "
            "filesDir - the diagnostic line points at a directory that was never scanned",
            "AetherApp ส่ง payloadDir (dataDir/root/files) เข้า nativeHydratePayloads แต่ log ว่า "
            "filesDir - บรรทัดวินิจฉัยชี้ไปที่ dir ที่ไม่ได้ถูก scan",
            "AetherApp.kt:%d" % line_of(t, "nativeHydratePayloads:"),
            "misleading diagnostics during exactly the debugging session that needs them",
            "log payloadDir.absolutePath"))

    # (3) binder override: restore is called, set is never called
    orch = os.path.join(A, "aether-android/aether-app/src/main/kotlin/com/aether/engine/proxy/AetherOrchestrator.kt")
    t = read(orch)
    if "restoreBinderCallingPidOverride" in t and "setBinderCallingPidOverride" not in strip_comments(t):
        items.append(("C13-binder-restore-only", "P1", "consistency",
            "AetherOrchestrator.shutdown() restores the binder PID/UID overrides, but "
            "setBinderCallingPidOverride/setBinderCallingUidOverride are never called anywhere - "
            "the guest's binder calls always carry the HOST uid",
            "shutdown() คืนค่า binder PID/UID override ทั้งที่ setBinderCallingPidOverride/"
            "setBinderCallingUidOverride ไม่เคยถูกเรียก - binder call ของ guest จึงถือ uid ของ host เสมอ",
            "AetherOrchestrator.kt:%d" % line_of(t, "restoreBinderCallingPidOverride"),
            "every guest SDK binder call is attributed to com.aether; this is precisely the "
            "SecurityException storm the ProxyActivity 'guest thread firewall' was written to "
            "swallow, so the root cause is masked instead of fixed",
            "call setBinderCalling*Override when the guest identity is installed (VirtualAppContainer"
            ".init guest-upgrade path) and keep the restore in shutdown"))

    # (4) v1 fallback drops sandboxDir
    br = os.path.join(A, "aether-android/aether-app/src/main/kotlin/com/aether/engine/proxy/GuestRuntimeBridge.kt")
    t = read(br)
    va = os.path.join(A, "aether-android/aether-app/src/main/kotlin/com/aether/engine/proxy/VirtualAppLoader.kt")
    if "sandboxDir" in t and "sandboxDir" not in read(va):
        items.append(("C13-v1-drops-sandbox", "P2", "consistency",
            "GuestRuntimeBridge.loadV1 (the AUTO fallback) does not forward sandboxDir - "
            "VirtualAppLoader.load has no such parameter",
            "GuestRuntimeBridge.loadV1 (fallback ของโหมด AUTO) ไม่ส่ง sandboxDir ต่อ - "
            "VirtualAppLoader.load ไม่มีพารามิเตอร์นี้",
            "GuestRuntimeBridge.kt:%d vs VirtualAppLoader.kt:%d"
            % (line_of(t, "private fun loadV1"), line_of(read(va), "fun load(")),
            "when v2 fails the guest silently runs against the REAL installed app's data dir "
            "instead of the sandbox - a different filesystem view depending on which loader won",
            "add sandboxDir to VirtualAppLoader.load (same LoadedApk re-root) or refuse the "
            "fallback and report the v2 error"))

    # (5) VirtualFS re-pointed at the host inside the guest process
    pa = os.path.join(A, "aether-android/aether-app/src/main/kotlin/com/aether/engine/proxy/ProxyActivity.kt")
    t = read(pa)
    a = line_of(t, "VirtualAppContainer.init(this, targetPkg)")
    b = line_of(t, 'AetherOrchestrator.attachToProcess(')
    hard = line_of(t, 'ownPid, "", "com.aether"')
    if a and b and hard and b > a:
        items.append(("C13-vfs-clobber", "P1", "design",
            "ProxyActivity step 1 sets the guest identity (VirtualAppContainer.init(targetPkg)), "
            "then step 2 self-attaches with a HARD-CODED 'com.aether' package, which runs "
            "virtualFS.setupForApp(dataDir=/data/user/0/com.aether) and re-points the VirtualFS "
            "map at the host",
            "ProxyActivity ขั้น 1 ตั้ง identity ของ guest (VirtualAppContainer.init(targetPkg)) "
            "แล้วขั้น 2 self-attach ด้วย package ที่ hardcode ว่า 'com.aether' ซึ่งไปเรียก "
            "virtualFS.setupForApp(dataDir=/data/user/0/com.aether) ทับ map ของ guest",
            "ProxyActivity.kt:%d (guest init) then :%d (hard-coded self-attach)" % (a, hard),
            "the ordering undoes the guest's own data-dir mapping inside :pN; anything that reads "
            "VirtualFSWrapper after step 2 sees host paths",
            "pass targetPkg to attachToProcess when isVirtual, or run setupForApp with the guest "
            "data dir in virtual-target mode"))

    # (6) testVirtualFS reports the Kotlin map, not the native layer
    vb = os.path.join(A, "aether-android/aether-app/src/main/kotlin/com/aether/engine/proxy/VirtualFSWrapper.kt")
    vac = os.path.join(A, "aether-android/aether-app/src/main/kotlin/com/aether/engine/proxy/VirtualAppContainer.kt")
    if os.path.exists(vac) and "testVirtualFSResolve" in read(vac):
        items.append(("C13-vfs-selftest", "P2", "consistency",
            "VirtualAppContainer.testVirtualFSResolve() (exposed to the UI as 'testVirtualFS') "
            "resolves paths against the Kotlin-side VirtualFSWrapper map only - it cannot detect "
            "that the native redirect layer is an empty stub",
            "testVirtualFSResolve() (ที่ UI เรียกผ่าน 'testVirtualFS') resolve path กับ map ฝั่ง "
            "Kotlin เท่านั้น - ตรวจไม่พบว่า native redirect เป็น stub ว่าง",
            "VirtualAppContainer.kt:%d" % line_of(read(vac), "fun testVirtualFSResolve"),
            "the UI shows a green 'OK: ...' for a virtual FS that has no native effect (C4)",
            "have the self-test round-trip through the native layer (add a nativeResolve JNI entry "
            "that returns the resolved path) and print both results"))

    for row in items:
        rep.add(row[0], "C13 internal contradictions", row[1], row[2], row[3], row[4], row[5], row[6], row[7])
    rep.fact("contradictions", [r[0] for r in items])
    return items


# --------------------------------------------------------------------------
# C14 — process-pinned guest identity: the diagnostic button poisons :p0
# --------------------------------------------------------------------------

def check_pinned_identity(rep, A):
    bridge = os.path.join(A, "app/android/app/src/main/kotlin/com/aether/EngineBridge.kt")
    reg = os.path.join(A, "aether-android/aether-app/src/main/kotlin/com/aether/engine/proxy/GuestProcessRegistry.kt")
    pa = os.path.join(A, "aether-android/aether-app/src/main/kotlin/com/aether/engine/proxy/ProxyActivity.kt")
    bt, rt, pt = read(bridge), read(reg), read(pa)

    fake = re.search(r'"(com\.aether\.test\.[\w.]+)"', bt)
    slot0 = line_of(bt, "providerAuthority(0)")
    override = line_of(pt, "p3?.guestPkg?.takeIf")
    reject = line_of(rt, "Reject init:")
    setcfg = line_of(rt, "config = ClientConfig(pkg, slot")
    reset = re.search(r"fun (reset|clear)\w*\s*\(", rt)

    rep.fact("pinned.fake_package", fake.group(1) if fake else None)
    rep.fact("pinned.handshake_slot", 0 if slot0 else None)
    rep.fact("pinned.holder_has_reset", bool(reset))
    rep.fact("pinned.proxy_p3_first_line", override)

    orch = os.path.join(A, "aether-android/aether-app/src/main/kotlin/com/aether/engine/proxy/AetherOrchestrator.kt")
    ot = read(orch)
    else0 = line_of(ot, "if (slot >= 0) slot else 0")
    rep.fact("pinned.no_slot_fallback_line", else0)
    if fake and slot0 and override and not reset:
        rep.add("C14-pinned-identity", "C14 guest identity", "P0", "design",
                "the chain-check diagnostic binds :p0 to a fake package ('%s', hard-coded slot 0) "
                "and GuestProcessHolder.config is NEVER cleared, while ProxyActivity applies a "
                "p3-first rule that lets that stale config OVERRIDE the intent's target_package. "
                "Two live triggers reach the poisoned slot: (a) AetherOrchestrator still dispatches "
                "'else 0' -> P0 when allocate() finds no free slot, and (b) allocate() only skips a "
                "slot when getRunningAppProcesses() happens to report it (null/empty -> slot 0). "
                "Either way :p0 loads a package that is not installed and finishes"
                % (fake.group(1) if fake else "?"),
                "ปุ่ม chain-check ผูก :p0 ไว้กับ package ปลอม ('%s', slot 0 แบบ hardcode) และ "
                "GuestProcessHolder.config ไม่เคยถูกล้าง ขณะที่ ProxyActivity ใช้กฎ p3-first ให้ config "
                "เก่าตัวนั้นชนะ target_package ใน intent - มี 2 ทางที่พาไปเจอ slot ที่ปนเปื้อน: "
                "(ก) AetherOrchestrator ยัง dispatch 'else 0' -> P0 เมื่อ allocate() หา slot ว่างไม่เจอ "
                "(ข) allocate() ข้าม slot ก็ต่อเมื่อ getRunningAppProcesses() รายงานมัน (null/ว่าง -> ได้ "
                "slot 0) ทั้งสองทางทำให้ :p0 พยายามโหลด package ที่ไม่ได้ติดตั้งแล้ว finish ตัวเอง"
                % (fake.group(1) if fake else "?"),
                "EngineBridge.kt:%d (providerAuthority(0)) + :%d (fake pkg); "
                "GuestProcessRegistry.kt:%d (config set) / :%d (reject path, no reset); "
                "ProxyActivity.kt:%d (p3-first override); AetherOrchestrator.kt:%d ('else 0' fallback)"
                % (slot0, line_of(bt, fake.group(1)) if fake else 0, setcfg, reject, override, else0),
                "'press Play -> bounce back to the same screen' with no error shown; commit 8c51880 "
                "already records this failure mode (':p0 ที่ chaincheck ปินไว้') but only fixed the "
                "handshook branch - the no-slot fallback and the missing reset are still there",
                "three fixes, in order: (1) give GuestProcessHolder a reset()/rebind() and call it "
                "when handleInit sees a different package instead of rejecting; (2) make the "
                "diagnostic use its OWN slot (MAX_SLOTS-1) and never the guest's slot 0; "
                "(3) in ProxyActivity, treat a p3/intent mismatch as an error (finish with a "
                "reported reason) instead of silently loading the stale identity")
    return


# --------------------------------------------------------------------------
# C15 — diagnostics: the tools the user debugs with are themselves blind
# --------------------------------------------------------------------------

def check_diagnostics(rep, A):
    bridge = os.path.join(A, "app/android/app/src/main/kotlin/com/aether/EngineBridge.kt")
    bt = read(bridge)
    doc = line_of(bt, "latest crash report")
    reads_crash = "crash_logs" in bt or "crash_" in strip_comments(bt)
    rep.fact("diag.readDiag_claims_crash_report", bool(doc))
    rep.fact("diag.readDiag_reads_crash_dir", reads_crash)
    if doc and not reads_crash:
        rep.add("C15-diag-nocrash", "C15 diagnostics", "P1", "consistency",
                "EngineBridge.readDiag's own KDoc promises 'DiagLog trace.log + latest logcat dump "
                "+ latest crash report', but the implementation reads only diag/trace.log and "
                "diag/logcat_* - CrashHandler writes to filesDir/crash_logs/crash_<ts>.log, which "
                "the UI never surfaces",
                "KDoc ของ readDiag สัญญาว่าจะคืน 'trace.log + logcat + crash report ล่าสุด' "
                "แต่โค้ดอ่านแค่ diag/trace.log กับ diag/logcat_* - ทั้งที่ CrashHandler เขียนไว้ที่ "
                "filesDir/crash_logs/crash_<ts>.log ซึ่ง UI ไม่เคยแสดง",
                "EngineBridge.kt:%d (doc) vs CrashHandler.kt:52 (CRASH_DIR_NAME=\"crash_logs\")" % doc,
                "the crash that kills :pN is invisible from the Diag button - the operator has to "
                "pull the app's data dir by hand to see why the guest died",
                "append the newest crash_logs/crash_*.log to the readDiag output (it is 3 lines)")

    pa = os.path.join(A, "aether-android/aether-app/src/main/kotlin/com/aether/engine/proxy/ProxyActivity.kt")
    pt = strip_comments(read(pa))
    init_ln = line_of(pt, "DiagLog.init(applicationContext)")
    first_d = line_of(pt, "DiagLog.d(")
    identity_d = line_of(pt, "identity: p3=")
    rep.fact("diag.ProxyActivity_init_line", init_ln)
    rep.fact("diag.first_DiagLog_call_line", first_d)
    if init_ln and first_d and first_d < init_ln:
        rep.add("C15-diag-order", "C15 diagnostics", "P1", "design",
                "ProxyActivity emits DiagLog lines BEFORE DiagLog.init() runs (first call at line "
                "%d, init at line %d); DiagLog.d() with dir==null only writes to logcat, so those "
                "lines never reach trace.log" % (first_d, init_ln),
                "ProxyActivity เรียก DiagLog ก่อน DiagLog.init() (เรียกครั้งแรกบรรทัด %d, init บรรทัด "
                "%d) - DiagLog.d() ตอน dir==null จะออกแค่ logcat จึงไม่ลง trace.log" % (first_d, init_ln),
                "ProxyActivity.kt:%d vs :%d%s" % (first_d, init_ln,
                    " (the dropped line is the p3/intent identity mismatch at :%d)" % identity_d
                    if identity_d else ""),
                "the single most important diagnostic for C14 - 'identity: p3=X overrides intent=Y' "
                "- is exactly one of the lines that gets dropped, so trace.log can look clean while "
                "the guest identity is wrong",
                "move DiagLog.init(applicationContext) to the first statement of onCreate")

    fw = line_of(read(pa), "installGuestThreadFirewall")
    if fw:
        rep.add("C15-firewall-swallows", "C15 diagnostics", "P2", "design",
                "ProxyActivity installs a process-wide uncaught-exception handler that deliberately "
                "does NOT chain to the previous handler while a guest is active, so guest crashes on "
                "ANY thread (including main) are swallowed after being logged to trace.log",
                "ProxyActivity ตั้ง uncaught-exception handler ทั้ง process ที่จงใจไม่ส่งต่อให้ handler "
                "เดิมขณะ guest ยัง active - crash ของ guest ทุก thread (รวม main) จึงถูกกลืนหลังบันทึก log",
                "ProxyActivity.kt:%d (installGuestThreadFirewall)" % fw,
                "combined with C2 (3 silent finish paths) and C15-diag-nocrash, a failed boot leaves "
                "no user-visible signal at all - which is why the symptom reads as 'กดแล้วเด้งกลับ'",
                "keep the firewall for known-benign SDK exceptions (SecurityException from guest "
                "background threads) but re-throw everything else, and record the decision in "
                "trace.log with a counter that readDiag shows")
    return


# --------------------------------------------------------------------------
# C16 — what the committed evidence can and cannot prove
# --------------------------------------------------------------------------

def check_evidence_attribution(rep, A, E):
    f2 = os.path.join(E, "fragments/F2_dex_natives.txt")
    if not os.path.exists(f2):
        return
    text = read(f2)
    per_native_callers = bool(re.search(r"native \(\S+\) \w+\n\s+callers\s*:", text))
    callers = re.findall(r"<- (L[\w/$]+;->[\w<>$]+)", text)
    rep.fact("evidence.F2_per_native_caller_attribution", per_native_callers)
    rep.fact("evidence.F2_class_level_callers", len(set(callers)))
    jv0 = "Landroidx/appcompat/view/menu/jv0;" in text
    b8 = "Landroidx/appcompat/view/menu/b8;" in text
    yu0 = "Landroidx/appcompat/view/menu/yu0;" in text
    rep.fact("evidence.F2_has_jv0", jv0)
    rep.fact("evidence.F2_has_b8", b8)
    rep.fact("evidence.F2_has_yu0", yu0)

    cited_lines = set()
    for path in walk(A, (".kt",)):
        for m in re.finditer(r"(jv0|a7|b8|yu0|p3|tz|j8|bt0|ob|lv0|zg0|a5|r1|kl0|il0)\.(?:java:)?(\d+)",
                             read(path)):
            cited_lines.add("%s:%s" % (m.group(1), m.group(2)))
    rep.fact("evidence.line_number_claims", sorted(cited_lines))
    if cited_lines and not per_native_callers:
        rep.add("C16-unverifiable-placement", "C16 evidence attribution", "P1", "evidence",
                "the code cites %d decompiler line numbers (%s) as the authority for WHERE each hop "
                "belongs, but the committed evidence (Codes/SnakeLogic/fragments/F2) attributes "
                "callers only at CLASS level (%d distinct caller methods of com.snake.helper.Native) "
                "and never maps a caller to a specific native; the per-hop transcript "
                "(NATIVE_CALLSITE_MAP.md) is not committed in either repo"
                % (len(cited_lines), ", ".join(sorted(cited_lines)[:8]), len(set(callers))),
                "โค้ดอ้างหมายเลขบรรทัดจาก decompiler %d จุด (%s) เป็นหลักฐานว่า hop ไหนต้องวางที่ไหน "
                "แต่หลักฐานที่ commit ไว้ (F2) ระบุ caller แค่ระดับ CLASS (%d method) และไม่ map ว่า "
                "caller ไหนเรียก native ตัวไหน; transcript (NATIVE_CALLSITE_MAP.md) ไม่ได้ commit ไว้ใน "
                "repo ใดเลย"
                % (len(cited_lines), ", ".join(sorted(cited_lines)[:8]), len(set(callers))),
                "Codes/SnakeLogic/fragments/F2_dex_natives.txt (classes jv0/b8/yu0 ARE present, "
                "line numbers are NOT)",
                "the placement gate (scripts/native_chain_parity.py) enforces positions that nobody "
                "can re-verify; if a position is wrong the gate actively prevents the correct fix",
                "commit the transcript (or the jadx output for the 5 chain natives) under "
                "reference/ and cite fragment line numbers instead of decompiler line numbers")
    return


# --------------------------------------------------------------------------

SEV_ORDER = {"P0": 0, "P1": 1, "P2": 2, "P3": 3}


def main(argv=None):
    ap = argparse.ArgumentParser()
    ap.add_argument("--aether", default=os.environ.get("AETHER_ROOT", "/home/user/AetherEngine"))
    ap.add_argument("--evidence", default=os.environ.get("EVIDENCE_ROOT", "/home/user/Codes/SnakeLogic"))
    ap.add_argument("--out", default=os.path.dirname(os.path.dirname(os.path.abspath(__file__))))
    argv = ap.parse_args(argv)

    A, E, OUT = argv.aether, argv.evidence, argv.out
    for label, path in (("aether", A), ("evidence", E)):
        if not os.path.isdir(path):
            print("FATAL: %s root not found: %s" % (label, path), file=sys.stderr)
            return 2

    rep = Report()
    rep.fact("schema", SCHEMA)
    rep.fact("aether_root", os.path.basename(A.rstrip("/")))
    rep.fact("evidence_root", "Codes/SnakeLogic")

    check_channel_parity(rep, A)
    check_bounce_paths(rep, A)
    kt, table, callers, dead = check_jni(rep, A)
    status = check_native_impl(rep, A, table, kt, callers)
    check_native_orphans(rep, A)
    check_hidden_api(rep, A)
    check_manifest(rep, A, E)
    check_lifecycle(rep, A)
    check_hook_a(rep, A)
    check_gates(rep, A)
    check_tests(rep, A)
    check_evidence_mapping(rep, A, E)
    check_contradictions(rep, A)
    check_pinned_identity(rep, A)
    check_diagnostics(rep, A)
    check_evidence_attribution(rep, A, E)

    rep.findings.sort(key=lambda f: (SEV_ORDER.get(f["severity"], 9), f["check"], f["id"]))

    os.makedirs(OUT, exist_ok=True)
    csv_path = os.path.join(OUT, "findings.csv")
    with open(csv_path, "w", newline="", encoding="utf-8") as fh:
        w = csv.DictWriter(fh, fieldnames=list(rep.findings[0].keys()) if rep.findings else
                           ["id", "check", "severity", "kind", "title_en", "title_th",
                            "evidence", "impact", "fix"])
        w.writeheader()
        for row in rep.findings:
            w.writerow(row)
    with open(os.path.join(OUT, "audit_facts.json"), "w", encoding="utf-8") as fh:
        json.dump({"schema": SCHEMA, "facts": rep.facts,
                   "finding_ids": [f["id"] for f in rep.findings]},
                  fh, ensure_ascii=False, indent=1, sort_keys=True)
        fh.write("\n")

    counts = {}
    for f in rep.findings:
        counts[f["severity"]] = counts.get(f["severity"], 0) + 1
    lines = []
    lines.append("AetherEngine full-system audit (%s)" % SCHEMA)
    lines.append("findings: %d  (P0=%d P1=%d P2=%d P3=%d)"
                 % (len(rep.findings), counts.get("P0", 0), counts.get("P1", 0),
                    counts.get("P2", 0), counts.get("P3", 0)))
    lines.append("")
    for f in rep.findings:
        lines.append("[%s] %-8s %s" % (f["severity"], f["check"].split()[0], f["id"]))
        lines.append("    EN: %s" % f["title_en"])
        lines.append("    TH: %s" % f["title_th"])
        lines.append("    at: %s" % f["evidence"])
        lines.append("")
    digest = "\n".join(lines)
    with open(os.path.join(OUT, "AUDIT_SUMMARY.txt"), "w", encoding="utf-8") as fh:
        fh.write(digest + "\n")
    print(digest)
    return 0


if __name__ == "__main__":
    sys.exit(main())
