# SNAKE.apk — cross-fragment linkage

This repository keeps four artifacts that describe one application: an APK, two
loose native libraries and a Flutter engine. Each existing pipeline (Ghidra
headless, blutter) reports on *one* of them, so the interesting facts sit in
separate piles and never meet. This document is the join.

Every row is derived from the committed bytes by `analysis_scripts/`; the
`VERIFICATION.txt` next to it re-checks the load-bearing claims and the CI job
fails if any of them stops holding.


_Generated 1970-01-01T00:00:00Z_
_Built by `analysis_scripts/build_linkage.py` from inputs fingerprinted `c24ca0675108a48b194bcdbb686a52d6`. Every row below is a function of the committed bytes: re-running the script on the same inputs reproduces this file exactly (set `SOURCE_DATE_EPOCH` to pin the stamp above)._

## Link summary

- nodes: **93**   links: **136**
- confidence: proven=111, strong=9, probable=15, candidate=1

| fragment pair | links |
|---|---|
| libapp → libapp | 33 |
| libengine → libengine | 22 |
| dex → dex | 18 |
| tool → libengine | 10 |
| libengine → dex | 7 |
| tool → libapp | 7 |
| libapp → libflutter | 6 |
| apk → libapp | 6 |
| apk → apk | 5 |
| libapp → dex | 4 |
| apk → repo | 3 |
| repo → apk | 3 |
| libapp → apk | 3 |
| dex → repo | 2 |
| dex → libengine | 2 |
| apk → dex | 1 |
| libengine → apk | 1 |
| apk → libflutter | 1 |
| libapp → libengine | 1 |
| tool → libflutter | 1 |

## Gaps & inconsistencies

- **[low] the Java callers of Lcom/snake/helper/Native; live inside framework namespaces**  
  evidence: `20 caller(s) across 10 class(es), 7 of them under Landroidx/appcompat/view/menu/b8;, Landroidx/appcompat/view/menu/jv0;, Landroidx/appcompat/view/menu/ne0;, Landroidx/appcompat/view/menu/p60;, Landroidx/appcompat/view/menu/vx;, Landroidx/appcompat/view/menu/yu0;, Landroidx/appcompat/view/menu/z10;; e.g. Landroidx/appcompat/view/menu/b8;->callActivityOnResume(Landroid/app/Activity;)V`  
  impact: the sample's own code was renamed into androidx.* (identifier obfuscation), so caller class names say nothing about provenance — the invoke offsets recorded in F2 are the reliable evidence
- **[medium] Lcom/snake/helper/flagger; declares natives that no Java code calls**  
  evidence: `0 invoke sites in classes.dex`  
  impact: either dead code, or reached reflectively/from Dart
- **[medium] libengine.so contains none of the JNI names that classes.dex declares**  
  evidence: `48 of the 58 identifiers taken from the dex (JNI class names in both forms, the 13 method names, their descriptors and every mangled Java_* export name) were searched as exact byte sequences in the whole 8.5 MB image — the 10 shorter than 4 characters are excluded because a 2-3 byte sequence matches by chance at that size: 0 hits. The image is not string-free — it holds 1233 maximal runs of printable ASCII 0x20-0x7e of length >= 6 (GNU 'strings -n 6' reports 1383 because it also counts TAB, which here is mostly instruction bytes): clang banner, SONAME/NEEDED, xCrash and libc++ text — but not one JNI name is among them. Word-pattern upper bounds: {'svc0_encoding': 25805, 'ldr_x_reg_0x6b8': 6, 'movz_0x14000000': 12199}`  
  impact: the JNINativeMethod arrays are built at run time, so the 13 natives can be counted and located but not named statically — see the dynamic recipe in LINKAGE.md
- **[low] the Ghidra postScript's symbol-based RegisterNatives report is empty by construction**  
  evidence: `ghidra_scripts/ExtractJNI.java still writes 05_RegisterNatives_xrefs.txt from dumpXrefsToSymbol("RegisterNatives"), but the binary has 136 imports and none of them is a JNI function — JNI is reached through the JNIEnv table (slot 215 = +0x6b8), so that file will always say '(symbol not found)'`  
  impact: fixed in the same script: pass 07_JNIEnv_slot_sites.txt now scans 'ldr Xt,[Xb,#0x6b8]' + 'blr Xt' over the whole image and reports the containing function, the nMethods immediate and any FindClass in the same function; ghidra-analyze.yml fails if that pass finds no site. Its output must agree with findings/fragments/F4d_libengine_regnatives_windows.asm (3 sites, nMethods 1, 2, 10)
- **[high] a link we published earlier was a substring false positive**  
  evidence: `an earlier revision of this graph drew a 'method_channel_error_code_for' from the Dart string 'helperError' (libapp.so+0x4343a) to the dex class Lcom/snake/helper/Native;, Lcom/snake/helper/flagger; because the string contains 'helper'. blutter shows 'helperError' is enum member 0 of 11 in Obj!_WF (siblings: helperError, icon, input, prefixIcon, suffixIcon, prefix, suffix, label, hint, counter, container), i.e. Flutter framework text`  
  impact: the edge is removed; the platform-channel claim now rests only on the MethodCall closures blutter disassembled (see the dart:closure:* nodes), and the rule is recorded: a substring match is never link evidence - the pool context decides
- **[medium] the 'C2 request headers' reading of four libapp.so strings is not supported**  
  evidence: `clientAuth, apiToken, clientVersion, signature occur as raw byte runs in libapp.so but none of them is an object-pool string; their byte neighbourhoods are Dart identifier strings (e.g. init:sje, textable, _sentinel@...), and the artifact's own C2_headers.txt grep returned 0 lines`  
  impact: they are obfuscated Dart identifiers, not HTTP header names; any claim that the C2 request carries these headers would be unsupported

## Reading order

The sample is `com.snake` versionName **2.2.6** (minSdk 28, targetSdk 35), a Flutter app whose launcher activity is `com.Entry` and whose `Application` class is `com.snake.App`.

**The chain that ties the fragments together**

