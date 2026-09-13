// lib: , url: UZf

// class id: 1048698, size: 0x8
class :: {
}

// class id: 1370, size: 0x1c, field offset: 0x8
class OA extends Object {
}

// class id: 1373, size: 0x10, field offset: 0x8
//   const constructor, 
class _DB extends Object {
}

// class id: 1374, size: 0x1c, field offset: 0x8
//   const constructor, 
class NA extends Object {

  bq field_8;
  _Double field_c;
  Ca field_14;
  bq field_18;
}

// class id: 1375, size: 0xc, field offset: 0x8
//   const constructor, 
class Ey extends Object {

  bq field_8;

  Ey -(Ey, Ey) {
    // ** addr: 0x526158, size: 0x84
    // 0x526158: EnterFrame
    //     0x526158: stp             fp, lr, [SP, #-0x10]!
    //     0x52615c: mov             fp, SP
    // 0x526160: CheckStackOverflow
    //     0x526160: ldr             x16, [THR, #0x38]  ; THR::stack_limit
    //     0x526164: cmp             SP, x16
    //     0x526168: b.ls            #0x5261bc
    // 0x52616c: ldr             x0, [fp, #0x10]
    // 0x526170: r2 = Null
    //     0x526170: mov             x2, NULL
    // 0x526174: r1 = Null
    //     0x526174: mov             x1, NULL
    // 0x526178: r4 = 59
    //     0x526178: movz            x4, #0x3b
    // 0x52617c: branchIfSmi(r0, 0x526188)
    //     0x52617c: tbz             w0, #0, #0x526188
    // 0x526180: r4 = LoadClassIdInstr(r0)
    //     0x526180: ldur            x4, [x0, #-1]
    //     0x526184: ubfx            x4, x4, #0xc, #0x14
    // 0x526188: cmp             x4, #0x55f
    // 0x52618c: b.eq            #0x5261a4
    // 0x526190: r8 = Ey
    //     0x526190: add             x8, PP, #0x18, lsl #12  ; [pp+0x18f78] Type: Ey
    //     0x526194: ldr             x8, [x8, #0xf78]
    // 0x526198: r3 = Null
    //     0x526198: add             x3, PP, #0x18, lsl #12  ; [pp+0x18f90] Null
    //     0x52619c: ldr             x3, [x3, #0xf90]
    // 0x5261a0: r0 = DefaultTypeTest()
    //     0x5261a0: bl              #0x5523c0  ; DefaultTypeTestStub
    // 0x5261a4: ldr             x1, [fp, #0x18]
    // 0x5261a8: ldr             x2, [fp, #0x10]
    // 0x5261ac: r0 = call 0x27da58
    //     0x5261ac: bl              #0x27da58
    // 0x5261b0: LeaveFrame
    //     0x5261b0: mov             SP, fp
    //     0x5261b4: ldp             fp, lr, [SP], #0x10
    // 0x5261b8: ret
    //     0x5261b8: ret             
    // 0x5261bc: r0 = StackOverflowSharedWithoutFPURegs()
    //     0x5261bc: bl              #0x554734  ; StackOverflowSharedWithoutFPURegsStub
    // 0x5261c0: b               #0x52616c
  }
  Ey +(Ey, Ey) {
    // ** addr: 0x5261e8, size: 0x64
    // 0x5261e8: EnterFrame
    //     0x5261e8: stp             fp, lr, [SP, #-0x10]!
    //     0x5261ec: mov             fp, SP
    // 0x5261f0: ldr             x0, [fp, #0x10]
    // 0x5261f4: r2 = Null
    //     0x5261f4: mov             x2, NULL
    // 0x5261f8: r1 = Null
    //     0x5261f8: mov             x1, NULL
    // 0x5261fc: r4 = 59
    //     0x5261fc: movz            x4, #0x3b
    // 0x526200: branchIfSmi(r0, 0x52620c)
    //     0x526200: tbz             w0, #0, #0x52620c
    // 0x526204: r4 = LoadClassIdInstr(r0)
    //     0x526204: ldur            x4, [x0, #-1]
    //     0x526208: ubfx            x4, x4, #0xc, #0x14
    // 0x52620c: cmp             x4, #0x55f
    // 0x526210: b.eq            #0x526228
    // 0x526214: r8 = Ey
    //     0x526214: add             x8, PP, #0x18, lsl #12  ; [pp+0x18f78] Type: Ey
    //     0x526218: ldr             x8, [x8, #0xf78]
    // 0x52621c: r3 = Null
    //     0x52621c: add             x3, PP, #0x18, lsl #12  ; [pp+0x18f80] Null
    //     0x526220: ldr             x3, [x3, #0xf80]
    // 0x526224: r0 = DefaultTypeTest()
    //     0x526224: bl              #0x5523c0  ; DefaultTypeTestStub
    // 0x526228: r0 = "Attempt to execute code removed by Dart AOT compiler (TFA)"
    //     0x526228: ldr             x0, [PP, #0x6d0]  ; [pp+0x6d0] "Attempt to execute code removed by Dart AOT compiler (TFA)"
    // 0x52622c: r0 = Throw()
    //     0x52622c: bl              #0x5527dc  ; ThrowStub
    // 0x526230: brk             #0
  }
}
