# Codes

หลักฐานและผลวิเคราะห์ของตัวอย่าง `SNAKE.apk` (`com.snake`, versionName 2.2.6) —
แอป Flutter ที่แนบ `libengine.so` ตัวที่ถูกปกป้องไว้มาด้วย

Evidence and analysis artifacts for the `SNAKE.apk` sample (`com.snake`,
versionName 2.2.6), a Flutter app shipping a protected `libengine.so`.

## ผัง repo (layout)

| path | คืออะไร (what it is) |
|---|---|
| `SnakeLogic.zip` | ชุดหลักฐานต้นทางที่อัปโหลดมา (the uploaded evidence bundle) |
| `SnakeLogic/` | ชุดเดียวกันแบบแตกไฟล์ — ที่ที่เอกสารวิเคราะห์ทั้งหมดอยู่ (the same bundle extracted; this is where the analysis documents live) |
| `SnakeLogic/LINKAGE.md` | ข้อเท็จจริงข้าม fragment: fact ไหนใน fragment ไหนพูดถึงเรื่องเดียวกัน (cross-fragment *fact* linkage) |
| `SnakeLogic/CALL_LINKAGE.md` | **สายการเรียก**: instruction ที่ offset ไหนโอน control ไปยังอะไร เรียงเป็น chain ข้าม layer (cross-layer *call* linkage, instruction ↔ offset) |
| `SnakeLogic/call_linkage.csv` | hop ทั้งหมด 965 แถว — หนึ่งแถวต่อหนึ่งการโอน control (หรือต่อการโหลดค่าคงที่หนึ่งครั้ง) เรียงตาม layer/module/offset |
| `SnakeLogic/call_linkage.json` | กราฟเดียวกันแบบ machine-readable: nodes, edges, chains, symbol tables, checks |
| `SnakeLogic/BOOT_LINKAGE.md` | **แกนบูต `SP-01`**: ประกอบ chain CH-01..CH-12 + tier เฟรมเวิร์ก + tier ใหม่ฝั่ง Dart เป็นแกนเดียว 160 ฮอป ตั้งแต่ process boot จนถึง endpoint C2 |
| `SnakeLogic/boot_linkage.csv`, `boot_linkage.json` | แกนเดียวกันแบบ machine-readable: hop ต่อแถว พร้อม `refs` ที่ตรวจกับ bundle จริงตอน build |
| `SnakeLogic/VERIFICATION.txt` | การตรวจระดับไบต์ 45 รายการของ `LINKAGE.md` |
| `SnakeLogic/links.csv`, `links.json` | กราฟ fact ของ `LINKAGE.md` |
| `SnakeLogic/fragments/` | F1–F8: ผลวิเคราะห์ดิบ (APK, dex, manifest, disassembly ของ `libengine.so`, Dart snapshot, Ghidra, blutter) |
| `SnakeLogic/fragments/F9_kos_boot_stack.txt` | **operator-supplied** (ไม่ได้อยู่ใน `SnakeLogic.zip` และไม่ใช่ไบต์ของ SNAKE): สแตกบูตฝั่งเฟรมเวิร์กจาก KOS/Kaori module host ใช้เป็น *โครงรูป* ของ tier T0 เท่านั้น — หัวไฟล์ระบุ provenance ไว้ชัด |
| `AetherEngineAudit/` | ผล audit การ rebuild `AetherEngine` เทียบหลักฐานใน bundle: `AUDIT.md`, `findings.csv` (27 รายการ), `audit_facts.json`, `tools/audit_aether_engine.py` |
| `SnakeLogic/output/blutter/` | ผลลัพธ์ blutter: `pp.txt`, `objs.txt`, `asm/*.dart`, `ida_script/addNames.py` |
| `tools/build_call_linkage.py` | ตัวสร้าง `CALL_LINKAGE.md` + CSV + JSON จากชุดหลักฐาน |
| `tools/build_boot_linkage.py` | ตัวสร้าง `BOOT_LINKAGE.md` + CSV + JSON — นำเข้า edge ที่พิสูจน์แล้วจาก `call_linkage.json` มาเรียงเป็นแกนเดียว แล้วเพิ่ม tier T0 (F9) กับ tier T4 (ไล่จาก `pp.txt`/`asm/` ตรง ๆ) |

