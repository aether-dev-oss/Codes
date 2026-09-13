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
| `SnakeLogic/call_linkage.csv` | hop ทั้งหมด 691 แถว — หนึ่งแถวต่อหนึ่งการโอน control เรียงตาม layer/module/offset |
| `SnakeLogic/call_linkage.json` | กราฟเดียวกันแบบ machine-readable: nodes, edges, chains, symbol tables, checks |
| `SnakeLogic/VERIFICATION.txt` | การตรวจระดับไบต์ 45 รายการของ `LINKAGE.md` |
| `SnakeLogic/links.csv`, `links.json` | กราฟ fact ของ `LINKAGE.md` |
| `SnakeLogic/fragments/` | F1–F8: ผลวิเคราะห์ดิบ (APK, dex, manifest, disassembly ของ `libengine.so`, Dart snapshot, Ghidra, blutter) |
| `SnakeLogic/output/blutter/` | ผลลัพธ์ blutter: `pp.txt`, `objs.txt`, `asm/*.dart`, `ida_script/addNames.py` |
| `tools/build_call_linkage.py` | ตัวสร้าง `CALL_LINKAGE.md` + CSV + JSON จากชุดหลักฐาน |

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
```

ค่าเริ่มต้นคือ `--lang both`: คำอธิบายเป็นไทย ส่วนตาราง offset ชื่อ symbol และ
mnemonic คงเป็นอังกฤษตามต้นฉบับ ผลลัพธ์ deterministic — รันซ้ำได้ไฟล์เหมือนเดิมทุกไบต์
และ `SnakeLogic/` กับ `SnakeLogic.zip` ให้ลายนิ้วมือเดียวกัน (`d0eb6c05…`) ซึ่งถูกตรวจทุกครั้งที่ build

## สายการเรียก 11 สาย (the 11 chains)

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
