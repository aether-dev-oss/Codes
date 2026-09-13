# AetherEngine — Full-System Consistency Audit
### รายงานตรวจทั้งระบบ: ทำไมกด "รันเกม" แล้วไม่ boot (เด้งกลับหน้าเดิม) + อะไรไม่สอดคล้อง/ตกหล่น

| | |
|---|---|
| **Target** | `github.com/engine-dev01/AetherEngine` @ `4888653` (branch `main`) — clone ที่ `/home/user/AetherEngine` |
| **Evidence base** | (1) source tree ของ target ทั้งหมด (85 ไฟล์ .kt/.java/.cpp/.hpp/.dart) · (2) `Codes/SnakeLogic/` (RE bundle ของ SNAKE.apk: F2 dex natives, F3 manifest, F4 libengine JNI) |
| **Reproduce** | `python3 tools/audit_aether_engine.py --aether /home/user/AetherEngine --evidence /home/user/Codes/SnakeLogic` |
| **Determinism** | ไม่มี timestamp/path ของเครื่องใน output — รันซ้ำได้ hash เดิม (`findings.csv` = `065985e0…`, `audit_facts.json` = `1f7b3b89…`) |
| **Findings** | **27** ข้อ → **P0 = 6**, P1 = 14, P2 = 5, P3 = 2 (รายละเอียดรายข้อ: `findings.csv`, `AUDIT_SUMMARY.txt`) |
| **ภาษา** | เนื้อหาบรรยาย = ไทย · ตาราง/สัญลักษณ์/offset/ชื่อไฟล์ = อังกฤษ (ตามข้อกำหนดเดิมของงาน) |

---

## 0. บทสรุปผู้บริหาร (อ่าน 2 นาที)

**อาการที่รายงานมา — "กดปุ่มรันเกมแล้วไม่ boot เด้งกลับหน้าเดิม" — ไม่ได้มีสาเหตุเดียว แต่เป็นผลรวมของ 3 ชั้น:**

1. **ชั้นที่ 1 — identity ของ guest process พังได้แบบเงียบ ๆ (P0 · C14).**
   `:p0` ถูกผูก (pin) ไว้กับ package ปลอม `com.aether.test.chaincheck` โดยปุ่มวินิจฉัย *chain-check/handshake* และ `GuestProcessHolder.config` **ไม่มีทางล้างเลย** ขณะที่ `ProxyActivity` ใช้กฎ *p3-first* ให้ config เก่า **ชนะ** `target_package` ที่ส่งมาใน intent → `:p0` ไปพยายามโหลด package ที่ไม่ได้ติดตั้ง → `launched=false` → `finish()` → **เด้งกลับหน้าเดิม** ไม่มีข้อความใด ๆ บนจอ
   commit `8c51880` ของ repo เองบันทึกอาการนี้ไว้แล้ว (":p0 ที่ chaincheck ปินไว้") แต่แก้เฉพาะสาขาที่ handshake สำเร็จ — **สาขา `else 0` (หา slot ว่างไม่เจอ) ยังอยู่ที่ `AetherOrchestrator.kt:529`**

2. **ชั้นที่ 2 — chain ทั้งหมดพึ่ง hidden-API reflection โดยไม่มี exemption (P0 · C6).**
   จุด reflection เข้า framework member ที่ถูกจำกัด **20 จุด** (`ActivityThread.mInstrumentation`, `mInitialApplication`, `LoadedApk.mDataDirFile`, `ContextImpl.mPackageInfo`, `ContextWrapper.mBase`, `AssetManager.addAssetPath`, `ServiceManager.sCache`, `IActivityManagerSingleton` …) และทั้ง repo **ไม่มี** `setHiddenApiExemptions` / `VMRuntime` / bypass ใด ๆ เลย (0 hit ใน 85 ไฟล์) บน Android 9+ ทุกจุดที่ถูก block จะ throw → แต่ทุกจุดถูกห่อ `try/catch` แบบ **log แล้วเดินต่อ** → chain "สำเร็จแบบ degraded" → จบที่ `finish()` เหมือนเดิม
   **ช่องที่ทำไว้สำหรับ bypass มีอยู่แล้วแต่กลวง:** `Engine.setAccessible(Field)` / `setAccessible(Method)` ลงทะเบียน JNI ครบ แต่ body ว่าง *และ* ไม่มีใครเรียก (C3/C4)

3. **ชั้นที่ 3 — gate เขียวแต่ chain กลวง (P0 · C4, P1 · C3/C5/C11).**
   `scripts/jni_parity.py` → ✅ 1:1 (38 methods) และ `scripts/native_chain_parity.py` → ✅ "ทุก hop chain-required … call-site ถูกตำแหน่ง"
   แต่ความจริง: **hop ระดับ native 4 จาก 5 ตัวที่ gate รับรอง มี C++ body ว่างเปล่า** (`nativeInitContext`, `nativeProcessPair`, `nativeProcessTriple`, `nativeReflectUpdate`) และ `enableIO` / `addIORule` ก็ว่าง — ทั้งที่ Kotlin log ว่า *"VirtualFS: IO enabled, N redirect rules registered"* (`AetherOrchestrator.kt:137`) → ** telemetry บอกว่าระบบทำงาน ทั้งที่ไม่มีการ redirect เกิดขึ้นจริงแม้แต่ path เดียว**
   ชั้น `layer/` ทั้งชั้น (bind-mount virtual FS 234 บรรทัด + package.conf manifest snapshot 155 บรรทัด + rootspoof 33 บรรทัด = **422 บรรทัด**) **ไม่อยู่ใน #include closure ของ JNI entry** → เรียกไม่ถึง → `--gc-sections` ทิ้งออกจาก `.so`

