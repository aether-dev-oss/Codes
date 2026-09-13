// lib: Rmg, url: Ulg

// class id: 1049336, size: 0x8
class :: {
}

// class id: 217, size: 0xc, field offset: 0x8
class Zsa extends Object
    implements Ysa {

  Zsa -(Zsa, Zsa) {
    // ** addr: 0x544074, size: 0x84
    // 0x544074: EnterFrame
    //     0x544074: stp             fp, lr, [SP, #-0x10]!
    //     0x544078: mov             fp, SP
    // 0x54407c: CheckStackOverflow
    //     0x54407c: ldr             x16, [THR, #0x38]  ; THR::stack_limit
    //     0x544080: cmp             SP, x16
    //     0x544084: b.ls            #0x5440d8
    // 0x544088: ldr             x0, [fp, #0x10]
    // 0x54408c: r2 = Null
    //     0x54408c: mov             x2, NULL
    // 0x544090: r1 = Null
    //     0x544090: mov             x1, NULL
    // 0x544094: r4 = 59
    //     0x544094: movz            x4, #0x3b
    // 0x544098: branchIfSmi(r0, 0x5440a4)
    //     0x544098: tbz             w0, #0, #0x5440a4
    // 0x54409c: r4 = LoadClassIdInstr(r0)
    //     0x54409c: ldur            x4, [x0, #-1]
    //     0x5440a0: ubfx            x4, x4, #0xc, #0x14
    // 0x5440a4: cmp             x4, #0xd9
    // 0x5440a8: b.eq            #0x5440c0
    // 0x5440ac: r8 = Zsa
    //     0x5440ac: add             x8, PP, #0x24, lsl #12  ; [pp+0x24008] Type: Zsa
    //     0x5440b0: ldr             x8, [x8, #8]
    // 0x5440b4: r3 = Null
    //     0x5440b4: add             x3, PP, #0x24, lsl #12  ; [pp+0x24020] Null
    //     0x5440b8: ldr             x3, [x3, #0x20]
    // 0x5440bc: r0 = DefaultTypeTest()
    //     0x5440bc: bl              #0x5523c0  ; DefaultTypeTestStub
    // 0x5440c0: ldr             x1, [fp, #0x18]
    // 0x5440c4: ldr             x2, [fp, #0x10]
    // 0x5440c8: r0 = call 0x3cf4e8
    //     0x5440c8: bl              #0x3cf4e8
    // 0x5440cc: LeaveFrame
    //     0x5440cc: mov             SP, fp
    //     0x5440d0: ldp             fp, lr, [SP], #0x10
    // 0x5440d4: ret
    //     0x5440d4: ret             
    // 0x5440d8: r0 = StackOverflowSharedWithoutFPURegs()
    //     0x5440d8: bl              #0x554734  ; StackOverflowSharedWithoutFPURegsStub
    // 0x5440dc: b               #0x544088
  }
  Zsa +(Zsa, Zsa) {
    // ** addr: 0x5440f8, size: 0x84
    // 0x5440f8: EnterFrame
    //     0x5440f8: stp             fp, lr, [SP, #-0x10]!
    //     0x5440fc: mov             fp, SP
    // 0x544100: CheckStackOverflow
    //     0x544100: ldr             x16, [THR, #0x38]  ; THR::stack_limit
    //     0x544104: cmp             SP, x16
    //     0x544108: b.ls            #0x54415c
    // 0x54410c: ldr             x0, [fp, #0x10]
    // 0x544110: r2 = Null
    //     0x544110: mov             x2, NULL
    // 0x544114: r1 = Null
    //     0x544114: mov             x1, NULL
    // 0x544118: r4 = 59
    //     0x544118: movz            x4, #0x3b
    // 0x54411c: branchIfSmi(r0, 0x544128)
    //     0x54411c: tbz             w0, #0, #0x544128
    // 0x544120: r4 = LoadClassIdInstr(r0)
    //     0x544120: ldur            x4, [x0, #-1]
    //     0x544124: ubfx            x4, x4, #0xc, #0x14
    // 0x544128: cmp             x4, #0xd9
    // 0x54412c: b.eq            #0x544144
    // 0x544130: r8 = Zsa
    //     0x544130: add             x8, PP, #0x24, lsl #12  ; [pp+0x24008] Type: Zsa
    //     0x544134: ldr             x8, [x8, #8]
    // 0x544138: r3 = Null
    //     0x544138: add             x3, PP, #0x24, lsl #12  ; [pp+0x24010] Null
    //     0x54413c: ldr             x3, [x3, #0x10]
    // 0x544140: r0 = DefaultTypeTest()
    //     0x544140: bl              #0x5523c0  ; DefaultTypeTestStub
    // 0x544144: ldr             x1, [fp, #0x18]
    // 0x544148: ldr             x2, [fp, #0x10]
    // 0x54414c: r0 = call 0x3cf72c
    //     0x54414c: bl              #0x3cf72c
    // 0x544150: LeaveFrame
    //     0x544150: mov             SP, fp
    //     0x544154: ldp             fp, lr, [SP], #0x10
    // 0x544158: ret
    //     0x544158: ret             
    // 0x54415c: r0 = StackOverflowSharedWithoutFPURegs()
    //     0x54415c: bl              #0x554734  ; StackOverflowSharedWithoutFPURegsStub
    // 0x544160: b               #0x54410c
  }
  double [](Zsa, int) {
    // ** addr: 0x54417c, size: 0x60
    // 0x54417c: EnterFrame
    //     0x54417c: stp             fp, lr, [SP, #-0x10]!
    //     0x544180: mov             fp, SP
    // 0x544184: ldr             x0, [fp, #0x10]
    // 0x544188: r2 = Null
    //     0x544188: mov             x2, NULL
    // 0x54418c: r1 = Null
    //     0x54418c: mov             x1, NULL
    // 0x544190: branchIfSmi(r0, 0x5441b8)
    //     0x544190: tbz             w0, #0, #0x5441b8
    // 0x544194: r4 = LoadClassIdInstr(r0)
    //     0x544194: ldur            x4, [x0, #-1]
    //     0x544198: ubfx            x4, x4, #0xc, #0x14
    // 0x54419c: sub             x4, x4, #0x3b
    // 0x5441a0: cmp             x4, #1
    // 0x5441a4: b.ls            #0x5441b8
    // 0x5441a8: r8 = int
    //     0x5441a8: ldr             x8, [PP, #0xf80]  ; [pp+0xf80] Type: int
    // 0x5441ac: r3 = Null
    //     0x5441ac: add             x3, PP, #0x23, lsl #12  ; [pp+0x23ff8] Null
    //     0x5441b0: ldr             x3, [x3, #0xff8]
    // 0x5441b4: r0 = int()
    //     0x5441b4: bl              #0x55b758  ; IsType_int_Stub
    // 0x5441b8: r0 = "Attempt to execute code removed by Dart AOT compiler (TFA)"
    //     0x5441b8: ldr             x0, [PP, #0x6d0]  ; [pp+0x6d0] "Attempt to execute code removed by Dart AOT compiler (TFA)"
    // 0x5441bc: r0 = Throw()
    //     0x5441bc: bl              #0x5527dc  ; ThrowStub
    // 0x5441c0: brk             #0
  }
  Zsa *(Zsa, double) {
    // ** addr: 0x5441dc, size: 0x50
    // 0x5441dc: EnterFrame
    //     0x5441dc: stp             fp, lr, [SP, #-0x10]!
    //     0x5441e0: mov             fp, SP
    // 0x5441e4: CheckStackOverflow
    //     0x5441e4: ldr             x16, [THR, #0x38]  ; THR::stack_limit
    //     0x5441e8: cmp             SP, x16
    //     0x5441ec: b.ls            #0x54420c
    // 0x5441f0: ldr             x0, [fp, #0x10]
    // 0x5441f4: LoadField: d0 = r0->field_7
    //     0x5441f4: ldur            d0, [x0, #7]
    // 0x5441f8: ldr             x1, [fp, #0x18]
    // 0x5441fc: r0 = call 0x3cf8bc
    //     0x5441fc: bl              #0x3cf8bc
    // 0x544200: LeaveFrame
    //     0x544200: mov             SP, fp
    //     0x544204: ldp             fp, lr, [SP], #0x10
    // 0x544208: ret
    //     0x544208: ret             
    // 0x54420c: r0 = StackOverflowSharedWithoutFPURegs()
    //     0x54420c: bl              #0x554734  ; StackOverflowSharedWithoutFPURegsStub
    // 0x544210: b               #0x5441f0
  }
}