ไบนารี (`binaries/libapp.so`, `binaries/libengine.so`, `flutter_libs/libflutter.so`)
**ไม่ได้อยู่ใน repo นี้** — เอกสารทั้งหมดอ้าง offset จาก fragment ที่ commit ไว้ และทุกแถวระบุแหล่งที่มา
(`fragments/F4d_...asm:28` เป็นต้น) เพื่อให้ตรวจกลับไปหาต้นทางได้

The binaries are **not** in this repository. Every document quotes offsets from
the committed fragments and cites its source line, so each row can be checked
against the listing it came from.

## สร้างเอกสารซ้ำ (regenerating)

```bash
python3 tools/build_call_linkage.py                  # อ่าน SnakeLogic/ (หรือ SnakeLogic.zip ถ้ายังไม่แตก)
python3 tools/build_call_linkage.py --check          # ตรวจอย่างเดียว ไม่เขียนไฟล์
python3 tools/build_call_linkage.py --lang en        # prose ภาษาอังกฤษล้วน
python3 tools/build_call_linkage.py --src SnakeLogic.zip --out /tmp/out

python3 tools/build_boot_linkage.py                  # ต้องมี call_linkage.json ก่อน (มันนำเข้า edge จากที่นี่)
python3 tools/build_boot_linkage.py --bundle SnakeLogic --quiet
```

ค่าเริ่มต้นคือ `--lang both`: คำอธิบายเป็นไทย ส่วนตาราง offset ชื่อ symbol และ
mnemonic คงเป็นอังกฤษตามต้นฉบับ ทุก hop อ้างบรรทัดหลักฐานเสมอ (เช่น
`output/blutter/asm/Kkg.dart:58`) ผลลัพธ์ deterministic — รันซ้ำได้ไฟล์เหมือนเดิมทุกไบต์
และ `SnakeLogic/` กับ `SnakeLogic.zip` ให้ลายนิ้วมือเดียวกัน (`d0eb6c05…`) ซึ่งถูกตรวจทุกครั้งที่ build

## สายการเรียก 12 สาย (the 12 chains)

| chain | จาก → ไป |
|---|---|
| `CH-01` | `classes.dex+0x2b6c2e` (`System.loadLibrary("engine")`) → linker → `.init_array` → `JNI_OnLoad` |
| `CH-02` | dynamic loader → constructor 44 ตัว (slot → target offset) |
| `CH-03` | `JNI_OnLoad` → mmap RWX 2 หน้า → เขียน opcode `B` → `blr` ออกนอก image |
| `CH-04` | registration site `0xf3a08` (nMethods=10) → FindClass → `com/snake/helper/Native` |
| `CH-05` | registration site `0xb40a8` (nMethods=2) → fnPtr `0x81eeb0` → `com/snake/helper/flagger` |
| `CH-06` | `.mytext` handler → `FromReflectedMethod` (`+0x38`) → `bl 0xb01c4` |
| `CH-07` | registration site `0xb0140` (nMethods=1) → `pjowqpxe` → `ExceptionClear` บนเส้นทางล้มเหลว |
| `CH-08` | invoke site ฝั่ง Java 20 จุด → native 13 ตัว |
| `CH-09` | `FlutterJNI.loadLibrary()` → `libflutter.so` → `JNI_OnLoad` (native 41 ตัว) |
| `CH-10` | Dart MethodCall handler 3 ตัว (`_pfc`/`_cec`/`_eec`) + สัญลักษณ์ engine 11 ตัว |
| `CH-11` | Dart `bl`/`b` ระดับ instruction จัดอันดับตาม fan-in |
| `CH-12` | endpoint C2 `https://rest.snakeseller.com/api/request/` — อะไรถูกเรียกและอะไรถูกโหลดหลังเช็ค `success` ผ่าน (ไล่ระดับคำสั่งที่ `0x533110`) |

