// lib: , url: LZf

// class id: 1048692, size: 0x8
class :: {
}

// class id: 1386, size: 0x10, field offset: 0x8
//   const constructor, 
class hB extends Object {

  bq field_8;
  bq field_c;

  hB -(hB, hB) {
    // ** addr: 0x52684c, size: 0x84
    // 0x52684c: EnterFrame
    //     0x52684c: stp             fp, lr, [SP, #-0x10]!
    //     0x526850: mov             fp, SP
    // 0x526854: CheckStackOverflow
    //     0x526854: ldr             x16, [THR, #0x38]  ; THR::stack_limit
    //     0x526858: cmp             SP, x16
    //     0x52685c: b.ls            #0x5268b0
    // 0x526860: ldr             x0, [fp, #0x10]
    // 0x526864: r2 = Null
    //     0x526864: mov             x2, NULL
    // 0x526868: r1 = Null
    //     0x526868: mov             x1, NULL
    // 0x52686c: r4 = 59
    //     0x52686c: movz            x4, #0x3b
    // 0x526870: branchIfSmi(r0, 0x52687c)
    //     0x526870: tbz             w0, #0, #0x52687c
    // 0x526874: r4 = LoadClassIdInstr(r0)
    //     0x526874: ldur            x4, [x0, #-1]
    //     0x526878: ubfx            x4, x4, #0xc, #0x14
    // 0x52687c: cmp             x4, #0x56a
    // 0x526880: b.eq            #0x526898
    // 0x526884: r8 = hB
    //     0x526884: add             x8, PP, #0x18, lsl #12  ; [pp+0x18fa0] Type: hB
    //     0x526888: ldr             x8, [x8, #0xfa0]
    // 0x52688c: r3 = Null
    //     0x52688c: add             x3, PP, #0x18, lsl #12  ; [pp+0x18fa8] Null
    //     0x526890: ldr             x3, [x3, #0xfa8]
    // 0x526894: r0 = DefaultTypeTest()
    //     0x526894: bl              #0x5523c0  ; DefaultTypeTestStub
    // 0x526898: ldr             x1, [fp, #0x18]
    // 0x52689c: ldr             x2, [fp, #0x10]
    // 0x5268a0: r0 = call 0x28e2f4
    //     0x5268a0: bl              #0x28e2f4
    // 0x5268a4: LeaveFrame
    //     0x5268a4: mov             SP, fp
    //     0x5268a8: ldp             fp, lr, [SP], #0x10
    // 0x5268ac: ret
    //     0x5268ac: ret             
    // 0x5268b0: r0 = StackOverflowSharedWithoutFPURegs()
    //     0x5268b0: bl              #0x554734  ; StackOverflowSharedWithoutFPURegsStub
    // 0x5268b4: b               #0x526860
  }
  hB +(hB, hB) {
    // ** addr: 0x5268d0, size: 0x84
    // 0x5268d0: EnterFrame
    //     0x5268d0: stp             fp, lr, [SP, #-0x10]!
    //     0x5268d4: mov             fp, SP
    // 0x5268d8: CheckStackOverflow
    //     0x5268d8: ldr             x16, [THR, #0x38]  ; THR::stack_limit
    //     0x5268dc: cmp             SP, x16
    //     0x5268e0: b.ls            #0x526934
    // 0x5268e4: ldr             x0, [fp, #0x10]
    // 0x5268e8: r2 = Null
    //     0x5268e8: mov             x2, NULL
    // 0x5268ec: r1 = Null
    //     0x5268ec: mov             x1, NULL
    // 0x5268f0: r4 = 59
    //     0x5268f0: movz            x4, #0x3b
    // 0x5268f4: branchIfSmi(r0, 0x526900)
    //     0x5268f4: tbz             w0, #0, #0x526900
    // 0x5268f8: r4 = LoadClassIdInstr(r0)
    //     0x5268f8: ldur            x4, [x0, #-1]
    //     0x5268fc: ubfx            x4, x4, #0xc, #0x14
    // 0x526900: cmp             x4, #0x56a
    // 0x526904: b.eq            #0x52691c
    // 0x526908: r8 = hB
    //     0x526908: add             x8, PP, #0x18, lsl #12  ; [pp+0x18fa0] Type: hB
    //     0x52690c: ldr             x8, [x8, #0xfa0]
    // 0x526910: r3 = Null
    //     0x526910: add             x3, PP, #0x18, lsl #12  ; [pp+0x18fb8] Null
    //     0x526914: ldr             x3, [x3, #0xfb8]
    // 0x526918: r0 = DefaultTypeTest()
    //     0x526918: bl              #0x5523c0  ; DefaultTypeTestStub
    // 0x52691c: ldr             x1, [fp, #0x18]
    // 0x526920: ldr             x2, [fp, #0x10]
    // 0x526924: r0 = call 0x28e380
    //     0x526924: bl              #0x28e380
    // 0x526928: LeaveFrame
    //     0x526928: mov             SP, fp
    //     0x52692c: ldp             fp, lr, [SP], #0x10
    // 0x526930: ret
    //     0x526930: ret             
    // 0x526934: r0 = StackOverflowSharedWithoutFPURegs()
    //     0x526934: bl              #0x554734  ; StackOverflowSharedWithoutFPURegsStub
    // 0x526938: b               #0x5268e4
  }
}

// class id: 1463, size: 0x8, field offset: 0x8
//   transformed mixin,
abstract class _fB extends ky
     with jx {
}

// class id: 1464, size: 0x18, field offset: 0x8
abstract class cB extends _fB {
}

// class id: 1466, size: 0x24, field offset: 0x18
abstract class vA extends cB {
}

// class id: 1478, size: 0x48, field offset: 0x24
abstract class EA extends vA {

  [closure] void WQb(dynamic, oy) {
    // ** addr: 0x4416d8, size: -0x1
  }
  [closure] void <anonymous closure>(dynamic) {
    // ** addr: 0x28ee68, size: -0x1
  }
}

// class id: 3534, size: 0x14, field offset: 0x14
enum gB extends _Enum {

  _Mint field_8;
  _OneByteString field_10;
}

// class id: 3535, size: 0x14, field offset: 0x14
enum eB extends _Enum {

  _Mint field_8;
  _OneByteString field_10;
}

// class id: 3536, size: 0x14, field offset: 0x14
enum MA extends _Enum {

  _Mint field_8;
  _OneByteString field_10;
}