// class id: 219, size: 0x8, field offset: 0x8
abstract class Ysa extends Object {
}

// class id: 220, size: 0xc, field offset: 0x8
class Hy extends Object {

  Hy +(Hy, Hy) {
    // ** addr: 0x537a2c, size: 0x84
    // 0x537a2c: EnterFrame
    //     0x537a2c: stp             fp, lr, [SP, #-0x10]!
    //     0x537a30: mov             fp, SP
    // 0x537a34: CheckStackOverflow
    //     0x537a34: ldr             x16, [THR, #0x38]  ; THR::stack_limit
    //     0x537a38: cmp             SP, x16
    //     0x537a3c: b.ls            #0x537a90
    // 0x537a40: ldr             x0, [fp, #0x10]
    // 0x537a44: r2 = Null
    //     0x537a44: mov             x2, NULL
    // 0x537a48: r1 = Null
    //     0x537a48: mov             x1, NULL
    // 0x537a4c: r4 = 59
    //     0x537a4c: movz            x4, #0x3b
    // 0x537a50: branchIfSmi(r0, 0x537a5c)
    //     0x537a50: tbz             w0, #0, #0x537a5c
    // 0x537a54: r4 = LoadClassIdInstr(r0)
    //     0x537a54: ldur            x4, [x0, #-1]
    //     0x537a58: ubfx            x4, x4, #0xc, #0x14
    // 0x537a5c: cmp             x4, #0xdc
    // 0x537a60: b.eq            #0x537a78
    // 0x537a64: r8 = Hy
    //     0x537a64: add             x8, PP, #0x23, lsl #12  ; [pp+0x23488] Type: Hy
    //     0x537a68: ldr             x8, [x8, #0x488]
    // 0x537a6c: r3 = Null
    //     0x537a6c: add             x3, PP, #0x23, lsl #12  ; [pp+0x234a0] Null
    //     0x537a70: ldr             x3, [x3, #0x4a0]
    // 0x537a74: r0 = DefaultTypeTest()
    //     0x537a74: bl              #0x5523c0  ; DefaultTypeTestStub
    // 0x537a78: ldr             x1, [fp, #0x18]
    // 0x537a7c: ldr             x2, [fp, #0x10]
    // 0x537a80: r0 = call 0x35655c
    //     0x537a80: bl              #0x35655c
    // 0x537a84: LeaveFrame
    //     0x537a84: mov             SP, fp
    //     0x537a88: ldp             fp, lr, [SP], #0x10
    // 0x537a8c: ret
    //     0x537a8c: ret             
    // 0x537a90: r0 = StackOverflowSharedWithoutFPURegs()
    //     0x537a90: bl              #0x554734  ; StackOverflowSharedWithoutFPURegsStub
    // 0x537a94: b               #0x537a40
  }
  dynamic *(Hy, dynamic) {
    // ** addr: 0x537ab0, size: 0x50
    // 0x537ab0: EnterFrame
    //     0x537ab0: stp             fp, lr, [SP, #-0x10]!
    //     0x537ab4: mov             fp, SP
    // 0x537ab8: CheckStackOverflow
    //     0x537ab8: ldr             x16, [THR, #0x38]  ; THR::stack_limit
    //     0x537abc: cmp             SP, x16
    //     0x537ac0: b.ls            #0x537ae0
    // 0x537ac4: ldr             x0, [fp, #0x10]
    // 0x537ac8: LoadField: d0 = r0->field_7
    //     0x537ac8: ldur            d0, [x0, #7]
    // 0x537acc: ldr             x1, [fp, #0x18]
    // 0x537ad0: r0 = call 0x356cb4
    //     0x537ad0: bl              #0x356cb4
    // 0x537ad4: LeaveFrame
    //     0x537ad4: mov             SP, fp
    //     0x537ad8: ldp             fp, lr, [SP], #0x10
    // 0x537adc: ret
    //     0x537adc: ret             
    // 0x537ae0: r0 = StackOverflowSharedWithoutFPURegs()
    //     0x537ae0: bl              #0x554734  ; StackOverflowSharedWithoutFPURegsStub
    // 0x537ae4: b               #0x537ac4
  }
  Hy -(Hy, Hy) {
    // ** addr: 0x537b00, size: 0x84
    // 0x537b00: EnterFrame
    //     0x537b00: stp             fp, lr, [SP, #-0x10]!
    //     0x537b04: mov             fp, SP
    // 0x537b08: CheckStackOverflow
    //     0x537b08: ldr             x16, [THR, #0x38]  ; THR::stack_limit
    //     0x537b0c: cmp             SP, x16
    //     0x537b10: b.ls            #0x537b64
    // 0x537b14: ldr             x0, [fp, #0x10]
    // 0x537b18: r2 = Null
    //     0x537b18: mov             x2, NULL
    // 0x537b1c: r1 = Null
    //     0x537b1c: mov             x1, NULL
    // 0x537b20: r4 = 59
    //     0x537b20: movz            x4, #0x3b
    // 0x537b24: branchIfSmi(r0, 0x537b30)
    //     0x537b24: tbz             w0, #0, #0x537b30
    // 0x537b28: r4 = LoadClassIdInstr(r0)
    //     0x537b28: ldur            x4, [x0, #-1]
    //     0x537b2c: ubfx            x4, x4, #0xc, #0x14
    // 0x537b30: cmp             x4, #0xdc
    // 0x537b34: b.eq            #0x537b4c
    // 0x537b38: r8 = Hy
    //     0x537b38: add             x8, PP, #0x23, lsl #12  ; [pp+0x23488] Type: Hy
    //     0x537b3c: ldr             x8, [x8, #0x488]
    // 0x537b40: r3 = Null
    //     0x537b40: add             x3, PP, #0x23, lsl #12  ; [pp+0x23490] Null
    //     0x537b44: ldr             x3, [x3, #0x490]
    // 0x537b48: r0 = DefaultTypeTest()
    //     0x537b48: bl              #0x5523c0  ; DefaultTypeTestStub
    // 0x537b4c: ldr             x1, [fp, #0x18]
    // 0x537b50: ldr             x2, [fp, #0x10]
    // 0x537b54: r0 = call 0x356d00
    //     0x537b54: bl              #0x356d00
    // 0x537b58: LeaveFrame
    //     0x537b58: mov             SP, fp
    //     0x537b5c: ldp             fp, lr, [SP], #0x10
    // 0x537b60: ret
    //     0x537b60: ret             
    // 0x537b64: r0 = StackOverflowSharedWithoutFPURegs()
    //     0x537b64: bl              #0x554734  ; StackOverflowSharedWithoutFPURegsStub
    // 0x537b68: b               #0x537b14
  }
  double [](Hy, int) {
    // ** addr: 0x537b84, size: 0x60
    // 0x537b84: EnterFrame
    //     0x537b84: stp             fp, lr, [SP, #-0x10]!
    //     0x537b88: mov             fp, SP
    // 0x537b8c: ldr             x0, [fp, #0x10]
    // 0x537b90: r2 = Null
    //     0x537b90: mov             x2, NULL
    // 0x537b94: r1 = Null
    //     0x537b94: mov             x1, NULL
    // 0x537b98: branchIfSmi(r0, 0x537bc0)
    //     0x537b98: tbz             w0, #0, #0x537bc0
    // 0x537b9c: r4 = LoadClassIdInstr(r0)
    //     0x537b9c: ldur            x4, [x0, #-1]
    //     0x537ba0: ubfx            x4, x4, #0xc, #0x14
    // 0x537ba4: sub             x4, x4, #0x3b
    // 0x537ba8: cmp             x4, #1
    // 0x537bac: b.ls            #0x537bc0
    // 0x537bb0: r8 = int
    //     0x537bb0: ldr             x8, [PP, #0xf80]  ; [pp+0xf80] Type: int
    // 0x537bb4: r3 = Null
    //     0x537bb4: add             x3, PP, #0x23, lsl #12  ; [pp+0x234b0] Null
    //     0x537bb8: ldr             x3, [x3, #0x4b0]
    // 0x537bbc: r0 = int()
    //     0x537bbc: bl              #0x55b758  ; IsType_int_Stub
    // 0x537bc0: r0 = "Attempt to execute code removed by Dart AOT compiler (TFA)"
    //     0x537bc0: ldr             x0, [PP, #0x6d0]  ; [pp+0x6d0] "Attempt to execute code removed by Dart AOT compiler (TFA)"
    // 0x537bc4: r0 = Throw()
    //     0x537bc4: bl              #0x5527dc  ; ThrowStub
    // 0x537bc8: brk             #0
  }
}