> **สรุปสั้น:** ระบบไม่ได้ "พังจุดเดียว" แต่ **ทุกจุดที่พังถูกออกแบบให้พังแบบเงียบ** (122 `catch` ใน boot path, 87 จุดเป็น log-then-continue) แล้วรายงานสถานะเป็น "สำเร็จ" ขึ้น UI — นี่คือความ "ไม่สอดคล้อง" ที่รู้สึกได้ และคือเหตุผลที่แก้ทีละ commit แล้วอาการยังอยู่

**สิ่งที่ต้องทำก่อนเป็นอันดับแรก (รายละเอียด §7):**
`C14` (ล้าง identity + เลิก `else 0`) → `C6` (ใส่ hidden-API exemption ผ่าน JNI slot ที่มีอยู่) → `C2/C15` (ให้ UI บอกเหตุผลจริงแทน snackbar กลวง) → `C9` (Hook A ตายสนิท → guest เปิด activity ที่สองไม่ได้) → `C4` (ต่อ `enableIO/addIORule` เข้า `virtual_fs.cpp` ที่เขียนเสร็จแล้ว)

---

## 1. แผนที่ chain การ boot (20 hop) + สถานะราย hop

สถานะ: `OK` = ทำงานตามที่ออกแบบ · `HOLLOW` = มี call แต่ปลายทางว่าง · `DEAD` = โค้ดไม่มีทางถูกรัน · `BLOCKED-RISK` = พึ่ง hidden API ที่ไม่มี exemption · `FRAGILE` = พึ่งพฤติกรรมระบบที่ไม่การันตี · `SILENT` = ล้มแล้วไม่มีสัญญาณออก

| # | Hop | Call site (file:line) | Status | หมายเหตุ / finding |
|--:|---|---|---|---|
| 1 | ปุ่ม Play → `_launchGameInProcess()` | `app/lib/screens/home_screen.dart:162` | OK | precheck `pkg.isEmpty` |
| 2 | `isTargetInstalled` (PM query) | `EngineBridge.kt:124` | OK | false → snackbar แล้ว **return** (เด้งแบบที่ 1) |
| 3 | `launchInSandbox` (channel) | `EngineBridge.kt:296` | OK | ทุก method ที่ Dart เรียกมี branch ฝั่ง Kotlin ครบ (C1 ✅) |
| 4 | `AetherOrchestrator.launchInSandbox` | `AetherOrchestrator.kt:463` | HOLLOW | step 3 `startEngine()` → `enableIO`/`addIORule` = stub ว่าง (C4) |
| 5 | `SandboxManager.mountSandbox` | `SandboxManager.kt:362` | FRAGILE | ต้อง root; non-root → `\|\| true` ผ่านเงียบ (ไม่มี log ว่าข้าม) |
| 6 | `GuestProcessTable.allocate` | `GuestProcessRegistry.kt:85` | FRAGILE | พึ่ง `getRunningAppProcesses`; คืน `-1` → hop 7 ใช้ `else 0` (C14) |
| 7 | dispatch `ProxyActivity$P<slot>` | `AetherOrchestrator.kt:529` | FRAGILE | manifest มี P0..P3 = MAX_SLOTS ✅ แต่ fallback `else 0` พินาศ |
| 8 | provider handshake `_Engine_\|_init_process_` | `GuestProcessRegistry.kt:108` ↔ `ProxyContentProvider.kt:44` | OK | schema สองฝั่งใช้ค่าคงที่ชุดเดียว ✅ (บทเรียนที่แก้แล้ว) |
| 9 | `:pN` spawn → `AetherApp.onCreate` | `AetherApp.kt:50` | OK | role dispatch main/child/server ตรงตามแผน |
| 10 | `EngineLoader.load` → `libaether.so` | `EngineLoader.kt:40` | OK | `RegisterNatives` 39 entry ตรง Engine.kt 38 ชื่อ ✅ |
| 11 | `nativeInitContext` (≡ SNAKE `Native.ic`) | `AetherApp.kt` → `aether_core.cpp:185` | **HOLLOW** | body = `LOGD()` ซึ่ง compile เป็น `((void)0)` |
| 12 | `ProxyActivity.onCreate` — identity | `ProxyActivity.kt:29,37` | **BROKEN** | p3-first ให้ config ค้างชนะ intent (C14) |
| 13 | `readGuestManifest` (PM / package.conf) | `ProxyActivity.kt:282` | OK | `package.conf` เขียนจริงโดย `generatePackageConf` ✅ |
| 14 | `GuestRuntimeBridge.load` (v2 → v1 fallback) | `GuestRuntimeBridge.kt:160` | PARTIAL | fallback v1 **ทำ `sandboxDir` ตก** (C13) |
| 15 | `GuestRuntime.build` → `createPackageContext` | `GuestRuntime.kt:494` | BLOCKED-RISK | ต้อง `CONTEXT_INCLUDE_CODE\|IGNORE_SECURITY` + field `mPackageInfo` |
| 16 | `bindToActivityThread` (3-pass) | `GuestRuntime.kt:78` | **BLOCKED-RISK** | `mInitialApplication`/`mAllApplications`/`LoadedApk.m*DataDir*` = hidden |
| 17 | `installProviders` + `callOnCreate` | `GuestRuntime.kt:133,155` | OK* | *สำเร็จได้เฉพาะเมื่อ hop 16 ผ่าน |
| 18 | `AetherInstrumentation.install` (swap `mInstrumentation`) | `AetherInstrumentation.kt:55` | **BLOCKED-RISK** | `ActivityThread.mInstrumentation` = hidden; fail → ไม่มีการ swap เลย |
| 19 | `recreate()` → `newActivity` swap | `ProxyActivity.kt:95` → `AetherInstrumentation.kt:110` | DEAD-unless-18 | guard ที่ `ProxyActivity.kt:102` คือทางเด้งที่เห็นใน device log |
| 20 | `callActivityOnCreate` rewire + `callActivityOnResume` | `AetherInstrumentation.kt:169,306` | HOLLOW/BLOCKED | `AssetManager.addAssetPath`+`Resources(…)` ctor = hidden; `nativeProcessPair` ว่าง |

