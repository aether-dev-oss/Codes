// lib: , url: jcg

// class id: 1048811, size: 0x8
class :: {
}

// class id: 1200, size: 0x8, field offset: 0x8
//   const constructor, 
abstract class TK extends Object {
}

// class id: 1201, size: 0x20, field offset: 0x8
//   const constructor, 
class _WK extends TK {
}

// class id: 1202, size: 0x18, field offset: 0x8
//   const constructor, 
class VK extends TK {

  _Double field_8;
  _Double field_10;

  VK -(VK, VK) {
    // ** addr: 0x51a524, size: 0x84
    // 0x51a524: EnterFrame
    //     0x51a524: stp             fp, lr, [SP, #-0x10]!
    //     0x51a528: mov             fp, SP
    // 0x51a52c: CheckStackOverflow
    //     0x51a52c: ldr             x16, [THR, #0x38]  ; THR::stack_limit
    //     0x51a530: cmp             SP, x16
    //     0x51a534: b.ls            #0x51a588
    // 0x51a538: ldr             x0, [fp, #0x10]
    // 0x51a53c: r2 = Null
    //     0x51a53c: mov             x2, NULL
    // 0x51a540: r1 = Null
    //     0x51a540: mov             x1, NULL
    // 0x51a544: r4 = 59
    //     0x51a544: movz            x4, #0x3b
    // 0x51a548: branchIfSmi(r0, 0x51a554)
    //     0x51a548: tbz             w0, #0, #0x51a554
    // 0x51a54c: r4 = LoadClassIdInstr(r0)
    //     0x51a54c: ldur            x4, [x0, #-1]
    //     0x51a550: ubfx            x4, x4, #0xc, #0x14
    // 0x51a554: cmp             x4, #0x4b2
    // 0x51a558: b.eq            #0x51a570
    // 0x51a55c: r8 = VK
    //     0x51a55c: add             x8, PP, #0x18, lsl #12  ; [pp+0x18f00] Type: VK
    //     0x51a560: ldr             x8, [x8, #0xf00]
    // 0x51a564: r3 = Null
    //     0x51a564: add             x3, PP, #0x18, lsl #12  ; [pp+0x18f18] Null
    //     0x51a568: ldr             x3, [x3, #0xf18]
    // 0x51a56c: r0 = DefaultTypeTest()
    //     0x51a56c: bl              #0x5523c0  ; DefaultTypeTestStub
    // 0x51a570: ldr             x1, [fp, #0x18]
    // 0x51a574: ldr             x2, [fp, #0x10]
    // 0x51a578: r0 = call 0x1cfba0
    //     0x51a578: bl              #0x1cfba0
    // 0x51a57c: LeaveFrame
    //     0x51a57c: mov             SP, fp
    //     0x51a580: ldp             fp, lr, [SP], #0x10
    // 0x51a584: ret
    //     0x51a584: ret             
    // 0x51a588: r0 = StackOverflowSharedWithoutFPURegs()
    //     0x51a588: bl              #0x554734  ; StackOverflowSharedWithoutFPURegsStub
    // 0x51a58c: b               #0x51a538
  }
  VK +(VK, VK) {
    // ** addr: 0x51a5b4, size: 0x84
    // 0x51a5b4: EnterFrame
    //     0x51a5b4: stp             fp, lr, [SP, #-0x10]!
    //     0x51a5b8: mov             fp, SP
    // 0x51a5bc: CheckStackOverflow
    //     0x51a5bc: ldr             x16, [THR, #0x38]  ; THR::stack_limit
    //     0x51a5c0: cmp             SP, x16
    //     0x51a5c4: b.ls            #0x51a618
    // 0x51a5c8: ldr             x0, [fp, #0x10]
    // 0x51a5cc: r2 = Null
    //     0x51a5cc: mov             x2, NULL
    // 0x51a5d0: r1 = Null
    //     0x51a5d0: mov             x1, NULL
    // 0x51a5d4: r4 = 59
    //     0x51a5d4: movz            x4, #0x3b
    // 0x51a5d8: branchIfSmi(r0, 0x51a5e4)
    //     0x51a5d8: tbz             w0, #0, #0x51a5e4
    // 0x51a5dc: r4 = LoadClassIdInstr(r0)
    //     0x51a5dc: ldur            x4, [x0, #-1]
    //     0x51a5e0: ubfx            x4, x4, #0xc, #0x14
    // 0x51a5e4: cmp             x4, #0x4b2
    // 0x51a5e8: b.eq            #0x51a600
    // 0x51a5ec: r8 = VK
    //     0x51a5ec: add             x8, PP, #0x18, lsl #12  ; [pp+0x18f00] Type: VK
    //     0x51a5f0: ldr             x8, [x8, #0xf00]
    // 0x51a5f4: r3 = Null
    //     0x51a5f4: add             x3, PP, #0x18, lsl #12  ; [pp+0x18f08] Null
    //     0x51a5f8: ldr             x3, [x3, #0xf08]
    // 0x51a5fc: r0 = DefaultTypeTest()
    //     0x51a5fc: bl              #0x5523c0  ; DefaultTypeTestStub
    // 0x51a600: ldr             x1, [fp, #0x18]
    // 0x51a604: ldr             x2, [fp, #0x10]
    // 0x51a608: r0 = call 0x1cfbec
    //     0x51a608: bl              #0x1cfbec
    // 0x51a60c: LeaveFrame
    //     0x51a60c: mov             SP, fp
    //     0x51a610: ldp             fp, lr, [SP], #0x10
    // 0x51a614: ret
    //     0x51a614: ret             
    // 0x51a618: r0 = StackOverflowSharedWithoutFPURegs()
    //     0x51a618: bl              #0x554734  ; StackOverflowSharedWithoutFPURegsStub
    // 0x51a61c: b               #0x51a5c8
  }
  VK *(VK, double) {
    // ** addr: 0x51a638, size: 0x50
    // 0x51a638: EnterFrame
    //     0x51a638: stp             fp, lr, [SP, #-0x10]!
    //     0x51a63c: mov             fp, SP
    // 0x51a640: CheckStackOverflow
    //     0x51a640: ldr             x16, [THR, #0x38]  ; THR::stack_limit
    //     0x51a644: cmp             SP, x16
    //     0x51a648: b.ls            #0x51a668
    // 0x51a64c: ldr             x0, [fp, #0x10]
    // 0x51a650: LoadField: d0 = r0->field_7
    //     0x51a650: ldur            d0, [x0, #7]
    // 0x51a654: ldr             x1, [fp, #0x18]
    // 0x51a658: r0 = call 0x4c3b04
    //     0x51a658: bl              #0x4c3b04
    // 0x51a65c: LeaveFrame
    //     0x51a65c: mov             SP, fp
    //     0x51a660: ldp             fp, lr, [SP], #0x10
    // 0x51a664: ret
    //     0x51a664: ret             
    // 0x51a668: r0 = StackOverflowSharedWithoutFPURegs()
    //     0x51a668: bl              #0x554734  ; StackOverflowSharedWithoutFPURegsStub
    // 0x51a66c: b               #0x51a64c
  }
}

