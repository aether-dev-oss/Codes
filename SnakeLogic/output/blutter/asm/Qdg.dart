// lib: , url: Qdg

// class id: 1048889, size: 0x8
class :: {

  static late final int _vNb; // offset: 0x630

  [closure] static List<ZR> <anonymous closure>(dynamic, _dS) {
    // ** addr: 0x508080, size: -0x1
  }
}

// class id: 858, size: 0xa8, field offset: 0x8
class gS extends Object {

  [closure] void LMb(dynamic, SO) {
    // ** addr: 0x4cef0c, size: -0x1
  }
  [closure] void <anonymous closure>(dynamic, yr, (dynamic, Object?) => void) {
    // ** addr: 0x4c79b8, size: -0x1
  }
  [closure] void <anonymous closure>(dynamic, Object?) {
    // ** addr: 0x24f72c, size: -0x1
  }
  [closure] void <anonymous closure>(dynamic, Object?) {
    // ** addr: 0x24f964, size: -0x1
  }
  [closure] void <anonymous closure>(dynamic, Object?) {
    // ** addr: 0x24ffd4, size: -0x1
  }
  [closure] void <anonymous closure>(dynamic, Object?) {
    // ** addr: 0x25020c, size: -0x1
  }
  [closure] void <anonymous closure>(dynamic, Object?) {
    // ** addr: 0x250534, size: -0x1
  }
  [closure] void <anonymous closure>(dynamic, Object?) {
    // ** addr: 0x2506f8, size: -0x1
  }
}

// class id: 859, size: 0x18, field offset: 0x8
class _eS extends Object
    implements Aa<X0> {
}

// class id: 860, size: 0x18, field offset: 0x8
class _dS extends Object
    implements Aa<X0> {

  [closure] List<ZR> <anonymous closure>(dynamic, _dS) {
    // ** addr: 0x5086dc, size: -0x1
  }
  [closure] int <anonymous closure>(dynamic, ZR, ZR) {
    // ** addr: 0x509004, size: -0x1
  }
  [closure] void DNe(dynamic, int) {
    // ** addr: 0x508e6c, size: -0x1
  }
  [closure] ZR <anonymous closure>(dynamic, int) {
    // ** addr: 0x508df8, size: -0x1
  }
}

// class id: 861, size: 0x18, field offset: 0x8
class _cS extends Object
    implements Aa<X0> {
}

// class id: 862, size: 0x10, field offset: 0x8
class VR extends Object {

  VR +(VR, VR) {
    // ** addr: 0x51757c, size: 0x80
    // 0x51757c: EnterFrame
    //     0x51757c: stp             fp, lr, [SP, #-0x10]!
    //     0x517580: mov             fp, SP
    // 0x517584: CheckStackOverflow
    //     0x517584: ldr             x16, [THR, #0x38]  ; THR::stack_limit
    //     0x517588: cmp             SP, x16
    //     0x51758c: b.ls            #0x5175dc
    // 0x517590: ldr             x0, [fp, #0x10]
    // 0x517594: r2 = Null
    //     0x517594: mov             x2, NULL
    // 0x517598: r1 = Null
    //     0x517598: mov             x1, NULL
    // 0x51759c: r4 = 59
    //     0x51759c: movz            x4, #0x3b
    // 0x5175a0: branchIfSmi(r0, 0x5175ac)
    //     0x5175a0: tbz             w0, #0, #0x5175ac
    // 0x5175a4: r4 = LoadClassIdInstr(r0)
    //     0x5175a4: ldur            x4, [x0, #-1]
    //     0x5175a8: ubfx            x4, x4, #0xc, #0x14
    // 0x5175ac: cmp             x4, #0x35e
    // 0x5175b0: b.eq            #0x5175c4
    // 0x5175b4: r8 = VR
    //     0x5175b4: ldr             x8, [PP, #0x6c40]  ; [pp+0x6c40] Type: VR
    // 0x5175b8: r3 = Null
    //     0x5175b8: add             x3, PP, #0x1a, lsl #12  ; [pp+0x1a720] Null
    //     0x5175bc: ldr             x3, [x3, #0x720]
    // 0x5175c0: r0 = VR()
    //     0x5175c0: bl              #0x517614  ; IsType_VR_Stub
    // 0x5175c4: ldr             x1, [fp, #0x18]
    // 0x5175c8: ldr             x2, [fp, #0x10]
    // 0x5175cc: r0 = call 0x1a6d04
    //     0x5175cc: bl              #0x1a6d04
    // 0x5175d0: LeaveFrame
    //     0x5175d0: mov             SP, fp
    //     0x5175d4: ldp             fp, lr, [SP], #0x10
    // 0x5175d8: ret
    //     0x5175d8: ret             
    // 0x5175dc: r0 = StackOverflowSharedWithoutFPURegs()
    //     0x5175dc: bl              #0x554734  ; StackOverflowSharedWithoutFPURegsStub
    // 0x5175e0: b               #0x517590
  }
}

// class id: 863, size: 0x14, field offset: 0x8
//   const constructor, 
class UR extends Object {

  static late final Map<int, UR> _iJb; // offset: 0x610
  static late final Map<UR, int> _jJb; // offset: 0x614
}

// class id: 864, size: 0x10, field offset: 0x8
class TR extends Object {
}

// class id: 865, size: 0x10, field offset: 0x8
class SR extends Object {
}

// class id: 910, size: 0xc, field offset: 0x8
//   const constructor, 
class SO extends Object {

  _OneByteString field_8;
}

// class id: 929, size: 0xd8, field offset: 0x8
class ZR extends _nO {

  static late final Int32List _tLb; // offset: 0x624
  static late final Float64List _vLb; // offset: 0x62c
  static late final Int32List _uLb; // offset: 0x628
  static late final gS _sLb; // offset: 0x620

  [closure] bool <anonymous closure>(dynamic, ZR) {
    // ** addr: 0x509d08, size: -0x1
  }
  [closure] void _MLb(dynamic, ZR) {
    // ** addr: 0x21d210, size: -0x1
  }
  [closure] void _KLb(dynamic, ZR) {
    // ** addr: 0x21d874, size: -0x1
  }
}

// class id: 1565, size: 0x34, field offset: 0x24
class fS extends ux {

  [closure] bool <anonymous closure>(dynamic, ZR) {
    // ** addr: 0x50a758, size: -0x1
  }
  [closure] int <anonymous closure>(dynamic, ZR, ZR) {
    // ** addr: 0x50a71c, size: -0x1
  }
  [closure] bool <anonymous closure>(dynamic, ZR) {
    // ** addr: 0x505364, size: -0x1
  }
}

// class id: 1719, size: 0xc, field offset: 0x8
//   const constructor, 
abstract class iS extends _au
    implements Aa<X0> {
}

// class id: 1720, size: 0x14, field offset: 0xc
//   const constructor, 
class jS extends iS {

  _Mint field_c;
}

// class id: 1721, size: 0x84, field offset: 0x8
class XR extends _au {
}

// class id: 2175, size: 0x108, field offset: 0x8
//   const constructor, 
class bS extends Nx {
}