**ทางจบที่ทำให้ "เด้งกลับหน้าเดิม" (C2):** `ProxyActivity.onCreate` มี `finish()` 3 จุด — (ก) guard ตอน swap ไม่เกิด (`:102`), (ข) `launched=false` (`:194`), (ค) โหมด non-virtual — และ `launchInSandbox` ฝั่ง main มี `return false` อีกหลายจุด ทั้งหมดย้อนกลับมาที่ snackbar เดียว: *"Failed to virtualize … (engine issue — see logcat)"* → **ผู้ใช้ไม่มีทางรู้ว่าตายที่ hop ไหน**

---

## 2. P0 — 6 ข้อที่ทำให้ boot ไม่ได้ (ต้องแก้ก่อน)

### C14 · Guest identity ถูก pin ด้วยปุ่มวินิจฉัย แล้วชนะ intent
- **หลักฐาน:** `EngineBridge.kt:410` (`providerAuthority(0)` — slot 0 hardcode) + `:413` (`"com.aether.test.chaincheck"`) · `GuestProcessRegistry.kt:192` (set config) / `:186` (reject ต่าง package) — **ไม่มี `reset()`/`clear()` ใด ๆ** · `ProxyActivity.kt:37` (`p3?.guestPkg?.takeIf{…} ?: intentPkg`) · `AetherOrchestrator.kt:529` (`if (slot >= 0) slot else 0`)
- **ทำไมเด้ง:** เมื่อ `:p0` ถือ config ของ package ปลอมอยู่ แล้ว Play ถูก dispatch เข้า P0 (ผ่าน `else 0` หรือเมื่อ `getRunningAppProcesses` คืน null/ว่าง) → `targetPkg` = `com.aether.test.chaincheck` → `isVirtual=true` → `readGuestManifest` หาไม่เจอ → `launcher=null` → `launched=false` → `finish()`
- **แก้ (3 ขั้น, ทำครบถึงจะปิดอาการ):**
  1. เพิ่ม `GuestProcessHolder.rebind(pkg, slot)` และเรียกใน `handleInit` เมื่อ package ต่างกัน **แทนการ reject** (หรือ reject พร้อมล้าง config ถ้า caller เป็น diagnostic)
  2. ให้ปุ่มวินิจฉัยใช้ slot ของตัวเอง (`MAX_SLOTS-1`) — ห้ามแตะ slot ที่ guest จะใช้
  3. `ProxyActivity`: ถ้า `p3.guestPkg != intentPkg` ให้ถือเป็น **error** → `DiagLog.err` + `finish()` พร้อมส่งเหตุผลกลับ UI (ดู C2) — ไม่ใช่โหลด identity ที่ค้าง
  4. `AetherOrchestrator.kt:529`: เมื่อ `slot < 0` **ห้าม** dispatch P0 — ให้คืน `false` พร้อมเหตุผล "no free slot"

### C6 · ไม่มี hidden-API exemption ทั้งที่ chain ยิง reflection 20 จุด
- **หลักฐาน:** 0 hit สำหรับ `setHiddenApiExemptions` / `VMRuntime` / `hiddenapi` ใน 85 ไฟล์ · จุดใช้จริงเช่น `AetherInstrumentation.kt:63-64`, `GuestRuntime.kt:254`, `VirtualAppLoader.kt:202,208`, `ServiceBinderProxy.kt` (`sCache`)
- **ทำไมเด้ง:** ทุก reflection ที่โดน block → `NoSuchField/NoSuchMethod` → `catch` → คืน `false`/`null` → `bindToActivityThread()` = false → `LoadResult.success=false` → v1 fallback (พังแบบเดียวกัน) → `finish()`
- **แก้:** ทำ exemption **ครั้งเดียวต่อ process ก่อน hook ใด ๆ** — ทางที่ตรงที่สุดคือใช้ JNI slot ที่จองไว้แล้ว: implement `Java_com_aether_Engine_setAccessible__*` ให้เรียก `dalvik.system.VMRuntime.getRuntime().setHiddenApiExemptions(["L")` ผ่าน JNI (native เรียกได้โดยไม่ติด restriction) แล้วเรียก `Engine.setAccessible(...)` จาก `AetherApp.onCreate` ทันทีหลัง `EngineLoader.load(...)` ทุก process (main + :pN) — จุดนี้ทำให้ hop 16/18/20 ผ่านได้จริงเป็นครั้งแรก
- **ตรวจรับ:** `chainCheck` hop 2 ต้องขึ้น `sCache N/N` (ไม่ใช่ "UNAVAILABLE (hidden-API?)") และ hop 3 ต้องขึ้น `AMS mInstance=PROXY ✓`

