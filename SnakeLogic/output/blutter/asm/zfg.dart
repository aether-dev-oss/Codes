// lib: , url: zfg

// class id: 1048976, size: 0x8
class :: {
}

// class id: 677, size: 0x10, field offset: 0x8
abstract class _Cba extends Object {
}

// class id: 678, size: 0x20, field offset: 0x10
class _Eba extends _Cba {
}

// class id: 679, size: 0x20, field offset: 0x10
class _Dba extends _Cba {
}

// class id: 680, size: 0x10, field offset: 0x8
abstract class _rba extends Object {
}

// class id: 681, size: 0x10, field offset: 0x10
class _vba extends _rba {

  [closure] void zxc(dynamic, LZ) {
    // ** addr: 0x4dcf18, size: -0x1
  }
}

// class id: 682, size: 0x10, field offset: 0x10
class _uba extends _rba {

  [closure] void zxc(dynamic, LZ) {
    // ** addr: 0x4dce50, size: -0x1
  }
}

// class id: 683, size: 0x10, field offset: 0x10
class _tba extends _rba {

  [closure] void zxc(dynamic, LZ) {
    // ** addr: 0x4dcce8, size: -0x1
  }
}

// class id: 684, size: 0x10, field offset: 0x10
class _sba extends _rba {

  [closure] void zxc(dynamic, LZ) {
    // ** addr: 0x4dcbf0, size: -0x1
  }
}

// class id: 685, size: 0xc, field offset: 0x8
//   const constructor, 
abstract class mba<X0> extends Object {
}

// class id: 686, size: 0xc, field offset: 0xc
//   const constructor, 
class nba<X0> extends mba<X0> {
}

// class id: 687, size: 0x8, field offset: 0x8
abstract class lba extends Object {
}

// class id: 688, size: 0x34, field offset: 0x8
class _qba extends lba {

