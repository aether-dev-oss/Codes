// lib: , url: ycg

// class id: 1048826, size: 0x8
class :: {
}

// class id: 1181, size: 0x8, field offset: 0x8
//   const constructor, 
abstract class JL extends Object {

  [closure] static JL? qkb(dynamic, JL?, JL?, double) {
    // ** addr: 0x3fff14, size: -0x1
  }
}

// class id: 1182, size: 0x38, field offset: 0x8
//   const constructor, 
class _ML extends JL {

  _Double field_8;
  _Double field_10;
  _Double field_18;
  _Double field_20;
  _Double field_28;
  _Double field_30;
}

// class id: 1183, size: 0x28, field offset: 0x8
//   const constructor, 
class LL extends JL {

  _Mint field_8;
  _Double field_10;
  _Mint field_18;
  _Double field_20;

  LL -(LL, LL) {
    // ** addr: 0x51a804, size: 0x84
    // 0x51a804: EnterFrame
    //     0x51a804: stp             fp, lr, [SP, #-0x10]!
    //     0x51a808: mov             fp, SP
    // 0x51a80c: CheckStackOverflow
    //     0x51a80c: ldr             x16, [THR, #0x38]  ; THR::stack_limit
    //     0x51a810: cmp             SP, x16
    //     0x51a814: b.ls            #0x51a868
    // 0x51a818: ldr             x0, [fp, #0x10]
    // 0x51a81c: r2 = Null
    //     0x51a81c: mov             x2, NULL
    // 0x51a820: r1 = Null
    //     0x51a820: mov             x1, NULL
    // 0x51a824: r4 = 59
    //     0x51a824: movz            x4, #0x3b
    // 0x51a828: branchIfSmi(r0, 0x51a834)
    //     0x51a828: tbz             w0, #0, #0x51a834
    // 0x51a82c: r4 = LoadClassIdInstr(r0)
    //     0x51a82c: ldur            x4, [x0, #-1]
    //     0x51a830: ubfx            x4, x4, #0xc, #0x14
    // 0x51a834: cmp             x4, #0x49f
    // 0x51a838: b.eq            #0x51a850
    // 0x51a83c: r8 = LL
    //     0x51a83c: add             x8, PP, #0x18, lsl #12  ; [pp+0x18e70] Type: LL
    //     0x51a840: ldr             x8, [x8, #0xe70]
    // 0x51a844: r3 = Null
    //     0x51a844: add             x3, PP, #0x18, lsl #12  ; [pp+0x18e88] Null
    //     0x51a848: ldr             x3, [x3, #0xe88]
    // 0x51a84c: r0 = DefaultTypeTest()
    //     0x51a84c: bl              #0x5523c0  ; DefaultTypeTestStub
    // 0x51a850: ldr             x1, [fp, #0x18]
    // 0x51a854: ldr             x2, [fp, #0x10]
    // 0x51a858: r0 = call 0x1d24c4
    //     0x51a858: bl              #0x1d24c4
    // 0x51a85c: LeaveFrame
    //     0x51a85c: mov             SP, fp
    //     0x51a860: ldp             fp, lr, [SP], #0x10
    // 0x51a864: ret
    //     0x51a864: ret             
    // 0x51a868: r0 = StackOverflowSharedWithoutFPURegs()
    //     0x51a868: bl              #0x554734  ; StackOverflowSharedWithoutFPURegsStub
    // 0x51a86c: b               #0x51a818
  }
  LL *(LL, double) {
    // ** addr: 0x51a888, size: 0x50
    // 0x51a888: EnterFrame
    //     0x51a888: stp             fp, lr, [SP, #-0x10]!
    //     0x51a88c: mov             fp, SP
    // 0x51a890: CheckStackOverflow
    //     0x51a890: ldr             x16, [THR, #0x38]  ; THR::stack_limit
    //     0x51a894: cmp             SP, x16
    //     0x51a898: b.ls            #0x51a8b8
    // 0x51a89c: ldr             x0, [fp, #0x10]
    // 0x51a8a0: LoadField: d0 = r0->field_7
    //     0x51a8a0: ldur            d0, [x0, #7]
    // 0x51a8a4: ldr             x1, [fp, #0x18]
    // 0x51a8a8: r0 = call 0x4c224c
    //     0x51a8a8: bl              #0x4c224c
    // 0x51a8ac: LeaveFrame
    //     0x51a8ac: mov             SP, fp
    //     0x51a8b0: ldp             fp, lr, [SP], #0x10
    // 0x51a8b4: ret
    //     0x51a8b4: ret             
    // 0x51a8b8: r0 = StackOverflowSharedWithoutFPURegs()
    //     0x51a8b8: bl              #0x554734  ; StackOverflowSharedWithoutFPURegsStub
    // 0x51a8bc: b               #0x51a89c
  }
  LL +(LL, LL) {
    // ** addr: 0x51a8d8, size: 0x84
    // 0x51a8d8: EnterFrame
    //     0x51a8d8: stp             fp, lr, [SP, #-0x10]!
    //     0x51a8dc: mov             fp, SP
    // 0x51a8e0: CheckStackOverflow
    //     0x51a8e0: ldr             x16, [THR, #0x38]  ; THR::stack_limit
    //     0x51a8e4: cmp             SP, x16
    //     0x51a8e8: b.ls            #0x51a93c
    // 0x51a8ec: ldr             x0, [fp, #0x10]
    // 0x51a8f0: r2 = Null
    //     0x51a8f0: mov             x2, NULL
    // 0x51a8f4: r1 = Null
    //     0x51a8f4: mov             x1, NULL
    // 0x51a8f8: r4 = 59
    //     0x51a8f8: movz            x4, #0x3b
    // 0x51a8fc: branchIfSmi(r0, 0x51a908)
    //     0x51a8fc: tbz             w0, #0, #0x51a908
    // 0x51a900: r4 = LoadClassIdInstr(r0)
    //     0x51a900: ldur            x4, [x0, #-1]
    //     0x51a904: ubfx            x4, x4, #0xc, #0x14
    // 0x51a908: cmp             x4, #0x49f
    // 0x51a90c: b.eq            #0x51a924
    // 0x51a910: r8 = LL
    //     0x51a910: add             x8, PP, #0x18, lsl #12  ; [pp+0x18e70] Type: LL
    //     0x51a914: ldr             x8, [x8, #0xe70]
    // 0x51a918: r3 = Null
    //     0x51a918: add             x3, PP, #0x18, lsl #12  ; [pp+0x18e78] Null
    //     0x51a91c: ldr             x3, [x3, #0xe78]
    // 0x51a920: r0 = DefaultTypeTest()
    //     0x51a920: bl              #0x5523c0  ; DefaultTypeTestStub
    // 0x51a924: ldr             x1, [fp, #0x18]
    // 0x51a928: ldr             x2, [fp, #0x10]
    // 0x51a92c: r0 = call 0x1d2540
    //     0x51a92c: bl              #0x1d2540
    // 0x51a930: LeaveFrame
    //     0x51a930: mov             SP, fp
    //     0x51a934: ldp             fp, lr, [SP], #0x10
    // 0x51a938: ret
    //     0x51a938: ret             
    // 0x51a93c: r0 = StackOverflowSharedWithoutFPURegs()
    //     0x51a93c: bl              #0x554734  ; StackOverflowSharedWithoutFPURegsStub
    // 0x51a940: b               #0x51a8ec
  }
}

