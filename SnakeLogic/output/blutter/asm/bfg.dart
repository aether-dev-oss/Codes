// lib: , url: bfg

// class id: 1048953, size: 0x8
class :: {
}

// class id: 740, size: 0x18, field offset: 0x8
//   const constructor, 
class _LX extends Object {

  _Mint field_8;
  _Double field_10;
}

// class id: 742, size: 0x18, field offset: 0x8
//   const constructor, 
class JX extends Object {

  bool field_8;
  bool field_c;
  bool field_10;
  bool field_14;
}

// class id: 1047, size: 0x68, field offset: 0x5c
class _IX extends zG {
}

// class id: 1151, size: 0xc, field offset: 0x8
//   const constructor, 
class _aY extends IM {
}

// class id: 1590, size: 0x2c, field offset: 0x2c
class xI extends wx<dynamic> {
}

// class id: 1811, size: 0x18, field offset: 0x14
class _iY extends OU<dynamic> {
}

// class id: 1812, size: 0x18, field offset: 0x14
class _gY extends OU<dynamic> {
}

// class id: 1813, size: 0x20, field offset: 0x14
class _fY<X0 bound eY> extends OU<X0 bound eY> {
}

// class id: 1814, size: 0x2c, field offset: 0x14
class _dY<X0 bound eY> extends OU<X0 bound eY> {
}

// class id: 1815, size: 0x20, field offset: 0x14
class _bY<X0 bound cY> extends OU<X0 bound cY> {
}

// class id: 2071, size: 0x18, field offset: 0x14
class _XX extends Xu<dynamic>
    implements DU {

  [closure] bool <anonymous closure>(dynamic, py<ry>) {
    // ** addr: 0x1f714c, size: -0x1
  }
}

// class id: 2072, size: 0x18, field offset: 0x14
//   transformed mixin,
abstract class _OX extends Xu<dynamic>
     with CF<X0 bound Vu> {
}

// class id: 2073, size: 0x18, field offset: 0x18
//   transformed mixin,
abstract class _PX extends _OX
     with vV {
}

// class id: 2074, size: 0x20, field offset: 0x18
//   transformed mixin,
abstract class _QX extends _PX
     with Zv<X0 bound Vu> {

  [closure] void _yUb(dynamic) {
    // ** addr: 0x231b54, size: -0x1
  }
}

// class id: 2075, size: 0x20, field offset: 0x20
//   transformed mixin,
abstract class _RX extends _QX
     with CU {
}

// class id: 2076, size: 0x20, field offset: 0x20
//   transformed mixin,
abstract class _SX extends _RX
     with zS {
}