  [closure] Future<Null> <anonymous closure>(dynamic, dynamic) async {
    // ** addr: 0x518970, size: 0xa8
    // 0x518970: EnterFrame
    //     0x518970: stp             fp, lr, [SP, #-0x10]!
    //     0x518974: mov             fp, SP
    // 0x518978: AllocStack(0x28)
    //     0x518978: sub             SP, SP, #0x28
    // 0x51897c: SetupParameters(_qba this /* r1 */)
    //     0x51897c: stur            NULL, [fp, #-8]
    //     0x518980: movz            x0, #0
    //     0x518984: add             x1, fp, w0, sxtw #2
    //     0x518988: ldr             x1, [x1, #0x18]
    //     0x51898c: ldur            w2, [x1, #0x17]
    //     0x518990: add             x2, x2, HEAP, lsl #32
    //     0x518994: stur            x2, [fp, #-0x10]
    // 0x518998: CheckStackOverflow
    //     0x518998: ldr             x16, [THR, #0x38]  ; THR::stack_limit
    //     0x51899c: cmp             SP, x16
    //     0x5189a0: b.ls            #0x518a10
    // 0x5189a4: InitAsync() -> Future<Null?>
    //     0x5189a4: ldr             x0, [PP, #0xd58]  ; [pp+0xd58] TypeArguments: <Null?>
    //     0x5189a8: bl              #0x519270  ; InitAsyncStub
    // 0x5189ac: ldur            x0, [fp, #-0x10]
    // 0x5189b0: LoadField: r1 = r0->field_f
    //     0x5189b0: ldur            w1, [x0, #0xf]
    // 0x5189b4: DecompressPointer r1
    //     0x5189b4: add             x1, x1, HEAP, lsl #32
    // 0x5189b8: LoadField: r3 = r1->field_23
    //     0x5189b8: ldur            w3, [x1, #0x23]
    // 0x5189bc: DecompressPointer r3
    //     0x5189bc: add             x3, x3, HEAP, lsl #32
    // 0x5189c0: stur            x3, [fp, #-0x18]
    // 0x5189c4: r1 = <void?>
    //     0x5189c4: ldr             x1, [PP, #0x2f8]  ; [pp+0x2f8] TypeArguments: <void?>
    // 0x5189c8: r2 = Instance_Ca
    //     0x5189c8: add             x2, PP, #0xd, lsl #12  ; [pp+0xdda8] Obj!Ca@36cdb1
    //     0x5189cc: ldr             x2, [x2, #0xda8]
    // 0x5189d0: r0 = call 0x1afcac
    //     0x5189d0: bl              #0x1afcac
    // 0x5189d4: mov             x1, x0
    // 0x5189d8: stur            x1, [fp, #-0x20]
    // 0x5189dc: r0 = Await()
    //     0x5189dc: bl              #0x518e60  ; AwaitStub
    // 0x5189e0: ldur            x16, [fp, #-0x18]
    // 0x5189e4: str             x16, [SP]
    // 0x5189e8: r1 = Instance_nS
    //     0x5189e8: add             x1, PP, #0xd, lsl #12  ; [pp+0xddb0] Obj!nS@35c511
    //     0x5189ec: ldr             x1, [x1, #0xdb0]
    // 0x5189f0: r4 = const [0, 0x2, 0x1, 0x1, irb, 0x1, null]
    //     0x5189f0: add             x4, PP, #0xd, lsl #12  ; [pp+0xddb8] List(7) [0, 0x2, 0x1, 0x1, "irb", 0x1, Null]
    //     0x5189f4: ldr             x4, [x4, #0xdb8]
    // 0x5189f8: r0 = call 0x1afb34
    //     0x5189f8: bl              #0x1afb34
    // 0x5189fc: mov             x2, x0
    // 0x518a00: r1 = Instance_uT
    //     0x518a00: ldr             x1, [PP, #0x38f8]  ; [pp+0x38f8] Obj!uT<Object?>@35c411
    // 0x518a04: r0 = __unknown_function__()
    //     0x518a04: bl              #0x518a18  ; [] ::__unknown_function__
    // 0x518a08: r0 = Null
    //     0x518a08: mov             x0, NULL
    // 0x518a0c: r0 = ReturnAsyncNotFuture()
    //     0x518a0c: b               #0x519244  ; ReturnAsyncNotFutureStub
    // 0x518a10: r0 = StackOverflowSharedWithoutFPURegs()
    //     0x518a10: bl              #0x554734  ; StackOverflowSharedWithoutFPURegsStub
    // 0x518a14: b               #0x5189a4
  }
  [closure] static bool yyc(dynamic, _qba) {
    // ** addr: 0x1b2a70, size: -0x1
  }
  [closure] static bool Ayc(dynamic, _qba) {
    // ** addr: 0x1b2a38, size: -0x1
  }
  [closure] bool <anonymous closure>(dynamic, Sba) {
    // ** addr: 0x1a93ac, size: -0x1
  }
  [closure] void <anonymous closure>(dynamic) {
    // ** addr: 0x1a9200, size: -0x1
  }
  [closure] void <anonymous closure>(dynamic) {
    // ** addr: 0x1a9318, size: -0x1
  }
  [closure] static bool zyc(dynamic, _qba) {
    // ** addr: 0x1a9ba4, size: -0x1
  }
  [closure] static bool <anonymous closure>(dynamic, _qba) {
    // ** addr: 0x1adf34, size: -0x1
  }
  [closure] void <anonymous closure>(dynamic) {
    // ** addr: 0x1af97c, size: -0x1
  }
}

// class id: 689, size: 0x10, field offset: 0x8
//   const constructor, 
class iba extends Object {
}

// class id: 690, size: 0x14, field offset: 0x10
//   const constructor, 
abstract class jba<X0> extends iba {
}

// class id: 691, size: 0x8, field offset: 0x8
//   const constructor, 
class _hba extends Object {
}