## แกนบูต `SP-01` (boot → C2 endpoint)

`BOOT_LINKAGE.md` ตอบคำถามที่ `CALL_LINKAGE.md` ยังไม่ตอบเป็นเส้นเดียว:
**ตั้งแต่ process เริ่ม จนถึง `https://rest.snakeseller.com/api/request/` ผ่านอะไรบ้าง**

| tier | เนื้อหา | ฮอป |
|---|---|---:|
| `T0` framework | `ZygoteInit.main` → … → `Instrumentation.newApplication` (โครงรูปจาก F9 — `conf=shape`) | 18 |
| `T1` dex | `com.snake.App.<clinit>` → `loadLibrary("engine")`, manifest roles, invoke site 20 จุด | 28 |
| `T2` native | `.init_array` 44 สล็อต → `JNI_OnLoad` `0xf3fa0` → RWX + opcode สังเคราะห์ → `RegisterNatives` ×3 → native 13 ตัว | 38 |
| `T3` jni/flutter | `loadLibrary("flutter")` → MethodCall handler 3 ตัว + สัญลักษณ์ engine 11 ตัว → *[G1]* isolate bootstrap | 18 |
| `T4` dart | ตระกูล `Xu<dynamic>` (`_ioa`/`_Bpa`/`_aqa`) → `_ioa.ugf` → helper `0x1a5b64` → รูทีนคำขอ C2 `0x2f8928` | 30 |
| `T5` dart | `pp+0x139d8` = endpoint (**TERMINUS**) → ตรวจ response `0x533110` → CH-12 ทั้ง 27 ฮอป | 28 |

เรื่องที่ค้นพบใหม่ใน tier T4/T5:

1. ตระกูล task สามตัวในสามไลบรารี (`_ioa`[kkg], `_Bpa`[Kkg], `_aqa`/`_bqa`[Xkg]) สืบจาก
   `Xu<X0 bound Vu>` ตัวเดียวกัน และเรียก helper ต่อเนื่อง `0x1a5b64` ตัวเดียวกัน (พบ 3 จุดเรียกพอดี)
2. สโตร์สถานะร่วม `[xkg] Yoa` (static late 13 ฟิลด์) มีกฎ `field_table = 2 × offset` —
   ฝั่ง response เขียน `Yoa.hne` (`0xe78`→`0x1cf0`) ฝั่ง `_ioa.ugf` อ่าน `Yoa.tKb` (`0xe7c`→`0x1cf8`)
3. ใน allocation run ของ endpoint (38 สล็อต) มี **33 สล็อตที่โค้ดใน dump ไม่โหลดเลย** —
   ที่ถูกโหลด 5 สล็อตเป็นของฝั่งตรวจ response ทั้งหมด: *ฝั่ง response ถูก disassemble ฝั่ง request ไม่ถูก*
4. registry ระดับแอป `[nkg] ooa` มี static late final 180 ฟิลด์ (`0x1698..0x1c40` ชิดกับช่วงของ `Yoa`)
   และ **ไม่มี accessor เลยสักตัว**
5. ค่า hex สองก้อน (`pp+0x13918` ยาว 54, `pp+0x13920` ยาว 32) นอนอยู่ระหว่างสล็อต closure ของ `_Bpa`
   — เก็บเป็น `candidate` เพราะไม่มีโค้ดโหลด (สูตรปิดช่องว่าง G6)

ช่องว่าง 7 รายการ (`G1`–`G7`) ถูกระบุไว้พร้อม *สูตรปิด* ทุกช่อง และไม่ถูกตัดออกจากแกน
สคริปต์ตรวจ reference หลักฐาน 232 จุดกับ bundle จริงตอน build — ถ้า resolve ไม่ได้ build จะ fail
(ปัจจุบัน 42/42 PASS)