### C2 · ทุกความล้มเหลวถูกย่อเป็น snackbar เดียว
- **หลักฐาน:** `ProxyActivity.kt:102,194` · `EngineBridge.launchInSandbox` คืน `Boolean` · `home_screen.dart:186` (`'Failed to virtualize …'`)
- **แก้:** เปลี่ยนสัญญาของ channel ให้คืน **เหตุผล** ไม่ใช่ bool:
  `launchInSandbox → Map{ok, stage, reason, slot, handshake, identity}` โดย `stage` ∈ {`allocate`,`handshake`,`dispatch`,`guest-load`,`bind`,`instrumentation`,`swap`} — ฝั่ง Kotlin ให้ `ProxyActivity` เขียนผลลัพธ์ลง `diag/launch_result.json` แล้ว bridge อ่านกลับมา (ข้าม process ผ่าน `filesDir` เหมือน `trace.log`) → UI แสดง stage ที่ตายจริง
- **ผล:** รอบทดสอบถัดไปจะรู้ทันทีว่าตายที่ hop ไหน โดยไม่ต้องเดาจากอาการ

### C9 · Hook A (`execStartActivity`) ตายโดยโครงสร้าง
- **หลักฐาน:** `AetherInstrumentation.kt:382` ประกาศ `fun execStartActivity(...)` **โดยไม่มี `override`** (Kotlin ไม่ override hidden method ของ superclass ได้) → `rewriteToStub()` (`:392`) ไม่เคยถูกรัน; doc ในไฟล์เองยอมรับว่า "the subclass method is never invoked by ActivityThread" แต่ยังปล่อยโค้ดไว้
- **ทำไมสำคัญกว่าที่คิด:** ต่อให้ swap ครั้งแรกสำเร็จ (hop 19) **activity ตัวที่สองของ guest จะไม่ถูก rewrite เข้า stub** → AMS route ออกไปยังแอปจริง/หรือ fail → เห็นเป็น "เกมเปิดแวบเดียวแล้วหลุด"
- **แก้:** ย้ายการ rewrite intent ไปที่ **binder layer ที่ wrap อยู่แล้ว** — `ServiceBinderProxy` wrap service `"activity"` ไว้ ให้ proxy ของ `IActivityManager.startActivity` แก้ component → stub ก่อนส่งจริง (นี่คือวิธีที่ VirtualApp ใช้) หรือลบ `execStartActivity` ทิ้งแล้วเลิกอ้างว่าเป็น hook ที่ทำงาน

### C4 · hop ระดับ native กลวง + telemetry รายงานผิด
- **หลักฐาน:** `aether_core.cpp` — `nativeInitContext:185`, `nativeProcessPair:182`, `nativeProcessTriple:183`, `nativeReflectUpdate:184`, `enableIO`/`addIORule` = LOG-ONLY (และ `AETHER_DEBUG 0` → `LOGD` = `((void)0)` จึงเท่ากับ **ฟังก์ชันว่าง**) ขณะที่ `AetherOrchestrator.kt:137` log "IO enabled, N redirect rules registered"
- **แก้:** (1) ต่อ `enableIO`/`addIORule` → `layer/bindmount/virtual_fs.cpp` (เขียนเสร็จแล้ว 234 บรรทัด ดู C5) และให้คืนค่าจำนวน rule ที่ลงทะเบียนจริงเพื่อไป log; (2) ขยาย gate `native_chain_parity.py` ให้ **ตรวจ body** ว่าไม่ใช่ EMPTY/LOG-ONLY ก่อนพิมพ์ PASS; (3) hop ที่ตั้งใจให้เป็น no-op ให้พิมพ์เป็น `NO-OP (deliberate)` ไม่ใช่ PASS

### C7 · manifest ตก stub 2 ตระกูลเมื่อเทียบกับต้นแบบ (F3)
- **หลักฐาน:** `Codes/SnakeLogic/fragments/F3_manifest.txt` (51 components) เทียบผ่าน rename map ที่ประกาศไว้ในสคริปต์ → เหลือช่องว่าง **2 รายการ**: `ProxyActivity` (base, ไม่สล็อต) และ **`ProxyActivity$P0_L..$P3_L` (landscape stubs)**
- **ทำไมสำคัญ:** guest จริง (8 Ball Pool) ประกาศ activity ที่ล็อก orientation — เมื่อไม่มี stub ฝั่ง landscape การหมุนจอ/relaunch จะไม่มี component ให้ AMS ลง → activity ตายหรือเด้ง
- **แก้:** เพิ่ม `$P0_L..$P3_L` ใน manifest ทั้งสองไฟล์ + class ใน `ProxyActivity.kt` (4 บรรทัด) และตัดสินใจเรื่อง base `ProxyActivity` ว่าจะประกาศหรือไม่ (ต้นแบบประกาศ)

---

## 3. P1 — 14 ข้อ (ช่องโหว่เชิงระบบที่ทำให้ "ตกหล่น")

