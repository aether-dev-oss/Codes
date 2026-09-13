// lib: , url: jkg

// class id: 1049247, size: 0x8
class :: {
}

// class id: 3667, size: 0x18, field offset: 0xc
abstract class aoa<X0> extends B<X0> {

  int length(aoa<X0>) {
    // ** addr: 0x54d3c8, size: 0x48
    // 0x54d3c8: ldr             x2, [SP]
    // 0x54d3cc: LoadField: r3 = r2->field_f
    //     0x54d3cc: ldur            x3, [x2, #0xf]
    // 0x54d3d0: r0 = BoxInt64Instr(r3)
    //     0x54d3d0: sbfiz           x0, x3, #1, #0x1f
    //     0x54d3d4: cmp             x3, x0, asr #1
    //     0x54d3d8: b.eq            #0x54d3f4
    //     0x54d3dc: stp             fp, lr, [SP, #-0x10]!
    //     0x54d3e0: mov             fp, SP
    //     0x54d3e4: bl              #0x5548b4  ; AllocateMintSharedWithoutFPURegsStub
    //     0x54d3e8: mov             SP, fp
    //     0x54d3ec: ldp             fp, lr, [SP], #0x10
    //     0x54d3f0: stur            x3, [x0, #7]
    // 0x54d3f4: ret
    //     0x54d3f4: ret             
  }
  X0 [](aoa<X0>, int) {
    // ** addr: 0x50fb08, size: 0x88
    // 0x50fb08: EnterFrame
    //     0x50fb08: stp             fp, lr, [SP, #-0x10]!
    //     0x50fb0c: mov             fp, SP
    // 0x50fb10: AllocStack(0x10)
    //     0x50fb10: sub             SP, SP, #0x10
    // 0x50fb14: CheckStackOverflow
    //     0x50fb14: ldr             x16, [THR, #0x38]  ; THR::stack_limit
    //     0x50fb18: cmp             SP, x16
    //     0x50fb1c: b.ls            #0x50fb70
    // 0x50fb20: ldr             x0, [fp, #0x10]
    // 0x50fb24: r2 = Null
    //     0x50fb24: mov             x2, NULL
    // 0x50fb28: r1 = Null
    //     0x50fb28: mov             x1, NULL
    // 0x50fb2c: branchIfSmi(r0, 0x50fb54)
    //     0x50fb2c: tbz             w0, #0, #0x50fb54
    // 0x50fb30: r4 = LoadClassIdInstr(r0)
    //     0x50fb30: ldur            x4, [x0, #-1]
    //     0x50fb34: ubfx            x4, x4, #0xc, #0x14
    // 0x50fb38: sub             x4, x4, #0x3b
    // 0x50fb3c: cmp             x4, #1
    // 0x50fb40: b.ls            #0x50fb54
    // 0x50fb44: r8 = int
    //     0x50fb44: ldr             x8, [PP, #0xf80]  ; [pp+0xf80] Type: int
    // 0x50fb48: r3 = Null
    //     0x50fb48: add             x3, PP, #0x16, lsl #12  ; [pp+0x16e50] Null
    //     0x50fb4c: ldr             x3, [x3, #0xe50]
    // 0x50fb50: r0 = int()
    //     0x50fb50: bl              #0x55b758  ; IsType_int_Stub
    // 0x50fb54: ldr             x16, [fp, #0x18]
    // 0x50fb58: ldr             lr, [fp, #0x10]
    // 0x50fb5c: stp             lr, x16, [SP]
    // 0x50fb60: r0 = call 0x48b358
    //     0x50fb60: bl              #0x48b358
    // 0x50fb64: LeaveFrame
    //     0x50fb64: mov             SP, fp
    //     0x50fb68: ldp             fp, lr, [SP], #0x10
    // 0x50fb6c: ret
    //     0x50fb6c: ret             
    // 0x50fb70: r0 = StackOverflowSharedWithoutFPURegs()
    //     0x50fb70: bl              #0x554734  ; StackOverflowSharedWithoutFPURegsStub
    // 0x50fb74: b               #0x50fb20
  }
}

// class id: 3668, size: 0x18, field offset: 0x18
abstract class _boa extends aoa<dynamic> {
}

// class id: 3669, size: 0x18, field offset: 0x18
class coa extends _boa {
}