// class id: 692, size: 0x20, field offset: 0x8
abstract class gba<X0> extends _hba {

  [closure] Null <anonymous closure>(dynamic, void) {
    // ** addr: 0x1af818, size: -0x1
  }
  [closure] Null <anonymous closure>(dynamic, void) {
    // ** addr: 0x1b0174, size: -0x1
  }
}

// class id: 716, size: 0x8, field offset: 0x8
abstract class LZ extends Object {

  static late final Expando<Aba> _btc; // offset: 0x6c4
}

// class id: 760, size: 0xc, field offset: 0x8
//   const constructor, 
class Hba extends IV {

  bool field_8;
}

// class id: 1561, size: 0x38, field offset: 0x34
class _Fba extends Gba<dynamic> {

  [closure] Pa<String?, List<Object>> <anonymous closure>(dynamic, dynamic, dynamic) {
    // ** addr: 0x48af40, size: -0x1
  }
}

// class id: 2058, size: 0x1c, field offset: 0x14
//   transformed mixin,
abstract class _yba extends Xu<dynamic>
     with Zv<X0 bound Vu> {

  [closure] void _yUb(dynamic) {
    // ** addr: 0x231f80, size: -0x1
  }
}

// class id: 2059, size: 0x2c, field offset: 0x1c
//   transformed mixin,
abstract class _zba extends _yba
     with dI<X0 bound Vu> {

  [closure] void _vxc(dynamic, Gba<Object?>) {
    // ** addr: 0x33f66c, size: -0x1
  }
  [closure] void qPa(dynamic) {
    // ** addr: 0x33eaec, size: -0x1
  }
}

// class id: 2060, size: 0x6c, field offset: 0x2c
class Aba extends _zba {

  late ZY<Xba> _Vyc; // offset: 0x2c
  late List<LZ> _czc; // offset: 0x4c

  [closure] void <anonymous closure>(dynamic) {
    // ** addr: 0x1a5e34, size: -0x1
  }
  [closure] void _pTb(dynamic, qz) {
    // ** addr: 0x2c2178, size: -0x1
  }
  [closure] void _Ozc(dynamic, oy) {
    // ** addr: 0x2c20c0, size: -0x1
  }
  [closure] bool <anonymous closure>(dynamic, Hba) {
    // ** addr: 0x2c1f5c, size: -0x1
  }
  [closure] void _kzc(dynamic) {
    // ** addr: 0x37c9e0, size: -0x1
  }
  [closure] void _jzc(dynamic) {
    // ** addr: 0x37c710, size: -0x1
  }
  [closure] void <anonymous closure>(dynamic, Ca) {
    // ** addr: 0x37c970, size: -0x1
  }
  [closure] bool <anonymous closure>(dynamic, _qba) {
    // ** addr: 0x33e2d0, size: -0x1
  }
  [closure] _qba <anonymous closure>(dynamic, gba<dynamic>) {
    // ** addr: 0x33eb5c, size: -0x1
  }
}

// class id: 2352, size: 0x14, field offset: 0x10
//   const constructor, 
class kba extends Cv {
}

// class id: 2526, size: 0x3c, field offset: 0xc
//   const constructor, 
class oba extends Vu {

  [closure] static List<gba<dynamic>> Qyc(dynamic, Aba, String) {
    // ** addr: 0x2bbfa0, size: -0x1
  }
  [closure] static bool <anonymous closure>(dynamic, gba<dynamic>?) {
    // ** addr: 0x2bc730, size: -0x1
  }
}

// class id: 3427, size: 0x14, field offset: 0x14
enum _Bba extends _Enum {

  _Mint field_8;
  _OneByteString field_10;
}

// class id: 3428, size: 0x14, field offset: 0x14
enum _pba extends _Enum {

  _Mint field_8;
  _OneByteString field_10;
}

// class id: 3429, size: 0x14, field offset: 0x14
enum fba extends _Enum {