// class id: 1184, size: 0x28, field offset: 0x8
//   const constructor, 
class KL extends JL {

  _Double field_8;
  _Double field_10;
  _Double field_18;
  _Double field_20;

  KL +(KL, KL) {
    // ** addr: 0x51a98c, size: 0x84
    // 0x51a98c: EnterFrame
    //     0x51a98c: stp             fp, lr, [SP, #-0x10]!
    //     0x51a990: mov             fp, SP
    // 0x51a994: CheckStackOverflow
    //     0x51a994: ldr             x16, [THR, #0x38]  ; THR::stack_limit
    //     0x51a998: cmp             SP, x16
    //     0x51a99c: b.ls            #0x51a9f0
    // 0x51a9a0: ldr             x0, [fp, #0x10]
    // 0x51a9a4: r2 = Null
    //     0x51a9a4: mov             x2, NULL
    // 0x51a9a8: r1 = Null
    //     0x51a9a8: mov             x1, NULL
    // 0x51a9ac: r4 = 59
    //     0x51a9ac: movz            x4, #0x3b
    // 0x51a9b0: branchIfSmi(r0, 0x51a9bc)
    //     0x51a9b0: tbz             w0, #0, #0x51a9bc
    // 0x51a9b4: r4 = LoadClassIdInstr(r0)
    //     0x51a9b4: ldur            x4, [x0, #-1]
    //     0x51a9b8: ubfx            x4, x4, #0xc, #0x14
    // 0x51a9bc: cmp             x4, #0x4a0
    // 0x51a9c0: b.eq            #0x51a9d8
    // 0x51a9c4: r8 = KL
    //     0x51a9c4: add             x8, PP, #0x18, lsl #12  ; [pp+0x18e98] Type: KL
    //     0x51a9c8: ldr             x8, [x8, #0xe98]
    // 0x51a9cc: r3 = Null
    //     0x51a9cc: add             x3, PP, #0x18, lsl #12  ; [pp+0x18ea0] Null
    //     0x51a9d0: ldr             x3, [x3, #0xea0]
    // 0x51a9d4: r0 = KL()
    //     0x51a9d4: bl              #0x51aacc  ; IsType_KL_Stub
    // 0x51a9d8: ldr             x1, [fp, #0x18]
    // 0x51a9dc: ldr             x2, [fp, #0x10]
    // 0x51a9e0: r0 = call 0x1d2c04
    //     0x51a9e0: bl              #0x1d2c04
    // 0x51a9e4: LeaveFrame
    //     0x51a9e4: mov             SP, fp
    //     0x51a9e8: ldp             fp, lr, [SP], #0x10
    // 0x51a9ec: ret
    //     0x51a9ec: ret             
    // 0x51a9f0: r0 = StackOverflowSharedWithoutFPURegs()
    //     0x51a9f0: bl              #0x554734  ; StackOverflowSharedWithoutFPURegsStub
    // 0x51a9f4: b               #0x51a9a0
  }
  KL -(KL, KL) {
    // ** addr: 0x51aa10, size: 0x84
    // 0x51aa10: EnterFrame
    //     0x51aa10: stp             fp, lr, [SP, #-0x10]!
    //     0x51aa14: mov             fp, SP
    // 0x51aa18: CheckStackOverflow
    //     0x51aa18: ldr             x16, [THR, #0x38]  ; THR::stack_limit
    //     0x51aa1c: cmp             SP, x16
    //     0x51aa20: b.ls            #0x51aa74
    // 0x51aa24: ldr             x0, [fp, #0x10]
    // 0x51aa28: r2 = Null
    //     0x51aa28: mov             x2, NULL
    // 0x51aa2c: r1 = Null
    //     0x51aa2c: mov             x1, NULL
    // 0x51aa30: r4 = 59
    //     0x51aa30: movz            x4, #0x3b
    // 0x51aa34: branchIfSmi(r0, 0x51aa40)
    //     0x51aa34: tbz             w0, #0, #0x51aa40
    // 0x51aa38: r4 = LoadClassIdInstr(r0)
    //     0x51aa38: ldur            x4, [x0, #-1]
    //     0x51aa3c: ubfx            x4, x4, #0xc, #0x14
    // 0x51aa40: cmp             x4, #0x4a0
    // 0x51aa44: b.eq            #0x51aa5c
    // 0x51aa48: r8 = KL
    //     0x51aa48: add             x8, PP, #0x18, lsl #12  ; [pp+0x18e98] Type: KL
    //     0x51aa4c: ldr             x8, [x8, #0xe98]
    // 0x51aa50: r3 = Null
    //     0x51aa50: add             x3, PP, #0x18, lsl #12  ; [pp+0x18eb0] Null
    //     0x51aa54: ldr             x3, [x3, #0xeb0]
    // 0x51aa58: r0 = KL()
    //     0x51aa58: bl              #0x51aacc  ; IsType_KL_Stub
    // 0x51aa5c: ldr             x1, [fp, #0x18]
    // 0x51aa60: ldr             x2, [fp, #0x10]
    // 0x51aa64: r0 = call 0x1d2c80
    //     0x51aa64: bl              #0x1d2c80
    // 0x51aa68: LeaveFrame
    //     0x51aa68: mov             SP, fp
    //     0x51aa6c: ldp             fp, lr, [SP], #0x10
    // 0x51aa70: ret
    //     0x51aa70: ret             
    // 0x51aa74: r0 = StackOverflowSharedWithoutFPURegs()
    //     0x51aa74: bl              #0x554734  ; StackOverflowSharedWithoutFPURegsStub
    // 0x51aa78: b               #0x51aa24
  }
  KL *(KL, double) {
    // ** addr: 0x51aa94, size: 0x50
    // 0x51aa94: EnterFrame
    //     0x51aa94: stp             fp, lr, [SP, #-0x10]!
    //     0x51aa98: mov             fp, SP
    // 0x51aa9c: CheckStackOverflow
    //     0x51aa9c: ldr             x16, [THR, #0x38]  ; THR::stack_limit
    //     0x51aaa0: cmp             SP, x16
    //     0x51aaa4: b.ls            #0x51aac4
    // 0x51aaa8: ldr             x0, [fp, #0x10]
    // 0x51aaac: LoadField: d0 = r0->field_7
    //     0x51aaac: ldur            d0, [x0, #7]
    // 0x51aab0: ldr             x1, [fp, #0x18]
    // 0x51aab4: r0 = call 0x4c21e0
    //     0x51aab4: bl              #0x4c21e0
    // 0x51aab8: LeaveFrame
    //     0x51aab8: mov             SP, fp
    //     0x51aabc: ldp             fp, lr, [SP], #0x10
    // 0x51aac0: ret
    //     0x51aac0: ret             
    // 0x51aac4: r0 = StackOverflowSharedWithoutFPURegs()
    //     0x51aac4: bl              #0x554734  ; StackOverflowSharedWithoutFPURegsStub
    // 0x51aac8: b               #0x51aaa8
  }
}