| ID | ข้อ finding | หลักฐาน (file:line) | ผล |
|---|---|---|---|
| C3-dead-natives | JNI **15 จาก 38 ชื่อ** ไม่มีจุดเรียกใน Kotlin (รวม `setAccessible`×2, `setBinderCalling*Override`×2, `decryptString`, `nativeReflectUpdate`, `nativeProcessTriple`) | `Engine.kt` vs scan 41 ไฟล์ .kt | gate parity เขียว ทั้งที่ 39% ของ native surface เอื้อมไม่ถึง |
| C4-stubs | JNI **12 จาก 39 implementation** เป็น EMPTY/LOG-ONLY/CONST-RETURN | `aether_core.cpp` | Kotlin log "สำเร็จ" สำหรับงานที่ไม่เกิด |
| C5-orphans | `layer/bindmount/virtual_fs.cpp` (234), `layer/packageconf/manifest_snapshot.cpp` (155), `layer/rootspoof/hide_module.cpp` (33) ไม่อยู่ใน include closure ของ JNI TU | `CMakeLists.txt` L1_SOURCES | **422 บรรทัด** ที่เขียนเสร็จแล้วไม่ได้ลิงก์เข้า `.so` (gc-sections) |
| C7-parity-gap | ตก `ProxyActivity$Pn_L` + base `ProxyActivity` | F3 manifest | ดู C7 ข้างบน |
| C8-never-closed | `GuestRuntimeBridge.close()` มี **0 caller** และ `ProxyActivity` ไม่ override `onDestroy` ทั้งที่ KDoc สั่งให้เรียกจากตรงนั้น | `GuestRuntimeBridge.kt:209` vs `ProxyActivity.kt` | session guest, ActivityThread bind, Instrumentation wrapper ค้าง → กดครั้งที่สองใช้ state เก่า |
| C8-stale-hook | `AetherInstrumentation.install()` return ทันทีเมื่อ `installed` โดยไม่ rebind `stubComponent/guestClassLoader/guestApp` | `AetherInstrumentation.kt:60` | guest ตัวที่สอง/relaunch ใช้ classloader ของตัวแรก → `ClassNotFoundException` → process ตาย |
| C10-abspath | `scripts/native_chain_parity.py:13` ฝัง `/var/minis/workspace/codes/...` (ไม่มีอยู่จริงบนเครื่องอื่น) | preflight G3b | gate ล้มด้วย `FileNotFoundError` — FAIL ด้วยเหตุผลผิด ๆ และไม่มีใคร reproduce ผล PASS ได้ |
| C10-missing-evidence | อ้างเอกสาร **4 ชิ้นที่ไม่ได้ commit**: `NATIVE_CALLSITE_MAP.md`, `NATIVE_LOGIC.md`, `DATA_DUMP.md`, `REPORT.md` | grep *.kt/*.py/*.md/*.sh | ข้ออ้าง parity ทั้งหมด (hop numbers, schema `_S_\|_*`) ตรวจซ้ำไม่ได้ |
| C11-degraded-only | test 34 เคส / 5 ไฟล์; 3 เคสแตะ chain แต่ stub AOSP ทำให้ `currentActivityThread()` คืน **null** → ยืนยันเฉพาะ path ที่พัง | `test-stubs/android/app/ActivityThread.kt` | CI เขียว = "chain ล้มอย่างปลอดภัย" ไม่ใช่ "chain ทำงาน" |
| C13-binder-restore-only | `shutdown()` เรียก `restoreBinderCalling*Override(0)` แต่ `setBinderCalling*Override` **ไม่เคยถูกเรียก** | `AetherOrchestrator.kt:568` | binder call ของ guest ถือ uid ของ host เสมอ → SecurityException พายุ (ซึ่ง firewall กลืนทิ้ง) |
| C13-vfs-clobber | `ProxyActivity` ตั้ง identity guest (step 1) แล้ว step 2 self-attach ด้วย `"com.aether"` hardcode → `virtualFS.setupForApp(dataDir=/data/user/0/com.aether)` ทับ map ของ guest | `ProxyActivity.kt:68` → `:79` | ลำดับงานย้อนแย้งตัวเอง; อะไรที่อ่าน VirtualFSWrapper หลัง step 2 เห็น path ของ host |
| C15-diag-nocrash | `readDiag` KDoc สัญญา "latest crash report" แต่โค้ดอ่านแค่ `diag/trace.log` + `diag/logcat_*` — `CrashHandler` เขียนที่ `filesDir/crash_logs/crash_<ts>.log` | `EngineBridge.kt` (readDiag) vs `CrashHandler.kt:52` | crash ที่ฆ่า `:pN` มองไม่เห็นจากปุ่ม Diag |
| C15-diag-order | `ProxyActivity` เรียก `DiagLog.d` ตั้งแต่บรรทัด **39** แต่ `DiagLog.init` อยู่ที่บรรทัด **49** → บรรทัดก่อนหน้านั้นไม่ลงไฟล์ | `ProxyActivity.kt:39 vs :49` | บรรทัดที่สำคัญที่สุดสำหรับ C14 (`identity: p3=X overrides intent=Y`) คือบรรทัดที่ถูกทิ้ง |
| C16-unverifiable-placement | โค้ดอ้างหมายเลขบรรทัด decompiler **13 จุด** (`a7:171`, `jv0:283`, `j8:35`, `bt0:11`, `lv0:72` …) เป็นเกณฑ์ "วาง hop ถูกที่" แต่ F2 ที่ commit ไว้ระบุ caller แค่ระดับ **class** (15 method) และไม่ map ว่า caller ไหนเรียก native ตัวไหน | F2 + `native_chain_parity.py` | gate บังคับตำแหน่งที่ไม่มีใครตรวจซ้ำได้ — ถ้าตำแหน่งผิด gate จะกันการแก้ที่ถูกต้อง |

---

## 4. P2 / P3 — 7 ข้อ (ความไม่สอดคล้องที่อ่านโค้ดแล้วสะดุด)

| ID | Sev | ข้อ finding | หลักฐาน |
|---|---|---|---|
| C13-pkgconf-comment | P2 | คอมเมนต์บอก "ไม่ fabricate `package.conf` แล้ว / `generatePackageConf` ถูก deprecate" แล้ว 9 บรรทัดถัดมาเรียก `generatePackageConf()` เขียนไฟล์ (หมายเลขขั้นในบล็อกนั้นข้ามข้อ 2 ด้วย) | `SandboxManager.kt` (comment vs call) |
| C13-v1-drops-sandbox | P2 | `GuestRuntimeBridge.loadV1` ไม่ส่ง `sandboxDir` ต่อ และ `VirtualAppLoader.load` ไม่มีพารามิเตอร์นี้ → ถ้า v2 ล้ม guest จะวิ่งบน data dir **จริง** ของแอปแทน sandbox | `GuestRuntimeBridge.kt` vs `VirtualAppLoader.kt:64` |
| C13-vfs-selftest | P2 | `testVirtualFS` บน UI resolve กับ map ฝั่ง Kotlin เท่านั้น ตรวจไม่พบว่า native redirect เป็น stub | `VirtualAppContainer.testVirtualFSResolve` |
| C15-firewall-swallows | P2 | `installGuestThreadFirewall` จงใจไม่ส่งต่อให้ handler เดิม **ทุก thread รวม main** → crash ของ guest ถูกกลืน | `ProxyActivity.kt` (firewall) |
| C5-uncalled | P2 | `core/env_check.cpp` (73 บรรทัด) ถูก include แต่จุดเรียกเดียวโดนคอมเมนต์ (`[CUT]` ใน `JNI_OnLoad`) | `aether_core.cpp:58` |
| C1-dead-branches | P3 | branch ฝั่ง Kotlin ที่ Dart ไม่เคยเรียก: `launchGame`, `getEngineStatus` (ส่วน `getEngineStats`/`getVirtualAppStatus`/`readMemory` UI เรียกจริงแบบ multiline — ตรวจครบแล้ว) | `EngineBridge.kt` (when-branches) |
| C13-hydrate-log | P3 | `AetherApp` ส่ง `payloadDir` (`dataDir/root/files`) เข้า `nativeHydratePayloads` แต่ log ว่า `filesDir` | `AetherApp.kt` |

---

## 5. เมทริกซ์ความสอดคล้อง (ตัวเลขมาจาก `audit_facts.json`)

### 5.1 JNI surface — 38 ชื่อใน `Engine.kt` / 39 entry ใน `RegisterNatives` / 39 นิยามใน C++

| | **C++ body มีงานจริง** | **C++ body ว่าง (EMPTY/LOG-ONLY)** |
|---|---|---|
| **มี Kotlin เรียก (live)** | 19 — `nativeAttach`, `nativeRead`, `nativeScanAOB`, `nativeFindModuleBase`, `nativeCompress/Decompress/Encrypt/DecryptPayload`, `nativeCompute`, `nativeOffset`, `nativeOffset2`, `nativeSetSeed`, `nativeWatchdogCheck`, `nativeHydratePayloads`, `addClassRule`, `clearClassRules`, `classRuleCount`, `restoreBinderCalling*`×2 | **4 — `enableIO`, `addIORule`, `nativeInitContext`, `nativeProcessPair`** ← กลุ่มอันตรายสุด: log บอกสำเร็จ |
| **ไม่มี Kotlin เรียก (dead)** | 8 — `decryptString`, `nativeDeriveKey`, `nativeEntropy`, `nativeValidate`, `nativeDecryptPayloadByHash`, `loadEmptyDex`, `setBinderCallingPid/UidOverride` | 7 — `hideXposed`, `installNetworkHttpProbe`, `nativeExchangeKeys`, `nativeProcessTriple`, `nativeReflectUpdate`, `nativeWriteLog`, `setAccessible`×2 |

> ช่องซ้ายล่างคือ **feature ที่เขียนเสร็จแล้วแต่ไม่ได้ต่อสาย** (binder uid spoof, string decryptor, payload-by-hash) — "ตกหล่น" ในความหมายตรงตัวที่สุด

### 5.2 Manifest เทียบต้นแบบ SNAKE (F3, 51 components)

| ตระกูล component | SNAKE | AetherEngine | สถานะ |
|---|---|---|---|
| `ProxyActivity$P0..P3` | ✓ | ✓ | ตรง |
| **`ProxyActivity$P0_L..P3_L`** | ✓ | **—** | **ตก (C7)** |
| **`ProxyActivity` (base)** | ✓ | **—** | **ตก (C7)** |
| `TransparentProxyActivity$Pn` / `ProxyPendingActivity$Pn` / `ProxyService$Pn` / `ProxyJobService$Pn` / `ProxyContentProvider$Pn` | ✓ | ✓ | ตรง (slot 0..3 = `MAX_SLOTS` ทั้ง 6 ตระกูล ✅) |
| `SystemCallProvider` / `FileProvider` / `ProxyBroadcastReceiver` / `DaemonService(+$DaemonInnerService)` / `ProxyVpnService` / `InternalWebBrowser` | ✓ | ✓ (rename → `Aether*`) | ตรงตาม rename map ที่ประกาศในสคริปต์ |
| manifest component ที่ประกาศแต่ไม่มี class รองรับ | — | **0** | ✅ ผ่าน |

### 5.3 Flutter ↔ Kotlin channel

| ทิศทาง | ผล |
|---|---|
| Dart เรียก **13** method → Kotlin มี branch รองรับ | **13/13 ✅** ไม่มี `MissingPluginException` ซ่อนอยู่ (`chainCheck`, `compressPayload`, `getEngineStats`, `getVirtualAppStatus`, `handshakeStatus`, `isTargetInstalled`, `launchApp`, `launchInSandbox`, `nativeCompute`, `readDiag`, `readMemory`, `scanAOB`, `testVirtualFS`) |
| Kotlin มี branch แต่ Dart ไม่เรียก | **2** — `launchGame`, `getEngineStatus` (dead surface) |

### 5.4 Gate ที่มีอยู่ "พิสูจน์อะไร" และ "พิสูจน์ไม่ได้ว่าอะไร"

| Gate | พิสูจน์ได้ | พิสูจน์ไม่ได้ (ช่องที่ทำให้พลาดรอบนี้) |
|---|---|---|
| `jni_parity.py` (G3) | ชื่อ + descriptor ตรงกัน 1:1 | body ว่างหรือไม่ · มีคนเรียกหรือไม่ |
| `native_chain_parity.py` (G3b) | signature ตรง F2 · อยู่ในตาราง · มี call-site · **อยู่ในไฟล์ที่กำหนด** | body ว่าง · call-site นั้นถูกรันจริงบนเครื่อง · path หลักฐานเป็น absolute (พังบนเครื่องอื่น) |
| `preflight.sh` G1/G1.5/G2/G4 | YAML, `package=`, brace balance, unresolved reference | พฤติกรรม runtime ทั้งหมด |
| unit tests (34) | DSL/builder/parser | path สำเร็จของ chain (stub คืน null) |
| device test ด้วยมือ (ปุ่ม 1234 / Diag) | เห็น log บางส่วน | crash log ไม่โผล่ใน Diag (C15) · บรรทัด identity หาย (C15) |

---

## 6. ขอบเขตของหลักฐาน — อะไร "ยืนยันได้" และอะไร "อ้างลอย ๆ"

**ยืนยันได้จาก `Codes/SnakeLogic` (committed):**
- SNAKE มี native ที่ประกาศใน dex **13 ตัว** (`com.snake.helper.Native` 11 + `flagger` 2) และ **ไม่มี `Java_*` export เลย** → ผูกผ่าน `RegisterNatives` 3 จุด (F4) — การที่ AetherEngine ใช้ `RegisterNatives` ตารางเดียว 39 ตัวจึงเป็น *การออกแบบใหม่* ไม่ใช่ parity 1:1 (ไม่ผิด แต่ไม่ควรเรียกว่าตรงกัน)
- class ที่โค้ดอ้างถึง (`jv0`, `b8`, `yu0`, `z10`, `vx`, `p60`, `ne0`) **มีอยู่จริง** ใน F2 ในฐานะ `Landroidx/appcompat/view/menu/*;` ✅
- `System.loadLibrary('engine')` เกิดใน `Lcom/snake/App;-><clinit>()V` (F2) — ฝั่ง Aether เรียกจาก `AetherApp.onCreate` → `EngineLoader.load` (ต่างตำแหน่งโดยเจตนาและปลอดภัยกว่า เพราะ `ExceptionInInitializerError` หลุด catch) ✅
- โครง component 51 ตัวใน F3 (ใช้เทียบ §5.2)

**ยืนยันไม่ได้จากหลักฐานที่ commit (ต้องนับเป็น UNVERIFIED จนกว่าจะแนบ transcript):**
- หมายเลขบรรทัด/ตำแหน่ง hop ทั้งหมด (`jv0.O2:245`, `b8:79`, `a7.m:171`, `jv0.P2:283`, `tz.java:451`, `j8.java:35`, `bt0.java:11`, `lv0.java:72` …) — F2 ให้ caller ระดับ class เท่านั้น
- ชื่อ schema `_Engine_|_init_process_`, `_Engine_|_client_`, `_S_|_*` และ authority `com.snake.proxy_content_provider_<n>` — **ไม่มีสตริงเหล่านี้ใน bundle หลักฐานเลย** (ตรวจแล้ว: 0 hit ใน `fragments/`)
- `NATIVE_CALLSITE_MAP.md` (T2), `NATIVE_LOGIC.md`, `DATA_DUMP.md`, `REPORT.md` — ถูกอ้าง 4 เอกสาร ไม่ได้ commit ทั้งสอง repo

> ข้อเสนอ: ถ้า transcript อยู่ที่ไหนสักแห่ง ให้ commit เข้า `AetherEngine/reference/` (หรือ `Codes/SnakeLogic/fragments/`) แล้วให้ gate อ่านจาก repo-relative path — จะทำให้ข้ออ้าง parity ทั้งชุด "ตรวจซ้ำได้" ทันที และปิด C10 ทั้งสองข้อ

---

## 7. แผนแก้ตามลำดับ (fastest path → guest boot จริง)

แต่ละขั้นมี **เกณฑ์ตรวจรับ** ที่กดดูได้จาก UI ที่มีอยู่แล้ว (ปุ่ม `1234 chain-check` และปุ่ม Diag) — ไม่ต้องใช้ adb

| ลำดับ | งาน | ไฟล์ที่ต้องแตะ | เกณฑ์ตรวจรับ |
|--:|---|---|---|
| 1 | **เปิดตาให้ระบบก่อน** — ให้ `launchInSandbox` คืน `Map{ok,stage,reason}` + `ProxyActivity` เขียน `diag/launch_result.json` + `readDiag` แนบ `crash_logs/crash_*.log` + ย้าย `DiagLog.init` เป็นบรรทัดแรกของ `onCreate` | `EngineBridge.kt`, `AetherOrchestrator.kt`, `ProxyActivity.kt`, `home_screen.dart` | กด Play แล้ว UI บอก **stage ที่ตาย** (เช่น `stage=bind reason=mInitialApplication NoSuchField`) — จบการเดา |
| 2 | **hidden-API exemption** ผ่าน JNI slot ที่ว่างอยู่ (`setAccessible`) เรียกจาก `AetherApp.onCreate` ทุก process | `aether_core.cpp`, `Engine.kt`(มีแล้ว), `AetherApp.kt` | `chainCheck` hop 2 = `sCache N/N`, hop 3 = `AMS mInstance=PROXY ✓` |
| 3 | **ปิดกับดัก identity** — `GuestProcessHolder.rebind()`, diagnostic ใช้ slot สุดท้าย, ยกเลิก `else 0`, p3≠intent = error | `GuestProcessRegistry.kt`, `EngineBridge.kt`, `AetherOrchestrator.kt:529`, `ProxyActivity.kt:37` | กด `1234` แล้วตามด้วย Play → guest ยังได้ identity ถูก (`trace.log` มีบรรทัด `identity:` และค่าเป็นเกม ไม่ใช่ `com.aether.test.chaincheck`) |
| 4 | **Hook A จริง** — rewrite intent ที่ binder proxy ของ service `activity` (หรือลบ `execStartActivity` ทิ้งแล้วใช้ทางอื่น) | `ServiceBinderProxy.kt`, `AetherInstrumentation.kt` | เปิด activity ที่สองใน guest แล้วไม่หลุดออกนอก sandbox (ดู `trace.log` ว่ามี `rewriteToStub`) |
| 5 | **lifecycle** — `ProxyActivity.onDestroy` → `GuestRuntimeBridge.close()` + reset `AetherInstrumentation.installed` + `VirtualAppContainer` identity | `ProxyActivity.kt`, `AetherInstrumentation.kt` | กด Play ซ้ำ 3 ครั้งติด ได้ผลเหมือนครั้งแรกทุกครั้ง |
| 6 | **ต่อ native ที่เขียนเสร็จแล้ว** — `enableIO`/`addIORule` → `virtual_fs.cpp`; gate ตรวจ body ว่าง; เปลี่ยน log ที่อ้างความสำเร็จให้เป็นค่าที่ native คืน | `aether_core.cpp`, `CMakeLists.txt`(ไม่ต้องแก้), `native_chain_parity.py`, `AetherOrchestrator.kt:137` | `nm -D libaether.so`/size โตขึ้น + `testVirtualFS` รายงานผลจาก native จริง |
| 7 | **parity ที่ตก** — เพิ่ม `ProxyActivity$P0_L..P3_L` (+ base), เรียก `setBinderCalling*Override` ตอนติดตั้ง identity guest, ส่ง `sandboxDir` ใน v1 fallback | manifest ×2, `ProxyActivity.kt`, `VirtualAppContainer.kt`, `GuestRuntimeBridge.kt`/`VirtualAppLoader.kt` | หมุนจอใน guest แล้วไม่เด้ง · §5.2 เหลือช่องว่าง 0 |
| 8 | **ทำให้ gate reproduce ได้** — เลิกใช้ absolute path, vendor F2 (หรือชี้ไปที่ Codes bundle ผ่าน env), commit transcript 4 ชิ้น, เพิ่ม gate ใหม่: *stub-body*, *dead-native*, *manifest↔MAX_SLOTS*, *orphan-TU* | `scripts/*.py`, `reference/`, `.github/workflows/ci.yml` | clone repo ใหม่บนเครื่องเปล่า → `bash scripts/preflight.sh` รันครบทุก gate และไม่ FAIL เพราะ path |

**หมายเหตุเชิงกลยุทธ์:** ขั้น 1–3 เป็นงานเล็ก (รวมกันราว 150–250 บรรทัด) แต่ปิดสาเหตุของอาการ "เด้งกลับ" ที่รายงานมาทั้งหมด และยังทำให้รอบทดสอบถัดไปมีข้อมูลจริงแทนการเดา — แนะนำให้ทำ 3 ขั้นนี้ใน commit เดียวแล้วทดสอบบนเครื่อง ก่อนขยับไปขั้น 4+

---

## 8. ไฟล์ใน bundle นี้

| ไฟล์ | เนื้อหา |
|---|---|
| `AUDIT.md` | รายงานนี้ (เอกสารหลัก) |
| `findings.csv` | 27 findings รายข้อ — คอลัมน์ `id, check, severity, kind, title_en, title_th, evidence, impact, fix` |
| `AUDIT_SUMMARY.txt` | digest แบบอ่านใน terminal (สร้างจากสคริปต์) |
| `audit_facts.json` | ข้อเท็จจริงตัวเลขทั้งหมดที่อ้างในรายงาน (JNI quadrant, manifest diff, hidden-API inventory, orphan TU, gate/test facts) |
| `tools/audit_aether_engine.py` | ตัวสร้าง — deterministic, ไม่ใช้ network, ทุก finding ผูกกับ `file:line` ที่อ่านจาก working tree จริง |

**รันซ้ำ:**
```bash
cd /home/user/Codes/AetherEngineAudit
python3 tools/audit_aether_engine.py \
    --aether   /home/user/AetherEngine \
    --evidence /home/user/Codes/SnakeLogic
# → เขียน findings.csv / audit_facts.json / AUDIT_SUMMARY.txt และพิมพ์ digest
```

*ข้อจำกัดที่ควรรู้: สคริปต์ตรวจ "ความสอดคล้องเชิงโครงสร้าง" (สัญญาระหว่างชั้น, การมีอยู่ของ call-site, body ว่าง, include closure, manifest↔source) — มันพิสูจน์ไม่ได้ว่า reflection จุดใดจุดหนึ่งจะผ่านบน Android รุ่นใดรุ่นหนึ่ง ต้องยืนยันบนเครื่องด้วยเกณฑ์ตรวจรับใน §7*