  _Mint field_8;
  _OneByteString field_10;
}

// class id: 3611, size: 0x28, field offset: 0xc
//   transformed mixin,
abstract class _wba extends Iterable<dynamic>
     with ux {
}

// class id: 3612, size: 0x2c, field offset: 0x28
class _xba extends _wba {

  _qba [](_xba, int) {
    // ** addr: 0x5421a4, size: 0xa8
    // 0x5421a4: EnterFrame
    //     0x5421a4: stp             fp, lr, [SP, #-0x10]!
    //     0x5421a8: mov             fp, SP
    // 0x5421ac: ldr             x0, [fp, #0x10]
    // 0x5421b0: r2 = Null
    //     0x5421b0: mov             x2, NULL
    // 0x5421b4: r1 = Null
    //     0x5421b4: mov             x1, NULL
    // 0x5421b8: branchIfSmi(r0, 0x5421e0)
    //     0x5421b8: tbz             w0, #0, #0x5421e0
    // 0x5421bc: r4 = LoadClassIdInstr(r0)
    //     0x5421bc: ldur            x4, [x0, #-1]
    //     0x5421c0: ubfx            x4, x4, #0xc, #0x14
    // 0x5421c4: sub             x4, x4, #0x3b
    // 0x5421c8: cmp             x4, #1
    // 0x5421cc: b.ls            #0x5421e0
    // 0x5421d0: r8 = int
    //     0x5421d0: ldr             x8, [PP, #0xf80]  ; [pp+0xf80] Type: int
    // 0x5421d4: r3 = Null
    //     0x5421d4: add             x3, PP, #0x19, lsl #12  ; [pp+0x19de0] Null
    //     0x5421d8: ldr             x3, [x3, #0xde0]
    // 0x5421dc: r0 = int()
    //     0x5421dc: bl              #0x55b758  ; IsType_int_Stub
    // 0x5421e0: ldr             x2, [fp, #0x18]
    // 0x5421e4: LoadField: r3 = r2->field_27
    //     0x5421e4: ldur            w3, [x2, #0x27]
    // 0x5421e8: DecompressPointer r3
    //     0x5421e8: add             x3, x3, HEAP, lsl #32
    // 0x5421ec: LoadField: r2 = r3->field_b
    //     0x5421ec: ldur            w2, [x3, #0xb]
    // 0x5421f0: ldr             x4, [fp, #0x10]
    // 0x5421f4: r5 = LoadInt32Instr(r4)
    //     0x5421f4: sbfx            x5, x4, #1, #0x1f
    //     0x5421f8: tbz             w4, #0, #0x542200
    //     0x5421fc: ldur            x5, [x4, #7]
    // 0x542200: r0 = LoadInt32Instr(r2)
    //     0x542200: sbfx            x0, x2, #1, #0x1f
    // 0x542204: mov             x1, x5
    // 0x542208: cmp             x1, x0
    // 0x54220c: b.hs            #0x542230
    // 0x542210: LoadField: r1 = r3->field_f
    //     0x542210: ldur            w1, [x3, #0xf]
    // 0x542214: DecompressPointer r1
    //     0x542214: add             x1, x1, HEAP, lsl #32
    // 0x542218: ArrayLoad: r0 = r1[r5]  ; Unknown_4
    //     0x542218: add             x16, x1, x5, lsl #2
    //     0x54221c: ldur            w0, [x16, #0xf]
    // 0x542220: DecompressPointer r0
    //     0x542220: add             x0, x0, HEAP, lsl #32
    // 0x542224: LeaveFrame
    //     0x542224: mov             SP, fp
    //     0x542228: ldp             fp, lr, [SP], #0x10
    // 0x54222c: ret
    //     0x54222c: ret             
    // 0x542230: r0 = RangeErrorSharedWithoutFPURegs()
    //     0x542230: bl              #0x554b7c  ; RangeErrorSharedWithoutFPURegsStub
  }
}