// class id: 1203, size: 0x18, field offset: 0x8
//   const constructor, 
class UK extends TK {

  _Double field_8;
  _Double field_10;

  UK -(UK, UK) {
    // ** addr: 0x51a688, size: 0x84
    // 0x51a688: EnterFrame
    //     0x51a688: stp             fp, lr, [SP, #-0x10]!
    //     0x51a68c: mov             fp, SP
    // 0x51a690: CheckStackOverflow
    //     0x51a690: ldr             x16, [THR, #0x38]  ; THR::stack_limit
    //     0x51a694: cmp             SP, x16
    //     0x51a698: b.ls            #0x51a6ec
    // 0x51a69c: ldr             x0, [fp, #0x10]
    // 0x51a6a0: r2 = Null
    //     0x51a6a0: mov             x2, NULL
    // 0x51a6a4: r1 = Null
    //     0x51a6a4: mov             x1, NULL
    // 0x51a6a8: r4 = 59
    //     0x51a6a8: movz            x4, #0x3b
    // 0x51a6ac: branchIfSmi(r0, 0x51a6b8)
    //     0x51a6ac: tbz             w0, #0, #0x51a6b8
    // 0x51a6b0: r4 = LoadClassIdInstr(r0)
    //     0x51a6b0: ldur            x4, [x0, #-1]
    //     0x51a6b4: ubfx            x4, x4, #0xc, #0x14
    // 0x51a6b8: cmp             x4, #0x4b3
    // 0x51a6bc: b.eq            #0x51a6d4
    // 0x51a6c0: r8 = UK
    //     0x51a6c0: add             x8, PP, #0x18, lsl #12  ; [pp+0x18f28] Type: UK
    //     0x51a6c4: ldr             x8, [x8, #0xf28]
    // 0x51a6c8: r3 = Null
    //     0x51a6c8: add             x3, PP, #0x18, lsl #12  ; [pp+0x18f40] Null
    //     0x51a6cc: ldr             x3, [x3, #0xf40]
    // 0x51a6d0: r0 = DefaultTypeTest()
    //     0x51a6d0: bl              #0x5523c0  ; DefaultTypeTestStub
    // 0x51a6d4: ldr             x1, [fp, #0x18]
    // 0x51a6d8: ldr             x2, [fp, #0x10]
    // 0x51a6dc: r0 = call 0x1d0144
    //     0x51a6dc: bl              #0x1d0144
    // 0x51a6e0: LeaveFrame
    //     0x51a6e0: mov             SP, fp
    //     0x51a6e4: ldp             fp, lr, [SP], #0x10
    // 0x51a6e8: ret
    //     0x51a6e8: ret             
    // 0x51a6ec: r0 = StackOverflowSharedWithoutFPURegs()
    //     0x51a6ec: bl              #0x554734  ; StackOverflowSharedWithoutFPURegsStub
    // 0x51a6f0: b               #0x51a69c
  }
  UK *(UK, double) {
    // ** addr: 0x51a718, size: 0x50
    // 0x51a718: EnterFrame
    //     0x51a718: stp             fp, lr, [SP, #-0x10]!
    //     0x51a71c: mov             fp, SP
    // 0x51a720: CheckStackOverflow
    //     0x51a720: ldr             x16, [THR, #0x38]  ; THR::stack_limit
    //     0x51a724: cmp             SP, x16
    //     0x51a728: b.ls            #0x51a748
    // 0x51a72c: ldr             x0, [fp, #0x10]
    // 0x51a730: LoadField: d0 = r0->field_7
    //     0x51a730: ldur            d0, [x0, #7]
    // 0x51a734: ldr             x1, [fp, #0x18]
    // 0x51a738: r0 = call 0x4c3ac0
    //     0x51a738: bl              #0x4c3ac0
    // 0x51a73c: LeaveFrame
    //     0x51a73c: mov             SP, fp
    //     0x51a740: ldp             fp, lr, [SP], #0x10
    // 0x51a744: ret
    //     0x51a744: ret             
    // 0x51a748: r0 = StackOverflowSharedWithoutFPURegs()
    //     0x51a748: bl              #0x554734  ; StackOverflowSharedWithoutFPURegsStub
    // 0x51a74c: b               #0x51a72c
  }
  UK +(UK, UK) {
    // ** addr: 0x51a768, size: 0x84
    // 0x51a768: EnterFrame
    //     0x51a768: stp             fp, lr, [SP, #-0x10]!
    //     0x51a76c: mov             fp, SP
    // 0x51a770: CheckStackOverflow
    //     0x51a770: ldr             x16, [THR, #0x38]  ; THR::stack_limit
    //     0x51a774: cmp             SP, x16
    //     0x51a778: b.ls            #0x51a7cc
    // 0x51a77c: ldr             x0, [fp, #0x10]
    // 0x51a780: r2 = Null
    //     0x51a780: mov             x2, NULL
    // 0x51a784: r1 = Null
    //     0x51a784: mov             x1, NULL
    // 0x51a788: r4 = 59
    //     0x51a788: movz            x4, #0x3b
    // 0x51a78c: branchIfSmi(r0, 0x51a798)
    //     0x51a78c: tbz             w0, #0, #0x51a798
    // 0x51a790: r4 = LoadClassIdInstr(r0)
    //     0x51a790: ldur            x4, [x0, #-1]
    //     0x51a794: ubfx            x4, x4, #0xc, #0x14
    // 0x51a798: cmp             x4, #0x4b3
    // 0x51a79c: b.eq            #0x51a7b4
    // 0x51a7a0: r8 = UK
    //     0x51a7a0: add             x8, PP, #0x18, lsl #12  ; [pp+0x18f28] Type: UK
    //     0x51a7a4: ldr             x8, [x8, #0xf28]
    // 0x51a7a8: r3 = Null
    //     0x51a7a8: add             x3, PP, #0x18, lsl #12  ; [pp+0x18f30] Null
    //     0x51a7ac: ldr             x3, [x3, #0xf30]
    // 0x51a7b0: r0 = DefaultTypeTest()
    //     0x51a7b0: bl              #0x5523c0  ; DefaultTypeTestStub
    // 0x51a7b4: ldr             x1, [fp, #0x18]
    // 0x51a7b8: ldr             x2, [fp, #0x10]
    // 0x51a7bc: r0 = call 0x1d0190
    //     0x51a7bc: bl              #0x1d0190
    // 0x51a7c0: LeaveFrame
    //     0x51a7c0: mov             SP, fp
    //     0x51a7c4: ldp             fp, lr, [SP], #0x10
    // 0x51a7c8: ret
    //     0x51a7c8: ret             
    // 0x51a7cc: r0 = StackOverflowSharedWithoutFPURegs()
    //     0x51a7cc: bl              #0x554734  ; StackOverflowSharedWithoutFPURegsStub
    // 0x51a7d0: b               #0x51a77c
  }
}