1. `Lcom/snake/App;-><clinit>()V` calls `Ljava/lang/System;->loadLibrary(Ljava/lang/String;)V` at `classes.dex+0x2b6c2e` — the name is **not** in the dex string pool: a `byte[]` is built with `fill-array-data` and wrapped in `new String([B)`, and the 6 payload bytes at `classes.dex+0x2b6c40` are `656e67696e65` = **`engine`**, i.e. `libengine.so`.
2. `Lio/flutter/embedding/engine/FlutterJNI;->loadLibrary()V` calls `Ljava/lang/System;->loadLibrary(Ljava/lang/String;)V` at `classes.dex+0x2bafda` — the name is a plain `const-string` at `classes.dex+0x2bafd6` = **`flutter`**, i.e. `libflutter.so`.
3. `binaries/libengine.so` exports 0 `Java_*` symbol(s) and `JNI_OnLoad` at `0xf3fa0`, while `classes.dex` declares 13 `ACC_NATIVE` methods in `Lcom/snake/helper/Native;`, `Lcom/snake/helper/flagger;`. With no exported name to bind to, they can only be registered through `RegisterNatives`.
4. 3 call sites reach `RegisterNatives` through the `JNIEnv` function table (slot 215 = `+0x6b8`): nMethods = 1, 2, 10 = **13**, exactly the 13 declarations in the dex.
5. The site at `0xb0140` registers 1 method for **`Lcom/snake/helper/Native;`** — and the decode-loop bounds [8] pick out `pjowqpxe(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V` (each decode-loop bound matches exactly one method name of the assigned class). No FindClass inside the decoded window, so no class name is materialised here — the class handle is fetched elsewhere (a cached global reference or an outer frame). After the FindClass site is accounted for, exactly 1 declaration remains and it belongs to `Lcom/snake/helper/Native;`.
6. The site at `0xb40a8` registers 2 methods for **`Lcom/snake/helper/flagger;`** — and the decode-loop bounds [2, 3] pick out `na()V`, `nb()V` (nMethods equals the class's whole declaration list). No FindClass inside the decoded window, so no class name is materialised here — the class handle is fetched elsewhere (a cached global reference or an outer frame). After the FindClass site is accounted for, exactly 2 declarations remain and they all belong to `Lcom/snake/helper/flagger;`.
7. The site at `0xf3a08` registers 10 methods for **`Lcom/snake/helper/Native;`**. FindClass at `0xf39e4`; the name is built by a 23-iteration byte-decode loop, so the JNI class name is 23 characters (other candidates: com/snake/helper/flagger=24).
8. That attribution consumes every declaration exactly — `com/snake/helper/Native` = 10 + 1 = 11; `com/snake/helper/flagger` = 2. Total 13 registered vs 13 declared, with 0 declarations left unattributed.
9. 1 registered function pointer is recoverable statically and lands in `.mytext` (`0x81eeac`+`0xf4`), a hand-named executable section that no toolchain emits: 0x81eeb0. The stub at `0x81eeb4` `blr`s JNIEnv slot `+0x38` (`FromReflectedMethod`) at `0x81eed4` with x1 = the incoming x3, forwarding another parameter to `#0xb01c4`. `Lcom/snake/helper/Native;->update(Ljava/lang/Object;Ljava/lang/reflect/Method;)V` is the only one of the 13 declarations whose second Java parameter is a `java.lang.reflect.Method`, so the shapes agree — the strongest static statement available about what that pointer does.
10. `JNI_OnLoad` registers nothing itself. It issues 2 raw `svc #0` `mmap` calls with `PROT_READ|WRITE|EXEC` at 0xf4018, 0xf411c, materialises the AArch64 unconditional-branch opcode `0x14000000` as an immediate at 0xf4040, 0xf4090, writes it into the fresh page and branches there — a trampoline built at load time, which is why no static tool sees the real registration code.
11. On the Dart side, `libapp.so` carries snapshot version `80a49c7111088100a233b2ae788e1f48` at 0x214, 0x40d4, and the same 32 bytes appear in `libflutter.so` at 0x1eafd4. All 11 `PlatformConfigurationNativeApi::*` names the snapshot calls also occur in that engine — two independent signals that the pair is consistent, which is the precondition for blutter to produce meaningful output.
12. The Dart snapshot names the Java side directly: `com.snake` at `libapp.so+0x3bd3a`. The platform-channel half is visible in blutter's disassembly of the same snapshot: 3 closures whose signature takes a `MethodCall` (`_pfc`, `_cec`, `_eec`) in `output/blutter/asm/Ieg.dart`. An earlier draft of this document also read `helperError` (libapp.so+0x4343a) as an error code of that surface because it contains the substring `helper`; the object pool shows it is enum member 0 of 11 in Obj!_WF (siblings: helperError, icon, input, prefixIcon, suffixIcon, prefix, suffix, label, hint, counter, container), i.e. Flutter's own text-field decorator, so that link was withdrawn.
13. The same snapshot hard-codes `https://rest.snakeseller.com/api/request/`, `https://www.snakeengine.com/topup/` plus social surfaces (https://discord.com/invite/, https://t.me/, https://wa.me/, https://www.facebook.com/) that match the 5 SVG icons packaged under `assets/flutter_assets/assets/`.
14. Ghidra's headless run over `binaries/libengine.so` agrees with this repository's parse on 26/26 sections and on the `.dynsym` split (136 undefined + 17 defined), and 44/44 of its `.init_array` targets are the same addresses we derived from `.rela.dyn` addends once its 0x100000 image base is subtracted — a delta measured from 46 anchors that all agree, not assumed. Its decompiled `JNI_OnLoad` performs 0 loads through the `JNIEnv` registration slots and calls 5 functions, none of them a JNI helper, while 10 of its `mmap` calls ask for RWX anonymous memory; 44/44 constructors came back 'timeout' or 'no function', which is the same wall our own disassembly hits. blutter's object pool is a second coordinate system for `binaries/libapp.so`: 15 of the 27 strings our byte scan extracted are exact pool entries (both C2 endpoints among them, at pp+0x139d8, pp+0x17790), and the pool shows two things a byte scan cannot: a `/proc/self/maps` reader at pp+0xe448 with its line-parsing regex two slots away, and the store links kept as regex-escaped *patterns* rather than links. It also disproved one of our own links, which is why the correction is recorded above instead of quietly dropped. Its build log closes the last gap: 'Dart version: 3.5.4, Snapshot: 80a49c7111088100a233b2ae788e1f48' is the same 32-byte version we read out of `binaries/libapp.so` and `flutter_libs/libflutter.so`, so the dump is provably about these bytes.
15. All 3/3 loose `.so` copies in this repo are byte-identical (sha256) to the APK members they came from, so every statement above is about one single build.


## Mechanism & verification

### How each link was obtained

| question | answer | why a naive extractor misses it |
|---|---|---|
| which library does the dex load? | `engine`, `flutter` | at least one name is a `fill-array-data` byte payload, absent from the string pool |
| who declares natives? | 13 custom + 41 Flutter | `field_idx_diff`/`method_idx_diff` are *per list* deltas — accumulate them across lists and every method index drifts |
| how are they bound? | `RegisterNatives` via `JNIEnv+0x6b8` | JNI functions are never imported symbols; a symbol or xref search finds nothing |
| how many are bound? | 13 across 3 sites | nMethods is an immediate in `w3`, sometimes materialised *after* the slot load |
| where do the handlers live? | 1 recovered fnPtr in `.mytext` | the remaining tables are built on the stack or in `.bss` at runtime |
| what do the JNI names look like in the binary? | nowhere | 48 dex identifiers searched as exact bytes in binaries/libengine.so: 0 hits, although the image holds 1233 printable-ASCII runs >= 6 chars (`strings -n 6` says 1383, it also counts TAB) |
| are the init constructors real? | 44 pointers, all zero on disk | the values exist only as `R_AARCH64_RELATIVE` addends |
| does the Dart snapshot match the engine? | yes — version `80a49c7111088100a233b2ae788e1f48` and 11/11 engine API names | the 32-char version array is not NUL-terminated in `libapp.so`, so `strings` shows it glued to the feature string |
| does the Dart side know the Java side? | `com.snake`, plus 3 Dart closures taking a `MethodCall` (`_pfc`, `_cec`, `_eec`) | the identifiers sit in the Dart string pool, not in any symbol table |
| do two other tools agree? | Ghidra: 26/26 sections, 136+17 symbols, 44/44 init targets after a measured 0x100000 rebase, 0 JNIEnv-slot loads in JNI_OnLoad; blutter: 15 strings pool-exact, snapshot 80a49c7111088100... = the bytes of both libraries, Dart 3.5.4 | each tool reports in its own coordinates - Ghidra's addresses are all +0x100000 and blutter's are pool offsets - so quoting either without translating produces numbers that match nothing |
| what did the artifacts change? | one link withdrawn (`helperError` is enum member 0 of 11 in Obj!_WF (siblings: helperError, icon, input, prefixIcon, suffixIcon, prefix, suffix, label, hint, counter, container)), the C2-header reading rejected, store links reclassified as regexes, the `strings` count difference explained (TAB) | a substring match across two fragments looks like a link and is the easiest false positive to publish |

### Verification

45 checks re-run against the bytes; all must pass:

| result | check | detail |
|---|---|---|
| PASS | provenance lib/arm64-v8a/libapp.so | apk sha256 == repo sha256 == 2d3577fbaaacc7cb63e5b04a5a21572eeee1e0d55b223941d6a5496a91a427c8 |
| PASS | provenance lib/arm64-v8a/libengine.so | apk sha256 == repo sha256 == f5d751e6bde8f0595eda9836338e845b029a41d2362743a2a4619ba99f41e3be |
| PASS | provenance lib/arm64-v8a/libflutter.so | apk sha256 == repo sha256 == 0baa710d6b7f7de2f8bcc05aa2950bab2989f3a4c95bc7f7bcc23ce84626ee52 |
| PASS | APK zip integrity | zipfile.testzip() returned None |
| PASS | dex loads the library named "engine" | loader sites: ['0x2b6c2e']; SONAME=libengine.so |
| PASS | fill-array-data payload re-read from classes.dex decodes to the library name | classes.dex+0x2b6c40 = 656e67696e65 (b'engine') |
| PASS | manifest application class is the class that loads the native library | manifest=Lcom/snake/App;, loader classes=['Lcom/snake/App;', 'Lio/flutter/embedding/engine/FlutterJNI;'] |
| PASS | no Java_* exports in libengine.so | found [] |
| PASS | no Java_* exports in libflutter.so | found [] |
| PASS | RegisterNatives total == custom native declarations | 13 registered vs 13 declared |
| PASS | .mytext section exists and is executable | section=Section(name='.mytext', addr=8515244, offset=8515244, size=244, flags=6, type='SHT_PROGBITS') |
| PASS | every fnPtr recovered into .mytext really lies inside .mytext | pointers=['0x81eeb0'], range=0x81eeac..0x81efa0 |
| PASS | .init_array values come from relocations, not file bytes | 44/44 from R_AARCH64_RELATIVE |
| PASS | every .init_array target lands in an executable section | sections=['.text'] |
| PASS | libapp.so snapshot version also present in libflutter.so | libapp=['80a49c7111088100a233b2ae788e1f48'] paired=['80a49c7111088100a233b2ae788e1f48'] offsets={'80a49c7111088100a233b2ae788e1f48': ['0x1eafd4']} |
| PASS | both libapp.so snapshot headers carry the same version | 2 records: _kDartVmSnapshotData@0x214, _kDartIsolateSnapshotData@0x40d4 |
| PASS | no JNI identifier from classes.dex occurs in libengine.so | 48/58 identifiers searched (class names in both forms, method names, descriptors, mangled Java_* names) -> 0 present; the 10 skipped terms are <= 3 chars (['()V', 'ac', 'awl', 'chl', 'djp', 'eio', 'i', 'ic', 'na', 'nb']) and would match by chance in an 8.5 MB image |
| PASS | the Dart snapshot hard-codes the manifest package | `com.snake` occurs 1x in libapp.so at 0x3bd3a |
| PASS | no link is drawn from a substring identity match (helperError retraction) | 1 Dart strings contain 'helper' ([('helperError', '0x4343a')]) and the dex declares ['Lcom/snake/helper/Native;', 'Lcom/snake/helper/flagger;'], but substring agreement is not evidence: 0 such edge(s) exist |
| PASS | every PlatformConfigurationNativeApi name in libapp.so exists in libflutter.so | 11 referenced by the snapshot, 11 also in the engine, missing=[] |
| PASS | libflutter.so exports JNI_OnLoad (so it can bind its 41 natives dynamically) | exports=46, Java_* exports=0 |
| PASS | every RegisterNatives site is attributed to exactly one dex class, with none left over | 0xb0140(n=1)->com/snake/helper/Native by count-elimination; 0xb40a8(n=2)->com/snake/helper/flagger by count-elimination; 0xf3a08(n=10)->com/snake/helper/Native by findclass-name-length; leftover declarations={'Lcom/snake/helper/Native;': 0, 'Lcom/snake/helper/flagger;': 0} |
| PASS | every byte-decode loop bound at a registration site matches an identifier of its class | 0xb0140:{8: "method name(s) ['pjowqpxe']"}; 0xb40a8:{2: "method name(s) ['na', 'nb']", 3: "signature(s) ['()V']"}; 0xf3a08:{23: "the 23-char JNI class name 'com/snake/helper/Native'"} |
| PASS | the length inference names at least one registered method | ['Lcom/snake/helper/Native;->pjowqpxe', 'Lcom/snake/helper/flagger;->na', 'Lcom/snake/helper/flagger;->nb'] |
| PASS | .mytext converts an incoming Method and exactly one declared native takes a Method | native=Lcom/snake/helper/Native;->update(Ljava/lang/Object;Ljava/lang/reflect/Method;)V; .mytext FromReflectedMethod call(s)=[('0x81eed4', 'x3')] |
| PASS | Ghidra's image-base delta is measured from anchors that all agree | 46 anchors (JNI_OnLoad + .init_array address + 44 slots) -> delta 0x100000, consistent=True |
| PASS | Ghidra's .init_array targets equal our .rela.dyn addends | 44 of Ghidra's 44 targets equal our 44 addends after -0x100000 |
| PASS | the artifact's readelf section table equals our pyelftools parse | 26/26 shared sections agree on addr+size; 0 only-in-one; disagreements=none |
| PASS | the artifact's .dynsym counts equal ours | readelf 154 entries = 136 UNDEF + 17 DEFINED + null; ours 136 UNDEF + 17 DEFINED |
| PASS | Ghidra's JNI_OnLoad rebases exactly onto our JNI_OnLoad | Ghidra 0x1f3fa0 - 0x100000 = 0xf3fa0; our .dynsym 0xf3fa0 |
| PASS | Ghidra's decompiled JNI_OnLoad loads no JNIEnv registration slot | hits {'0x6b8': 0, '0x30': 0, '0x38': 0} across 12,280 bytes of decompiled C; callees ['rand', 'FUN_0091ad58', '__stack_chk_fail', 'strlen', 'sysconf'] |
| PASS | Ghidra's decompiled JNI_OnLoad maps RWX memory and writes branch opcodes | 10 mmap calls with prot [7] flags ['0x22']; 10 stores of 0x14000000|imm26 |
| PASS | Ghidra finds neither a RegisterNatives symbol nor a Java_* string | 05 says (symbol not found), 06 has 0 lines; our own count of Java_* exports is 0 |
| PASS | every non-TAB string in the artifact's `strings -n 8` is in our scan too | artifact-only runs = 0; artifact 886 runs vs ours 885 - the gap is TAB (0x09), which GNU strings counts and we do not |
| PASS | every C2 endpoint we found by bytes is an exact object-pool string | 2/2: https://rest.snakeseller.com/api/request/ file 0x43fe5 = pp+0x139d8; https://www.snakeengine.com/topup/ file 0x3d50e = pp+0x17790 |
| PASS | the package name is confirmed by three independent sources | manifest 'com.snake'; pool ['pp+0xe458']; raw bytes ['0x3bd3a'] |
| PASS | blutter confirms the retracted string is Flutter framework text | helperError -> enum member 0 of 11 in Obj!_WF (siblings: helperError, icon, input, prefixIcon, suffixIcon, prefix, suffix, label, hint, counter, container) |
| PASS | the reclassified framework enum is recorded in the graph | 1 reclassification edge(s) |
| PASS | the Dart pool holds /proc/self/maps beside a maps-parsing regex | pp+0xe448 and pp+0xe460, 3 slots apart (adjacency, not a call graph) |
| PASS | blutter's asm holds real MethodCall handlers in the C2 library | 3 handler(s) in ['output/blutter/asm/Ieg.dart']: _pfc (class _dX, line 379); _cec (class _hX, line 468); _eec (class _hX, line 471) |
| PASS | blutter's build log names the same snapshot version we read from both binaries | log: Dart 3.5.4 snapshot 80a49c7111088100a233b2ae788e1f48 target android arm64; libapp.so: ['80a49c7111088100a233b2ae788e1f48']; libflutter.so: ['80a49c7111088100a233b2ae788e1f48'] |
| PASS | blutter's build log records the same snapshot feature string as libapp.so | log 'product no-code_comments dwarf_stack_traces_mode dedup_instr'... vs ours 'product no-code_comments dwarf_stack_traces_mode dedup_instr'... |
| PASS | the four alleged C2 headers are not object-pool strings | pool hits: clientAuth=0, apiToken=0, clientVersion=0, signature=0; C2_headers.txt lines=0 |
| PASS | no edge references an undeclared node | 0 dangling |
| PASS | C2 endpoint extracted from libapp.so | ['https://rest.snakeseller.com/api/request/', 'https://www.snakeengine.com/topup/'] |

### What static analysis cannot close

The 3 registration sites give the *number* of natives and, for one of
them, the class-name length; `.mytext` gives the shape of one handler. The names and
signatures themselves are decrypted at runtime — 48 identifiers taken straight
from `classes.dex` (JNI class names, method names, descriptors, mangled `Java_*` names)
produce **0 hits** in `binaries/libengine.so`, even though that image contains 1233 printable-ASCII
runs of 6+ characters (0x20-0x7e; GNU `strings -n 6` counts 1383 because it also
accepts TAB, which in an AArch64 image is mostly instruction bytes). To finish the join, capture `RegisterNatives` dynamically:
`analysis_scripts/frida_dump_register_natives.js` hooks the `JNIEnv` slot, prints
`class / name / signature / fnPtr / module+offset` for all 13 entries and emits
exactly the columns of `links.csv`, so a dynamic capture can be appended to this graph
without manual transcription.

The two committed tool artifacts narrow the gap but do not close it, and each has a limit that
is recorded rather than glossed over: Ghidra's own run produced 4,751 ERROR lines and
decompiled none of the 44 constructors, so nothing in its output names the 13 registered
natives either. blutter's `pp.txt`/`objs.txt` carry no version at all - the dump is attributable
only because `blutter_build.log` in the same zip prints `Snapshot: 80a49c7111088100a233b2ae788e1f48` (Dart 3.5.4),
which matches the bytes of both libraries. Pool adjacency is reported as adjacency:
`/proc/self/maps`, the package name and the maps regex sit within four slots of each other,
which shows one routine allocated them, not that they call each other.


## Links

### `agrees_on_JNI_OnLoad_address`

| source | destination | confidence | evidence |
|---|---|---|---|
| `Ghidra 12.1.2 headless + ExtractJNI.java (evidence_ghidra.zip)` (tool) | `libengine.so:JNI_OnLoad` (libengine) | proven | Ghidra reports 0x1f3fa0; our .dynsym reports 0xf3fa0; the 0x100000 difference is Ghidra's image base and was MEASURED from 46 anchors that all agree (JNI_OnLoad, the .init_array address and all 44 slots) |

### `analysed`

| source | destination | confidence | evidence |
|---|---|---|---|
| `Ghidra 12.1.2 headless + ExtractJNI.java (evidence_ghidra.zip)` (tool) | `libengine.so` (libengine) | proven | output/libengine_jni/ + output/libengine.so.log (355,578 bytes of log, 4,751 ERROR lines) |
| `blutter 1.4.0 Dart AOT object-pool dump (evidence_results.zip)` (tool) | `libapp.so` (libapp) | proven | pp.txt (18,786 pool entries, 3,623 distinct strings), objs.txt (19,568 lines), asm/ (672 files), blutter_frida.js (210,024 bytes) |

### `byte_identical_to`

| source | destination | confidence | evidence |
|---|---|---|---|
| `lib/arm64-v8a/libapp.so` (apk) | `binaries/libapp.so` (repo) | proven | sha256 both sides = 2d3577fbaaacc7cb63e5b04a5a21572eeee1e0d55b223941d6a5496a91a427c8 |
| `lib/arm64-v8a/libengine.so` (apk) | `binaries/libengine.so` (repo) | proven | sha256 both sides = f5d751e6bde8f0595eda9836338e845b029a41d2362743a2a4619ba99f41e3be |
| `lib/arm64-v8a/libflutter.so` (apk) | `flutter_libs/libflutter.so` (repo) | proven | sha256 both sides = 0baa710d6b7f7de2f8bcc05aa2950bab2989f3a4c95bc7f7bcc23ce84626ee52 |

### `called_via_env_slot_215`

| source | destination | confidence | evidence |
|---|---|---|---|
| `RegisterNatives@0xb0140` (libengine) | `libengine.so` (libengine) | proven | ldr from [JNIEnv+0x6b8] then blr; 0xb0130: w3, #1  (arg3 = nMethods, set before the blr at 0xb0144); table: 0xb0124: x2, sp, #0x38 — the JNINativeMethod[] is assembled on the stack, so name/sig/fnPtr are runtime values; the stores into that frame below are what can still be recovered statically |
| `RegisterNatives@0xb40a8` (libengine) | `libengine.so` (libengine) | proven | ldr from [JNIEnv+0x6b8] then blr; 0xb40ac: w3, #2  (arg3 = nMethods, set before the blr at 0xb40b4); table: 0xb409c: x2, sp, #0x20 — the JNINativeMethod[] is assembled on the stack, so name/sig/fnPtr are runtime values; the stores into that frame below are what can still be recovered statically |
| `RegisterNatives@0xf3a08` (libengine) | `libengine.so` (libengine) | proven | ldr from [JNIEnv+0x6b8] then blr; 0xf3a04: w3, #0xa  (arg3 = nMethods, set before the blr at 0xf3a0c); table: 0xf39fc: x2, x2, #0xee8 — absolute table at 0x828ee8 in .bss |

### `calls_loader`

| source | destination | confidence | evidence |
|---|---|---|---|
| `Lcom/snake/App;-><clinit>()V` (dex) | `loadLibrary('engine')` (dex) | proven | invoke-static Ljava/lang/System;->loadLibrary(Ljava/lang/String;)V at classes.dex+0x2b6c2e, inside Lcom/snake/App;-><clinit>()V |
| `Lio/flutter/embedding/engine/FlutterJNI;->loadLibrary()V` (dex) | `loadLibrary('flutter')` (dex) | proven | invoke-static Ljava/lang/System;->loadLibrary(Ljava/lang/String;)V at classes.dex+0x2bafda, inside Lio/flutter/embedding/engine/FlutterJNI;->loadLibrary()V |

### `candidate_purpose_for_uncalled_natives`

| source | destination | confidence | evidence |
|---|---|---|---|
| `This game version is not supported. please install other version . from * to #` (libapp) | `Lcom/snake/helper/flagger;->na()V` (dex) | candidate | the Dart side tells the user the installed version is unsupported while the native side declares 2 flagger natives that no dex code path calls - a plausible pair, with no evidence connecting them |

### `capability_of`

| source | destination | confidence | evidence |
|---|---|---|---|
| `_ZN16xcrash_oneheader6detail5pipe2EPii` (libengine) | `libengine.so` (libengine) | proven | xCrash (one-header build) native crash handler |
| `__system_property_get` (libengine) | `libengine.so` (libengine) | proven | reads Android system properties (device/ROM fingerprinting) |
| `dl_iterate_phdr` (libengine) | `libengine.so` (libengine) | proven | enumerates loaded ELF images (unwinding / self-inspection) |
| `dladdr` (libengine) | `libengine.so` (libengine) | proven | address -> symbol/library resolution at runtime |
| `dlsym` (libengine) | `libengine.so` (libengine) | proven | dynamic symbol lookup (late binding without a PLT import) |
| `getaddrinfo` (libengine) | `libengine.so` (libengine) | proven | DNS resolution |
| `getauxval` (libengine) | `libengine.so` (libengine) | proven | reads the auxiliary vector (AT_HWCAP feature detection) |
| `ioctl` (libengine) | `libengine.so` (libengine) | proven | device/control ioctls |
| `mmap` (libengine) | `libengine.so` (libengine) | proven | maps memory at runtime |
| `mprotect` (libengine) | `libengine.so` (libengine) | proven | changes page protection at runtime |
| `prctl` (libengine) | `libengine.so` (libengine) | proven | process control (dumpability / tracer behaviour / thread name) |
| `process_vm_readv` (libengine) | `libengine.so` (libengine) | proven | cross-process memory read (crash dump / inspection) |
| `pthread_create` (libengine) | `libengine.so` (libengine) | proven | spawns threads |

### `command_and_control_candidate`

| source | destination | confidence | evidence |
|---|---|---|---|
| `https://rest.snakeseller.com/api/request/` (libapp) | `apks/SNAKE.apk` (apk) | strong | hard-coded request endpoint compiled into the Dart AOT snapshot (package com.snake v2.2.6) |
| `https://www.snakeengine.com/topup/` (libapp) | `apks/SNAKE.apk` (apk) | strong | hard-coded request endpoint compiled into the Dart AOT snapshot (package com.snake v2.2.6) |

### `confirms_snapshot_version`

| source | destination | confidence | evidence |
|---|---|---|---|
| `blutter 1.4.0 Dart AOT object-pool dump (evidence_results.zip)` (tool) | `Dart snapshot version 80a49c7111088100a233b2ae788e1f48` (libapp) | proven | blutter_build.log (a member of the same zip) ends with 'Dart version: 3.5.4, Snapshot: 80a49c7111088100a233b2ae788e1f48, Target: android arm64' and the feature string 'product no-code_comments dwarf_stack_traces_mode...' - the same 32 hex bytes we read out of libapp.so at 0x214, 0x40d4 |
| `blutter 1.4.0 Dart AOT object-pool dump (evidence_results.zip)` (tool) | `Dart snapshot version 80a49c7111088100a233b2ae788e1f48` (libflutter) | proven | blutter_build.log (a member of the same zip) ends with 'Dart version: 3.5.4, Snapshot: 80a49c7111088100a233b2ae788e1f48, Target: android arm64' and the feature string 'product no-code_comments dwarf_stack_traces_mode...' - and the same bytes we found in libflutter.so at 0x1eafd4 |

### `corroborates_absent_jni_names`

| source | destination | confidence | evidence |
|---|---|---|---|
| `Ghidra 12.1.2 headless + ExtractJNI.java (evidence_ghidra.zip)` (tool) | `libengine.so` (libengine) | proven | 05_RegisterNatives_xrefs.txt says (symbol not found) and 06_Java_strings.txt holds 0 lines: Ghidra's own symbol and string searches find no JNI name either, which is the same fact we report from 48 exact-byte searches |

### `corroborates_dart_strings`

| source | destination | confidence | evidence |
|---|---|---|---|
| `blutter 1.4.0 Dart AOT object-pool dump (evidence_results.zip)` (tool) | `libapp.so` (libapp) | proven | of the 27 strings our byte scan extracted, 15 are exact object-pool entries, 10 occur inside a longer pool string and 2 are not pool objects at all - the pool gives a second coordinate (pp+0x...) for the same bytes |

### `corroborates_endpoint`

| source | destination | confidence | evidence |
|---|---|---|---|
| `blutter 1.4.0 Dart AOT object-pool dump (evidence_results.zip)` (tool) | `https://rest.snakeseller.com/api/request/` (libapp) | proven | pool-exact at pp+0x139d8 while our scan has it at libapp.so+0x43fe5 - the same string in two coordinate systems |
| `blutter 1.4.0 Dart AOT object-pool dump (evidence_results.zip)` (tool) | `https://www.snakeengine.com/topup/` (libapp) | proven | pool-exact at pp+0x17790 while our scan has it at libapp.so+0x3d50e - the same string in two coordinate systems |

### `corroborates_identity`

| source | destination | confidence | evidence |
|---|---|---|---|
| `blutter 1.4.0 Dart AOT object-pool dump (evidence_results.zip)` (tool) | `com.snake referenced by the Dart snapshot` (libapp) | proven | 'com.snake' is a pool object at pp+0xe458, a raw byte run at libapp.so+0x3bd3a and the manifest package - three unrelated sources for one identifier |

### `corroborates_init_array_targets`

| source | destination | confidence | evidence |
|---|---|---|---|
| `Ghidra 12.1.2 headless + ExtractJNI.java (evidence_ghidra.zip)` (tool) | `libengine.so:.init_array` (libengine) | proven | 44/44 of Ghidra's init_array targets equal the 44 R_AARCH64_RELATIVE addends we derived from .rela.dyn, after subtracting the measured 0x100000 image base - two unrelated methods (Ghidra's loader vs our relocation walk) producing one list |

### `corroborates_no_registration_in_JNI_OnLoad`

| source | destination | confidence | evidence |
|---|---|---|---|
| `Ghidra 12.1.2 headless + ExtractJNI.java (evidence_ghidra.zip)` (tool) | `libengine.so:JNI_OnLoad` (libengine) | proven | in 12,280 bytes of decompiled C there are 0 loads through the JNIEnv slots we care about ({'0x6b8': 0, '0x30': 0, '0x38': 0}) and 5 callees (rand, FUN_0091ad58, __stack_chk_fail, strlen, sysconf), none of them a JNI helper - the decompiler reaches the same conclusion as our byte-level scan of the registration windows |

### `corroborates_rwx_allocation`

| source | destination | confidence | evidence |
|---|---|---|---|
| `Ghidra 12.1.2 headless + ExtractJNI.java (evidence_ghidra.zip)` (tool) | `libengine.so:JNI_OnLoad` (libengine) | proven | 10 mmap() calls, prot values [7] (7 = RWX), flags ['0x22'] (MAP_PRIVATE|MAP_ANONYMOUS), and 10 stores of a synthesised AArch64 branch opcode (0x14000000 | imm26) - the runtime code-patching that our disassembly of the same function shows at 0x000f3fa4 / 0x000f3fb0 |

### `corroborates_section_table`

| source | destination | confidence | evidence |
|---|---|---|---|
| `Ghidra 12.1.2 headless + ExtractJNI.java (evidence_ghidra.zip)` (tool) | `libengine.so` (libengine) | proven | the readelf dump shipped in the artifact agrees with our pyelftools parse on 26/26 shared sections (address and size); 0 section(s) appear in only one of the two. .mytext is at 0x81eeac in both, which is what proves the 0x100000 shift belongs to Ghidra's image base, not to the file |

### `corroborates_symbol_table`

| source | destination | confidence | evidence |
|---|---|---|---|
| `Ghidra 12.1.2 headless + ExtractJNI.java (evidence_ghidra.zip)` (tool) | `libengine.so` (libengine) | proven | readelf: 154 .dynsym entries = 136 UNDEF + 17 DEFINED + 1 null; ours: 136 UNDEF + 17 DEFINED |

### `dart_entry_point_of`

| source | destination | confidence | evidence |
|---|---|---|---|
| `libapp.so:_kDartVmSnapshotInstructions` (libapp) | `libapp.so` (libapp) | proven | AOT code entry at 0x160000 |
| `libapp.so:_kDartIsolateSnapshotInstructions` (libapp) | `libapp.so` (libapp) | proven | AOT code entry at 0x176b40 |

### `declared_in`

| source | destination | confidence | evidence |
|---|---|---|---|
| `Lcom/snake/helper/Native;->ac(Ljava/lang/Object;Ljava/lang/Object;)V` (dex) | `Lcom/snake/helper/Native;` (dex) | proven | encoded_method access=0x109 (ACC_NATIVE set) |
| `Lcom/snake/helper/Native;->aior(Ljava/lang/String;Ljava/lang/String;)V` (dex) | `Lcom/snake/helper/Native;` (dex) | proven | encoded_method access=0x109 (ACC_NATIVE set) |
| `Lcom/snake/helper/Native;->awl(Ljava/lang/String;)V` (dex) | `Lcom/snake/helper/Native;` (dex) | proven | encoded_method access=0x109 (ACC_NATIVE set) |
| `Lcom/snake/helper/Native;->chl([B)Z` (dex) | `Lcom/snake/helper/Native;` (dex) | proven | encoded_method access=0x109 (ACC_NATIVE set) |
| `Lcom/snake/helper/Native;->djp(I)[B` (dex) | `Lcom/snake/helper/Native;` (dex) | proven | encoded_method access=0x109 (ACC_NATIVE set) |
| `Lcom/snake/helper/Native;->eio()V` (dex) | `Lcom/snake/helper/Native;` (dex) | proven | encoded_method access=0x109 (ACC_NATIVE set) |
| `Lcom/snake/helper/Native;->i(I)V` (dex) | `Lcom/snake/helper/Native;` (dex) | proven | encoded_method access=0x109 (ACC_NATIVE set) |
| `Lcom/snake/helper/Native;->ic(Landroid/content/Context;)V` (dex) | `Lcom/snake/helper/Native;` (dex) | proven | encoded_method access=0x109 (ACC_NATIVE set) |
| `Lcom/snake/helper/Native;->ilil(I)Ljava/lang/String;` (dex) | `Lcom/snake/helper/Native;` (dex) | proven | encoded_method access=0x109 (ACC_NATIVE set) |
| `Lcom/snake/helper/Native;->pjowqpxe(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V` (dex) | `Lcom/snake/helper/Native;` (dex) | proven | encoded_method access=0x109 (ACC_NATIVE set) |
| `Lcom/snake/helper/Native;->update(Ljava/lang/Object;Ljava/lang/reflect/Method;)V` (dex) | `Lcom/snake/helper/Native;` (dex) | proven | encoded_method access=0x109 (ACC_NATIVE set) |
| `Lcom/snake/helper/flagger;->na()V` (dex) | `Lcom/snake/helper/flagger;` (dex) | proven | encoded_method access=0x109 (ACC_NATIVE set) |
| `Lcom/snake/helper/flagger;->nb()V` (dex) | `Lcom/snake/helper/flagger;` (dex) | proven | encoded_method access=0x109 (ACC_NATIVE set) |

### `declares_application`

| source | destination | confidence | evidence |
|---|---|---|---|
| `AndroidManifest.xml` (apk) | `Lcom/snake/App;` (dex) | proven | manifest android:name="com.snake.App" |

### `embedded_in`

| source | destination | confidence | evidence |
|---|---|---|---|
| `https://rest.snakeseller.com/api/request/` (libapp) | `libapp.so` (libapp) | proven | ASCII string at libapp.so+0x43fe5 (va -0x1), category c2_endpoint |
| `https://www.snakeengine.com/topup/` (libapp) | `libapp.so` (libapp) | proven | ASCII string at libapp.so+0x3d50e (va -0x1), category c2_endpoint |
| `https://discord.com/invite/` (libapp) | `libapp.so` (libapp) | proven | ASCII string at libapp.so+0x4e123 (va -0x1), category social_link |
| `https://t.me/` (libapp) | `libapp.so` (libapp) | proven | ASCII string at libapp.so+0x402c9 (va -0x1), category social_link |
| `https://wa.me/` (libapp) | `libapp.so` (libapp) | proven | ASCII string at libapp.so+0x3376c (va -0x1), category social_link |
| `https://www.facebook.com/` (libapp) | `libapp.so` (libapp) | proven | ASCII string at libapp.so+0x1f56d (va -0x1), category social_link |
| `https://apkpure.com/search?q=` (libapp) | `libapp.so` (libapp) | proven | ASCII string at libapp.so+0x39902 (va -0x1), category store_link |
| `https://play.google.com/store/apps/details?id=` (libapp) | `libapp.so` (libapp) | proven | ASCII string at libapp.so+0x4ba7b (va -0x1), category store_link |
| `com.snake referenced by the Dart snapshot` (libapp) | `libapp.so` (libapp) | proven | exact byte sequence found at libapp.so+0x3bd3a |
| `You are not connected to the internet, Snake Engine needs an active internet connection` (libapp) | `libapp.so` (libapp) | proven | ASCII string at libapp.so+0x2bfe4 |
| `Hindi ka konektado sa internet, kailangan ng Snake Engine ng aktibong koneksyon sa internet` (libapp) | `libapp.so` (libapp) | proven | ASCII string at libapp.so+0x3387f |
| `Snake Engine` (libapp) | `libapp.so` (libapp) | proven | ASCII string at libapp.so+0x3ae49 |
| `com.snake referenced by the Dart snapshot` (libapp) | `libapp.so` (libapp) | proven | ASCII string at libapp.so+0x3bd3a |
| `https://www.snakeengine.com/topup/` (libapp) | `libapp.so` (libapp) | proven | ASCII string at libapp.so+0x3d50e |
| `helperError` (libapp) | `libapp.so` (libapp) | proven | ASCII string at libapp.so+0x4343a |
| `https://rest.snakeseller.com/api/request/` (libapp) | `libapp.so` (libapp) | proven | ASCII string at libapp.so+0x43fe5 |
| `s conectado a Internet, Snake Engine necesita una conexi` (libapp) | `libapp.so` (libapp) | proven | ASCII string at libapp.so+0x444f5 |
| `Anda tidak disambungkan ke internet, Snake Engine memerlukan sambungan internet yang aktif` (libapp) | `libapp.so` (libapp) | proven | ASCII string at libapp.so+0x49900 |
| `'/proc/self/maps' in the Dart object pool` (libapp) | `libapp.so` (libapp) | proven | object-pool entry at pp+0xe448 |
| `regex that parses a /proc/self/maps line` (libapp) | `libapp.so` (libapp) | proven | object-pool entry at pp+0xe460 |
| `[closure] Future<dynamic> _pfc(dynamic, MethodCall) {` (libapp) | `libapp.so` (libapp) | proven | blutter disassembled it from output/blutter/asm/Ieg.dart:379 (class _dX) |
| `[closure] Future<bool> _cec(dynamic, MethodCall) {` (libapp) | `libapp.so` (libapp) | proven | blutter disassembled it from output/blutter/asm/Ieg.dart:468 (class _hX) |
| `[closure] Future<dynamic> _eec(dynamic, MethodCall) {` (libapp) | `libapp.so` (libapp) | proven | blutter disassembled it from output/blutter/asm/Ieg.dart:471 (class _hX) |
| `https://api.flutter.dev/flutter/dart-ui/ChannelBuffers-class.html` (libapp) | `libapp.so` (libapp) | proven | ASCII run at libapp.so+0x3ea1c |
| `https://api.flutter.dev/flutter/material/Scaffold/of.html` (libapp) | `libapp.so` (libapp) | proven | ASCII run at libapp.so+0x34eaf |
| `https://flutter.dev/docs/release/breaking-changes/network-policy-ios-android.` (libapp) | `libapp.so` (libapp) | proven | ASCII run at libapp.so+0x49149 |
| `This game version is not supported. please install other version . from * to #` (libapp) | `libapp.so` (libapp) | proven | 2 app-specific pool strings about an unsupported/unofficial version, at pp+0x112e0, pp+0x11310 |

### `engine_api_names_present_in_engine`

| source | destination | confidence | evidence |
|---|---|---|---|
| `libapp.so` (libapp) | `libflutter.so` (libflutter) | strong | all 11 PlatformConfigurationNativeApi::* names referenced by the snapshot also occur in the engine, e.g. PlatformConfigurationNativeApi::DefaultRouteName (libapp@0x35285, libflutter@0x1ce1f9); PlatformConfigurationNativeApi::EndWarmUpFrame (libapp@0x1bbb9, libflutter@0x1cdd4c); PlatformConfigurationNativeApi::GetRootIsolateToken (libapp@0x3bc6d, libflutter@0x1c5150) |

### `hosts_flutter_engine_bindings`

| source | destination | confidence | evidence |
|---|---|---|---|
| `classes.dex` (apk) | `libflutter.so` (libflutter) | proven | 41 ACC_NATIVE declarations in ['Lio/flutter/embedding/engine/FlutterJNI;']; libflutter.so exports 0 Java_* symbols and JNI_OnLoad, so the engine also binds its natives dynamically |

### `independently_fails_on_the_constructors`

| source | destination | confidence | evidence |
|---|---|---|---|
| `Ghidra 12.1.2 headless + ExtractJNI.java (evidence_ghidra.zip)` (tool) | `libengine.so:.init_array` (libengine) | proven | 0 of 44 constructors decompiled ({'timeout': 37, 'no function': 7}), 7 unreachable blocks and 10 jumptable failures inside JNI_OnLoad, plus 2,278 LSDACallSiteTable parse errors in the log - an independent tool failing on exactly the code we flag as obfuscated |

### `is_framework_documentation_text`

| source | destination | confidence | evidence |
|---|---|---|---|
| `https://api.flutter.dev/flutter/dart-ui/ChannelBuffers-class.html` (libapp) | `libflutter.so` (libflutter) | strong | the pool holds this URL only inside Flutter's own message ' channel was discarded before it could be handled.\\nThis happens when ' (pp+0x408), so it is framework documentation, not an app endpoint |
| `https://api.flutter.dev/flutter/material/Scaffold/of.html` (libapp) | `libflutter.so` (libflutter) | strong | the pool holds this URL only inside Flutter's own message ' channel was discarded before it could be handled.\\nThis happens when ' (pp+0x408), so it is framework documentation, not an app endpoint |
| `https://flutter.dev/docs/release/breaking-changes/network-policy-ios-android.` (libapp) | `libflutter.so` (libflutter) | strong | the pool holds this URL only inside Flutter's own message '\\" is not supported by the platform. Refer to https://flutter.dev/docs' (pp+0x130), so it is framework documentation, not an app endpoint |

### `jumps_into_generated_code`

| source | destination | confidence | evidence |
|---|---|---|---|
| `libengine.so:JNI_OnLoad` (libengine) | `libengine.so` (libengine) | proven | 2 indirect branches in the first 420 decoded instructions, including a blr into the freshly mapped page |

### `loads_library`

| source | destination | confidence | evidence |
|---|---|---|---|
| `loadLibrary('engine')` (dex) | `binaries/libengine.so` (repo) | proven | literal name 'engine' resolved from fill-array-data+String([B); System.loadLibrary maps it to libengine.so (fill-array-data instruction at file 0x2b6c22 points to the payload at 0x2b6c38 (ident=0x0300, element_width=1, size=6); the 6 bytes at 0x2b6c40 are 656e67696e65 = 'engine') |
| `loadLibrary('flutter')` (dex) | `flutter_libs/libflutter.so` (repo) | proven | literal name 'flutter' resolved from const-string; System.loadLibrary maps it to libflutter.so (const-string "flutter" at file 0x2bafd6 in Lio/flutter/embedding/engine/FlutterJNI;->loadLibrary()V) |

### `maps_rwx_anonymous_memory`

| source | destination | confidence | evidence |
|---|---|---|---|
| `libengine.so:JNI_OnLoad` (libengine) | `libengine.so` (libengine) | proven | 2 raw `svc #0` mmap calls with PROT_READ|WRITE|EXEC and MAP_PRIVATE|MAP_ANONYMOUS at 0xf4018, 0xf411c — bypasses the imported mmap@PLT |

### `member_of`

| source | destination | confidence | evidence |
|---|---|---|---|
| `lib/arm64-v8a/libapp.so` (apk) | `apks/SNAKE.apk` (apk) | proven | zip central directory entry, 5,637,024 bytes, CRC verified by testzip() |
| `lib/arm64-v8a/libengine.so` (apk) | `apks/SNAKE.apk` (apk) | proven | zip central directory entry, 8,544,568 bytes, CRC verified by testzip() |
| `lib/arm64-v8a/libflutter.so` (apk) | `apks/SNAKE.apk` (apk) | proven | zip central directory entry, 10,714,752 bytes, CRC verified by testzip() |
| `classes.dex` (apk) | `apks/SNAKE.apk` (apk) | proven | sha256=e2b1fb586a9a85b4f094340458ea350eb1faafd602b8a4a287d4b3b97297af11, 3,881,048 bytes |
| `AndroidManifest.xml` (apk) | `apks/SNAKE.apk` (apk) | proven | package=com.snake versionName=2.2.6 |

### `names_the_application`

| source | destination | confidence | evidence |
|---|---|---|---|
| `com.snake referenced by the Dart snapshot` (libapp) | `AndroidManifest.xml` (apk) | strong | the Dart snapshot hard-codes the manifest package `com.snake` (libapp.so+0x3bd3a) |

### `nonstandard_section_of`

| source | destination | confidence | evidence |
|---|---|---|---|
| `libengine.so:.mytext` (libengine) | `libengine.so` (libengine) | proven | .mytext addr=0x81eeac size=244 exec=True write=False — no toolchain emits this name |

### `owns_method`

| source | destination | confidence | evidence |
|---|---|---|---|
| `Lcom/snake/App;` (dex) | `Lcom/snake/App;-><clinit>()V` (dex) | proven | class_data_item of that class_def lists the method |
| `Lio/flutter/embedding/engine/FlutterJNI;` (dex) | `Lio/flutter/embedding/engine/FlutterJNI;->loadLibrary()V` (dex) | proven | class_data_item of that class_def lists the method |

### `parsed_by`

| source | destination | confidence | evidence |
|---|---|---|---|
| `'/proc/self/maps' in the Dart object pool` (libapp) | `regex that parses a /proc/self/maps line` (libapp) | probable | pool slots pp+0xe448 and pp+0xe460 are 3 slots apart, and the package name 'com.snake' sits between them (adjacency only - blutter's asm/ output does not cover this closure, so there is no cross-reference) |

### `probable_handler_for_native_class`

| source | destination | confidence | evidence |
|---|---|---|---|
| `[closure] Future<dynamic> _pfc(dynamic, MethodCall) {` (libapp) | `Lcom/snake/helper/Native;` (dex) | probable | a Dart closure whose signature takes a MethodCall ([closure] Future<dynamic> _pfc(dynamic, MethodCall) {) and a dex class declaring ACC_NATIVE methods (Lcom/snake/helper/Native;, Lcom/snake/helper/flagger;) are the two halves a platform channel needs; no string ties them together, because the channel name is not in the pool |
| `[closure] Future<bool> _cec(dynamic, MethodCall) {` (libapp) | `Lcom/snake/helper/Native;` (dex) | probable | a Dart closure whose signature takes a MethodCall ([closure] Future<bool> _cec(dynamic, MethodCall) {) and a dex class declaring ACC_NATIVE methods (Lcom/snake/helper/Native;, Lcom/snake/helper/flagger;) are the two halves a platform channel needs; no string ties them together, because the channel name is not in the pool |
| `[closure] Future<dynamic> _eec(dynamic, MethodCall) {` (libapp) | `Lcom/snake/helper/Native;` (dex) | probable | a Dart closure whose signature takes a MethodCall ([closure] Future<dynamic> _eec(dynamic, MethodCall) {) and a dex class declaring ACC_NATIVE methods (Lcom/snake/helper/Native;, Lcom/snake/helper/flagger;) are the two halves a platform channel needs; no string ties them together, because the channel name is not in the pool |

### `provides_dart_snapshot`

| source | destination | confidence | evidence |
|---|---|---|---|
| `lib/arm64-v8a/libapp.so` (apk) | `Dart snapshot version 80a49c7111088100a233b2ae788e1f48` (libapp) | proven | features: product no-code_comments dwarf_stack_traces_mode dedup_instructions no-tsan no-msan arm64 android compressed-pointers |
| `lib/arm64-v8a/libapp.so` (apk) | `Dart snapshot version 80a49c7111088100a233b2ae788e1f48` (libapp) | proven | features: product no-code_comments dwarf_stack_traces_mode dedup_instructions no-tsan no-msan arm64 android compressed-pointers |

### `reclassified_as_framework_text`

| source | destination | confidence | evidence |
|---|---|---|---|
| `helperError` (libapp) | `Flutter InputDecorator enum (blutter's obfuscated Obj!_WF)` (libapp) | proven | blutter: enum member 0 of 11 in Obj!_WF (siblings: helperError, icon, input, prefixIcon, suffixIcon, prefix, suffix, label, hint, counter, container). It is not an app identifier and not an error code of the dex native-helper surface; the substring 'helper' in 'helperError' was a false positive |

### `reconciles_the_strings_difference`

| source | destination | confidence | evidence |
|---|---|---|---|
| `Ghidra 12.1.2 headless + ExtractJNI.java (evidence_ghidra.zip)` (tool) | `libengine.so` (libengine) | proven | the artifact's `strings -n 8` holds 886 runs, our scan finds 885; 0 artifact run(s) are missing from ours, and the remainder of the difference is TAB: GNU strings counts 0x09 as printable, our [0x20-0x7e] scan does not, so it reports 6 runs we split |

### `registers_exactly_the_declared_natives`

| source | destination | confidence | evidence |
|---|---|---|---|
| `libengine.so` (libengine) | `classes.dex` (apk) | strong | 13 methods registered across 3 sites = 13 ACC_NATIVE declarations in 2 custom classes (11 Lcom/snake/helper/Native; + 2 Lcom/snake/helper/flagger;) |

### `registers_fnptr_in`

| source | destination | confidence | evidence |
|---|---|---|---|
| `RegisterNatives@0xb40a8` (libengine) | `libengine.so:.mytext` (libengine) | proven | sp+0x48 (fnPtr of entry[1]) = 0x81eeb0, stored at 0xb40b0; section is executable=True |

### `registers_method`

| source | destination | confidence | evidence |
|---|---|---|---|
| `RegisterNatives@0xb0140` (libengine) | `Lcom/snake/helper/Native;->pjowqpxe(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V` (dex) | probable | nMethods=1, decode-loop bounds=[8]; each decode-loop bound matches exactly one method name of the assigned class |
| `RegisterNatives@0xb40a8` (libengine) | `Lcom/snake/helper/flagger;->na()V` (dex) | probable | nMethods=2, decode-loop bounds=[2, 3]; nMethods equals the class's whole declaration list |
| `RegisterNatives@0xb40a8` (libengine) | `Lcom/snake/helper/flagger;->nb()V` (dex) | probable | nMethods=2, decode-loop bounds=[2, 3]; nMethods equals the class's whole declaration list |

### `registers_natives_of`

| source | destination | confidence | evidence |
|---|---|---|---|
| `RegisterNatives@0xf3a08` (libengine) | `Lcom/snake/helper/Native;` (dex) | strong | FindClass at `0xf39e4`; the name is built by a 23-iteration byte-decode loop, so the JNI class name is 23 characters (other candidates: com/snake/helper/flagger=24) |
| `RegisterNatives@0xb0140` (libengine) | `Lcom/snake/helper/Native;` (dex) | probable | No FindClass inside the decoded window, so no class name is materialised here — the class handle is fetched elsewhere (a cached global reference or an outer frame). After the FindClass site is accounted for, exactly 1 declaration remains and it belongs to `Lcom/snake/helper/Native;` |
| `RegisterNatives@0xb40a8` (libengine) | `Lcom/snake/helper/flagger;` (dex) | probable | No FindClass inside the decoded window, so no class name is materialised here — the class handle is fetched elsewhere (a cached global reference or an outer frame). After the FindClass site is accounted for, exactly 2 declarations remain and they all belong to `Lcom/snake/helper/flagger;` |

### `requires_dynamic_registration`

| source | destination | confidence | evidence |
|---|---|---|---|
| `Lcom/snake/helper/Native;` (dex) | `libengine.so` (libengine) | proven | 11 ACC_NATIVE declarations, but libengine.so exports 0 Java_* symbols — JNI resolution by name is impossible, so every one of them must arrive through RegisterNatives |
| `Lcom/snake/helper/flagger;` (dex) | `libengine.so` (libengine) | proven | 2 ACC_NATIVE declarations, but libengine.so exports 0 Java_* symbols — JNI resolution by name is impossible, so every one of them must arrive through RegisterNatives |

### `reveals_self_inspection`

| source | destination | confidence | evidence |
|---|---|---|---|
| `blutter 1.4.0 Dart AOT object-pool dump (evidence_results.zip)` (tool) | `'/proc/self/maps' in the Dart object pool` (libapp) | proven | the pool holds the path Dart code would read to enumerate its own loaded libraries |

### `runs_staged_constructors`

| source | destination | confidence | evidence |
|---|---|---|---|
| `libengine.so:.init_array` (libengine) | `libengine.so` (libengine) | proven | 44 pointers, all supplied by R_AARCH64_RELATIVE relocations (the on-disk slots are zero); 37 of them share one identical 16-byte prologue e80f19fcfd7b01a9fd430091fc6f02a9 and are spaced by ['0x2d2ec', '0x2d2dc', '0x2d2cc', '-0x322be4', '0x34fed0'] over 0x62d604 bytes of .text |

### `same_bytes_as`

| source | destination | confidence | evidence |
|---|---|---|---|
| `binaries/libengine.so` (repo) | `lib/arm64-v8a/libengine.so` (apk) | proven | sha256 f5d751e6bde8f0595eda9836338e845b029a41d2362743a2a4619ba99f41e3be on both sides |
| `binaries/libapp.so` (repo) | `lib/arm64-v8a/libapp.so` (apk) | proven | sha256 2d3577fbaaacc7cb63e5b04a5a21572eeee1e0d55b223941d6a5496a91a427c8 on both sides |
| `flutter_libs/libflutter.so` (repo) | `lib/arm64-v8a/libflutter.so` (apk) | proven | sha256 0baa710d6b7f7de2f8bcc05aa2950bab2989f3a4c95bc7f7bcc23ce84626ee52 on both sides |

### `same_theme_as_native_imports`

| source | destination | confidence | evidence |
|---|---|---|---|
| `'/proc/self/maps' in the Dart object pool` (libapp) | `libengine.so` (libengine) | probable | libengine.so imports __system_property_get, dl_iterate_phdr, prctl, process_vm_readv - the native half of the same self-inspection/anti-tamper theme the Dart pool shows. Nothing proves the two talk to each other: no cross-library reference exists in either direction |

### `signature_shape_matches`

| source | destination | confidence | evidence |
|---|---|---|---|
| `libengine.so:.mytext` (libengine) | `Lcom/snake/helper/Native;->update(Ljava/lang/Object;Ljava/lang/reflect/Method;)V` (dex) | probable | the .mytext stub at 0x81eeb4 loads JNIEnv slot +0x38 (FromReflectedMethod) and `blr`s it at 0x81eed4 with x1 = the incoming x3, i.e. it converts the native's 2nd declared Java parameter into a jmethodID; it also forwards another parameter to #0xb01c4. Lcom/snake/helper/Native;->update(Ljava/lang/Object;Ljava/lang/reflect/Method;)V is the only one of the 13 declared natives whose parameters are Ljava/lang/Object;Ljava/lang/reflect/Method; |

### `snapshot_version_pair`

| source | destination | confidence | evidence |
|---|---|---|---|
| `Dart snapshot version 80a49c7111088100a233b2ae788e1f48` (libapp) | `libflutter.so` (libflutter) | proven | libapp.so stores 80a49c7111088100a233b2ae788e1f48 at offset 0x214 (features-adjacent, inside _kDartVmSnapshotData); the same 32-byte version appears in libflutter.so at 0x1eafd4 |
| `Dart snapshot version 80a49c7111088100a233b2ae788e1f48` (libapp) | `libflutter.so` (libflutter) | proven | libapp.so stores 80a49c7111088100a233b2ae788e1f48 at offset 0x40d4 (features-adjacent, inside _kDartIsolateSnapshotData); the same 32-byte version appears in libflutter.so at 0x1eafd4 |

### `static_initializer`

| source | destination | confidence | evidence |
|---|---|---|---|
| `Lcom/snake/App;` (dex) | `Lcom/snake/App;-><clinit>()V` (dex) | proven | class_data_item lists <clinit>()V with ACC_STATIC |

### `stored_as_regex_pattern`

| source | destination | confidence | evidence |
|---|---|---|---|
| `https://apkpure.com/search?q=` (libapp) | `https://apkpure.com/search\?q=` (libapp) | proven | the pool holds 'https://apkpure.com/search\\?q=' at pp+0x178b0 - the '?' is regex-escaped, so the Dart side keeps this as a pattern to match, not as a link to open |
| `https://play.google.com/store/apps/details?id=` (libapp) | `https://play.google.com/store/apps/details\?id=` (libapp) | proven | the pool holds 'https://play.google.com/store/apps/details\\?id=' at pp+0x178b8 - the '?' is regex-escaped, so the Dart side keeps this as a pattern to match, not as a link to open |

### `synthesises_branch_instructions`

| source | destination | confidence | evidence |
|---|---|---|---|
| `libengine.so:JNI_OnLoad` (libengine) | `libengine.so` (libengine) | proven | the AArch64 `B` opcode 0x14000000 is materialised as an immediate at 0xf4040, 0xf4090, then stored into mapped memory (self-modifying loader stub) |

### `ui_affordance_for_host`

| source | destination | confidence | evidence |
|---|---|---|---|
| `assets/flutter_assets/assets/discord.svg` (apk) | `libapp.so` (libapp) | probable | asset `discord.svg` (sha256 263a0bb777a4c45b…) pairs with host `discord.com` referenced 1x in the Dart snapshot |
| `assets/flutter_assets/assets/facebook.svg` (apk) | `libapp.so` (libapp) | probable | asset `facebook.svg` (sha256 191f40615c1209a5…) pairs with host `www.facebook.com` referenced 1x in the Dart snapshot |
| `assets/flutter_assets/assets/telegram.svg` (apk) | `libapp.so` (libapp) | probable | asset `telegram.svg` (sha256 e0bab5cbfaa0092d…) pairs with host `t.me` referenced 1x in the Dart snapshot |
| `assets/flutter_assets/assets/whatsapp.svg` (apk) | `libapp.so` (libapp) | probable | asset `whatsapp.svg` (sha256 3b02d33bafb251ac…) pairs with host `wa.me` referenced 1x in the Dart snapshot |

## Fragment-local facts

| fragment | fact | evidence |
|---|---|---|
| libengine | RegisterNatives call sites reachable from JNIEnv | `3 sites at 0xb0140(n=1), 0xb40a8(n=2), 0xf3a08(n=10) — total nMethods=13` |
| libengine | decode loop of 8 iterations at site 0xb0140 | `matches method name(s) ['pjowqpxe']` |
| libengine | decode loop of 2 iterations at site 0xb40a8 | `matches method name(s) ['na', 'nb']` |
| libengine | decode loop of 3 iterations at site 0xb40a8 | `matches signature(s) ['()V']` |
| libengine | decode loop of 23 iterations at site 0xf3a08 | `matches the 23-char JNI class name 'com/snake/helper/Native'` |
| apk | asset assets/flutter_assets/assets/link.svg has no matching host in libapp.so | `brand token 'link' not found among 12 hosts` |
| dex | Lcom/snake/helper/Native; is invoked from 20 Java method(s) | `Landroidx/appcompat/view/menu/b8;->callActivityOnResume(Landroid/app/Activity;)V, Landroidx/appcompat/view/menu/jv0;->O2(Ljava/lang/String;Ljava/lang/String;)V, Landroidx/appcompat/view/menu/ne0;->run()V, Landroidx/appcompat/view/menu/p60;->uncaughtException(Ljava/lang/Thread;Ljava/lang/Throwable;)V, Landroidx/appcompat/view/menu/vx;->b(Ljava/lang/String;JZ)V, Landroidx/appcompat/view/menu/vx;->c(JILjava/lang/String;Ljava/lang/String;Ljava/lang/String;Z)V …` |
| dex | Lcom/snake/helper/flagger; is invoked from 0 Java method(s) | `no invoke-* instruction in classes.dex references this class` |
| tool | F7 Ghidra 12.1.2 headless over binaries/libengine.so | `evidence_ghidra.zip sha256 068b00bcced11b52...; JNI_OnLoad at 0x1f3fa0 (image base +0x100000), 40 svc sites, 10 mmap calls, 10 branch-opcode stores, 0 JNIEnv registration-slot loads, 44 init_array entries of which 44 failed to decompile, log with 4,751 ERROR lines` |
| tool | F8 blutter 1.4.0 object-pool dump of binaries/libapp.so | `evidence_results.zip sha256 75d5a2e77a538966...; 18,786 pool entries, 3,623 distinct strings, 672 asm files, 19,568 objs lines; 15 of our extracted strings are pool-exact, 3 MethodCall handler closures, 12 version-lock grep hits of which 2 are the app's own` |
| tool | the blutter dump is attributed to this exact snapshot | `Dart 3.5.4, snapshot 80a49c7111088100a233b2ae788e1f48, target android arm64, blutter binary blutter_dartvm3.5.4_android_arm64, libapp loaded at 0x7f913de00000 with the Dart heap at 0x7f9000000000; the feature string in the log is identical to the one we read from libapp.so` |