// class id: 2077, size: 0xf4, field offset: 0x20
class TX extends _SX
    implements PJ {

  late final RN Qic; // offset: 0xcc
  late final Xt _dic; // offset: 0x28
  late Kga _vic; // offset: 0x6c
  late Sr _orb; // offset: 0x70
  late final _fY<eY> _Xic; // offset: 0xec
  late final Map<Type, NU<LI>> _iJb; // offset: 0xf0
  late final NU<yha> _Vic; // offset: 0xe4
  late final NU<Aha> _Wic; // offset: 0xe8
  late final NU<Bha> _Uic; // offset: 0xe0
  late double _Mic; // offset: 0xb8

  [closure] Future<void> <anonymous closure>(dynamic) async {
    // ** addr: 0x527e48, size: 0x16c
    // 0x527e48: EnterFrame
    //     0x527e48: stp             fp, lr, [SP, #-0x10]!
    //     0x527e4c: mov             fp, SP
    // 0x527e50: AllocStack(0x20)
    //     0x527e50: sub             SP, SP, #0x20
    // 0x527e54: SetupParameters(TX this /* r1 */)
    //     0x527e54: stur            NULL, [fp, #-8]
    //     0x527e58: movz            x0, #0
    //     0x527e5c: add             x1, fp, w0, sxtw #2
    //     0x527e60: ldr             x1, [x1, #0x10]
    //     0x527e64: ldur            w2, [x1, #0x17]
    //     0x527e68: add             x2, x2, HEAP, lsl #32
    //     0x527e6c: stur            x2, [fp, #-0x10]
    // 0x527e70: CheckStackOverflow
    //     0x527e70: ldr             x16, [THR, #0x38]  ; THR::stack_limit
    //     0x527e74: cmp             SP, x16
    //     0x527e78: b.ls            #0x527fa4
    // 0x527e7c: InitAsync() -> Future<void?>
    //     0x527e7c: ldr             x0, [PP, #0x2f8]  ; [pp+0x2f8] TypeArguments: <void?>
    //     0x527e80: bl              #0x519270  ; InitAsyncStub
    // 0x527e84: ldur            x0, [fp, #-0x10]
    // 0x527e88: LoadField: r3 = r0->field_b
    //     0x527e88: ldur            w3, [x0, #0xb]
    // 0x527e8c: DecompressPointer r3
    //     0x527e8c: add             x3, x3, HEAP, lsl #32
    // 0x527e90: stur            x3, [fp, #-0x18]
    // 0x527e94: LoadField: r1 = r3->field_13
    //     0x527e94: ldur            w1, [x3, #0x13]
    // 0x527e98: DecompressPointer r1
    //     0x527e98: add             x1, x1, HEAP, lsl #32
    // 0x527e9c: LoadField: r2 = r3->field_f
    //     0x527e9c: ldur            w2, [x3, #0xf]
    // 0x527ea0: DecompressPointer r2
    //     0x527ea0: add             x2, x2, HEAP, lsl #32
    // 0x527ea4: LoadField: r4 = r2->field_b
    //     0x527ea4: ldur            w4, [x2, #0xb]
    // 0x527ea8: DecompressPointer r4
    //     0x527ea8: add             x4, x4, HEAP, lsl #32
    // 0x527eac: cmp             w4, NULL
    // 0x527eb0: b.eq            #0x527fac
    // 0x527eb4: LoadField: r2 = r4->field_b
    //     0x527eb4: ldur            w2, [x4, #0xb]
    // 0x527eb8: DecompressPointer r2
    //     0x527eb8: add             x2, x2, HEAP, lsl #32
    // 0x527ebc: LoadField: r4 = r2->field_27
    //     0x527ebc: ldur            w4, [x2, #0x27]
    // 0x527ec0: DecompressPointer r4
    //     0x527ec0: add             x4, x4, HEAP, lsl #32
    // 0x527ec4: LoadField: r2 = r4->field_7
    //     0x527ec4: ldur            w2, [x4, #7]
    // 0x527ec8: DecompressPointer r2
    //     0x527ec8: add             x2, x2, HEAP, lsl #32
    // 0x527ecc: r0 = call 0x1e8788
    //     0x527ecc: bl              #0x1e8788
    // 0x527ed0: LoadField: r1 = r0->field_7
    //     0x527ed0: ldur            w1, [x0, #7]
    // 0x527ed4: cbz             w1, #0x527f9c
    // 0x527ed8: ldur            x4, [fp, #-0x10]
    // 0x527edc: ldur            x6, [fp, #-0x18]
    // 0x527ee0: LoadField: r1 = r6->field_f
    //     0x527ee0: ldur            w1, [x6, #0xf]
    // 0x527ee4: DecompressPointer r1
    //     0x527ee4: add             x1, x1, HEAP, lsl #32
    // 0x527ee8: LoadField: r2 = r1->field_73
    //     0x527ee8: ldur            w2, [x1, #0x73]
    // 0x527eec: DecompressPointer r2
    //     0x527eec: add             x2, x2, HEAP, lsl #32
    // 0x527ef0: LoadField: r3 = r4->field_f
    //     0x527ef0: ldur            w3, [x4, #0xf]
    // 0x527ef4: DecompressPointer r3
    //     0x527ef4: add             x3, x3, HEAP, lsl #32
    // 0x527ef8: LoadField: r5 = r3->field_7
    //     0x527ef8: ldur            w5, [x3, #7]
    // 0x527efc: DecompressPointer r5
    //     0x527efc: add             x5, x5, HEAP, lsl #32
    // 0x527f00: LoadField: r3 = r1->field_b
    //     0x527f00: ldur            w3, [x1, #0xb]
    // 0x527f04: DecompressPointer r3
    //     0x527f04: add             x3, x3, HEAP, lsl #32
    // 0x527f08: cmp             w3, NULL
    // 0x527f0c: b.eq            #0x527fb0
    // 0x527f10: LoadField: r1 = r3->field_23
    //     0x527f10: ldur            w1, [x3, #0x23]
    // 0x527f14: DecompressPointer r1
    //     0x527f14: add             x1, x1, HEAP, lsl #32
    // 0x527f18: mov             x16, x5
    // 0x527f1c: mov             x5, x2
    // 0x527f20: mov             x2, x16
    // 0x527f24: mov             x16, x1
    // 0x527f28: mov             x1, x5
    // 0x527f2c: mov             x5, x16
    // 0x527f30: mov             x3, x0
    // 0x527f34: r0 = __unknown_function__()
    //     0x527f34: bl              #0x527fb4  ; [] ::__unknown_function__
    // 0x527f38: mov             x1, x0
    // 0x527f3c: stur            x1, [fp, #-0x20]
    // 0x527f40: r0 = Await()
    //     0x527f40: bl              #0x518e60  ; AwaitStub
    // 0x527f44: stur            x0, [fp, #-0x10]
    // 0x527f48: cmp             w0, NULL
    // 0x527f4c: b.eq            #0x527f88
    // 0x527f50: ldur            x2, [fp, #-0x18]
    // 0x527f54: LoadField: r1 = r2->field_f
    //     0x527f54: ldur            w1, [x2, #0xf]
    // 0x527f58: DecompressPointer r1
    //     0x527f58: add             x1, x1, HEAP, lsl #32
    // 0x527f5c: r0 = call 0x2b1ab0
    //     0x527f5c: bl              #0x2b1ab0
    // 0x527f60: tbnz            w0, #4, #0x527f80
    // 0x527f64: ldur            x0, [fp, #-0x18]
    // 0x527f68: LoadField: r1 = r0->field_f
    //     0x527f68: ldur            w1, [x0, #0xf]
    // 0x527f6c: DecompressPointer r1
    //     0x527f6c: add             x1, x1, HEAP, lsl #32
    // 0x527f70: ldur            x3, [fp, #-0x10]
    // 0x527f74: r2 = Instance_BU
    //     0x527f74: ldr             x2, [PP, #0x5870]  ; [pp+0x5870] Obj!BU@36a051
    // 0x527f78: r0 = call 0x2b1248
    //     0x527f78: bl              #0x2b1248
    // 0x527f7c: b               #0x527f9c
    // 0x527f80: ldur            x0, [fp, #-0x18]
    // 0x527f84: b               #0x527f8c
    // 0x527f88: ldur            x0, [fp, #-0x18]
    // 0x527f8c: LoadField: r1 = r0->field_f
    //     0x527f8c: ldur            w1, [x0, #0xf]
    // 0x527f90: DecompressPointer r1
    //     0x527f90: add             x1, x1, HEAP, lsl #32
    // 0x527f94: r4 = const [0, 0x1, 0, 0x1, null]
    //     0x527f94: ldr             x4, [PP, #0x430]  ; [pp+0x430] List(5) [0, 0x1, 0, 0x1, Null]
    // 0x527f98: r0 = call 0x1f4b70
    //     0x527f98: bl              #0x1f4b70
    // 0x527f9c: r0 = Null
    //     0x527f9c: mov             x0, NULL
    // 0x527fa0: r0 = ReturnAsyncNotFuture()
    //     0x527fa0: b               #0x519244  ; ReturnAsyncNotFutureStub
    // 0x527fa4: r0 = StackOverflowSharedWithoutFPURegs()
    //     0x527fa4: bl              #0x554734  ; StackOverflowSharedWithoutFPURegsStub
    // 0x527fa8: b               #0x527e7c
    // 0x527fac: r0 = NullCastErrorSharedWithoutFPURegs()
    //     0x527fac: bl              #0x554cdc  ; NullCastErrorSharedWithoutFPURegsStub
    // 0x527fb0: r0 = NullCastErrorSharedWithoutFPURegs()
    //     0x527fb0: bl              #0x554cdc  ; NullCastErrorSharedWithoutFPURegsStub
  }
  [closure] void hlc(dynamic, String) {
    // ** addr: 0x1f5eac, size: -0x1
  }
  [closure] void <anonymous closure>(dynamic) {
    // ** addr: 0x1e3698, size: -0x1
  }
  [closure] void <anonymous closure>(dynamic) {
    // ** addr: 0x1e3778, size: -0x1
  }
  [closure] void _qkc(dynamic, xea) {
    // ** addr: 0x1e8b78, size: -0x1
  }
  [closure] cq <anonymous closure>(dynamic, Wr) {
    // ** addr: 0x1eb20c, size: -0x1
  }
  [closure] cq <anonymous closure>(dynamic, cq, cq) {
    // ** addr: 0x1eb1d8, size: -0x1
  }
  [closure] void <anonymous closure>(dynamic, Ca) {
    // ** addr: 0x1e9c50, size: -0x1
  }
  [closure] void <anonymous closure>(dynamic) {
    // ** addr: 0x1eb59c, size: -0x1
  }
  [closure] void _Vjc(dynamic) {
    // ** addr: 0x1ee278, size: -0x1
  }
  [closure] void _Gkc(dynamic) {
    // ** addr: 0x1ec8ec, size: -0x1
  }
  [closure] void <anonymous closure>(dynamic, r) {
    // ** addr: 0x1ec5c4, size: -0x1
  }
  [closure] void <anonymous closure>(dynamic) {
    // ** addr: 0x1ec840, size: -0x1
  }
  [closure] void _Ckc(dynamic) {
    // ** addr: 0x1ed948, size: -0x1
  }
  [closure] yS <anonymous closure>(dynamic, yS, pU) {
    // ** addr: 0x1fe9f0, size: -0x1
  }
  [closure] void _kkc(dynamic) {
    // ** addr: 0x1ff61c, size: -0x1
  }
  [closure] void <anonymous closure>(dynamic, Ca) {
    // ** addr: 0x1ff840, size: -0x1
  }
  [closure] jI <anonymous closure>(dynamic, gZ) {
    // ** addr: 0x1ff538, size: -0x1
  }
  [closure] void _Pkc(dynamic, [Ca?]) {
    // ** addr: 0x1fe0c8, size: -0x1
  }
  [closure] void <anonymous closure>(dynamic) {
    // ** addr: 0x2b2ac4, size: -0x1
  }
  [closure] void <anonymous closure>(dynamic) {
    // ** addr: 0x2b2cf4, size: -0x1
  }
  [closure] void <anonymous closure>(dynamic) {
    // ** addr: 0x2b382c, size: -0x1
  }
  [closure] void <anonymous closure>(dynamic) {
    // ** addr: 0x2b2a2c, size: -0x1
  }
  [closure] void <anonymous closure>(dynamic) {
    // ** addr: 0x2b37e8, size: -0x1
  }
  [closure] void <anonymous closure>(dynamic) {
    // ** addr: 0x2b37a4, size: -0x1
  }
  [closure] void <anonymous closure>(dynamic) {
    // ** addr: 0x2b3760, size: -0x1
  }
  [closure] void <anonymous closure>(dynamic) {
    // ** addr: 0x2b365c, size: -0x1
  }
  [closure] void <anonymous closure>(dynamic, Ca) {
    // ** addr: 0x2b1a18, size: -0x1
  }
  [closure] void _Kkc(dynamic) {
    // ** addr: 0x2b3624, size: -0x1
  }
  [closure] void <anonymous closure>(dynamic) {
    // ** addr: 0x2b2a78, size: -0x1
  }
  [closure] void _Glc(dynamic, qz) {
    // ** addr: 0x2c0734, size: -0x1
  }
  [closure] YV <anonymous closure>(dynamic, gZ, xR) {
    // ** addr: 0x2bd140, size: -0x1
  }
  [closure] bool <anonymous closure>(dynamic, xea) {
    // ** addr: 0x2bd0e0, size: -0x1
  }
  [closure] bool <anonymous closure>(dynamic, yS?, yS) {
    // ** addr: 0x2bcfd0, size: -0x1
  }
  [closure] void <anonymous closure>(dynamic, yS) {
    // ** addr: 0x2bcf80, size: -0x1
  }
  [closure] yS <anonymous closure>(dynamic, yS) {
    // ** addr: 0x2bcf40, size: -0x1
  }
  [closure] void _Nkc(dynamic, mO) {
    // ** addr: 0x2bcf04, size: -0x1
  }
  [closure] void <anonymous closure>(dynamic) {
    // ** addr: 0x2bf20c, size: -0x1
  }
  [closure] void <anonymous closure>(dynamic) {
    // ** addr: 0x2bedec, size: -0x1
  }
  [closure] void <anonymous closure>(dynamic) {
    // ** addr: 0x2befbc, size: -0x1
  }
  [closure] void <anonymous closure>(dynamic) {
    // ** addr: 0x2bf18c, size: -0x1
  }
  [closure] Future<void> <anonymous closure>(dynamic, wha) {
    // ** addr: 0x2c05ec, size: -0x1
  }
  [closure] void <anonymous closure>(dynamic, Ca) {
    // ** addr: 0x3e966c, size: -0x1
  }
  [closure] void _Lkc(dynamic) {
    // ** addr: 0x37946c, size: -0x1
  }
  [closure] void _rjc(dynamic) {
    // ** addr: 0x379d74, size: -0x1
  }
  [closure] void _qjc(dynamic) {
    // ** addr: 0x379ce8, size: -0x1
  }
  [closure] void <anonymous closure>(dynamic) {
    // ** addr: 0x379cc8, size: -0x1
  }
  [closure] void <anonymous closure>(dynamic, Ca) {
    // ** addr: 0x3a64c0, size: -0x1
  }
  [closure] void <anonymous closure>(dynamic, Ca) {
    // ** addr: 0x3a6478, size: -0x1
  }
  [closure] Object? _Flc(dynamic, dV) {
    // ** addr: 0x4aef28, size: -0x1
  }
  [closure] void _Elc(dynamic, Aha) {
    // ** addr: 0x4aeb64, size: -0x1
  }
  [closure] void _Dlc(dynamic, vha) {
    // ** addr: 0x4ae9dc, size: -0x1
  }
  [closure] void _Clc(dynamic, ofa) {
    // ** addr: 0x4ae750, size: -0x1
  }
  [closure] void _Blc(dynamic, uha) {
    // ** addr: 0x4ae640, size: -0x1
  }
  [closure] void _Alc(dynamic, yha) {
    // ** addr: 0x4ae4d4, size: -0x1
  }
  [closure] void _zlc(dynamic, Bha) {
    // ** addr: 0x4ad468, size: -0x1
  }
  [closure] IM _xlc(dynamic) {
    // ** addr: 0x4af470, size: -0x1
  }
  [closure] IM _wlc(dynamic) {
    // ** addr: 0x4af0bc, size: -0x1
  }
  [closure] IM _vlc(dynamic) {
    // ** addr: 0x4af520, size: -0x1
  }
  [closure] IM _ulc(dynamic) {
    // ** addr: 0x4af5fc, size: -0x1
  }
  [closure] IM _tlc(dynamic) {
    // ** addr: 0x4af060, size: -0x1
  }
  [closure] Yr _slc(dynamic, Yr, bool, IM) {
    // ** addr: 0x4afc24, size: -0x1
  }
  [closure] Yr _plc(dynamic, Yr, bool, IM) {
    // ** addr: 0x4afe9c, size: -0x1
  }
  Map<Type, NU<LI>> _iJb(TX) {
    // ** addr: 0x2bf278, size: -0x1
  }
}

// class id: 2181, size: 0x1c, field offset: 0x18
//   const constructor, 
class _YX extends ZX {

  es field_c;
  jW field_14;
  bg field_18;
}

// class id: 2244, size: 0xb0, field offset: 0x10
class _UX extends dK {
}

// class id: 2277, size: 0x18, field offset: 0x10
//   const constructor, 
class _HX extends nw {
}

// class id: 2536, size: 0x20, field offset: 0xc
//   const constructor, 
class _WX extends Vu {
}

// class id: 2537, size: 0x12c, field offset: 0xc
class NX extends Vu {
}

// class id: 2618, size: 0x20, field offset: 0xc
class _MX extends Xt {
}
