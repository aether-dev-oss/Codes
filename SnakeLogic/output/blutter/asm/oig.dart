// lib: , url: oig

// class id: 1049148, size: 0x8
class :: {
}

// class id: 473, size: 0x18, field offset: 0x8
class Ula extends Object {
}

// class id: 474, size: 0x20, field offset: 0x8
class Tla extends Object {
}

// class id: 475, size: 0x20, field offset: 0x8
class Sla extends Object {
}

// class id: 476, size: 0x18, field offset: 0x8
//   const constructor, 
class _Rla extends Object {

  _Mint field_8;
  _Mint field_10;

  _Rla -(_Rla, _Rla) {
    // ** addr: 0x537bf0, size: 0x84
    // 0x537bf0: EnterFrame
    //     0x537bf0: stp             fp, lr, [SP, #-0x10]!
    //     0x537bf4: mov             fp, SP
    // 0x537bf8: CheckStackOverflow
    //     0x537bf8: ldr             x16, [THR, #0x38]  ; THR::stack_limit
    //     0x537bfc: cmp             SP, x16
    //     0x537c00: b.ls            #0x537c54
    // 0x537c04: ldr             x0, [fp, #0x10]
    // 0x537c08: r2 = Null
    //     0x537c08: mov             x2, NULL
    // 0x537c0c: r1 = Null
    //     0x537c0c: mov             x1, NULL
    // 0x537c10: r4 = 59
    //     0x537c10: movz            x4, #0x3b
    // 0x537c14: branchIfSmi(r0, 0x537c20)
    //     0x537c14: tbz             w0, #0, #0x537c20
    // 0x537c18: r4 = LoadClassIdInstr(r0)
    //     0x537c18: ldur            x4, [x0, #-1]
    //     0x537c1c: ubfx            x4, x4, #0xc, #0x14
    // 0x537c20: cmp             x4, #0x1dc
    // 0x537c24: b.eq            #0x537c3c
    // 0x537c28: r8 = _Rla
    //     0x537c28: add             x8, PP, #0x23, lsl #12  ; [pp+0x234d0] Type: _Rla
    //     0x537c2c: ldr             x8, [x8, #0x4d0]
    // 0x537c30: r3 = Null
    //     0x537c30: add             x3, PP, #0x23, lsl #12  ; [pp+0x234d8] Null
    //     0x537c34: ldr             x3, [x3, #0x4d8]
    // 0x537c38: r0 = DefaultTypeTest()
    //     0x537c38: bl              #0x5523c0  ; DefaultTypeTestStub
    // 0x537c3c: ldr             x1, [fp, #0x18]
    // 0x537c40: ldr             x2, [fp, #0x10]
    // 0x537c44: r0 = call 0x357204
    //     0x537c44: bl              #0x357204
    // 0x537c48: LeaveFrame
    //     0x537c48: mov             SP, fp
    //     0x537c4c: ldp             fp, lr, [SP], #0x10
    // 0x537c50: ret
    //     0x537c50: ret             
    // 0x537c54: r0 = StackOverflowSharedWithoutFPURegs()
    //     0x537c54: bl              #0x554734  ; StackOverflowSharedWithoutFPURegsStub
    // 0x537c58: b               #0x537c04
  }
  _Rla +(_Rla, _Rla) {
    // ** addr: 0x537c74, size: 0x84
    // 0x537c74: EnterFrame
    //     0x537c74: stp             fp, lr, [SP, #-0x10]!
    //     0x537c78: mov             fp, SP
    // 0x537c7c: CheckStackOverflow
    //     0x537c7c: ldr             x16, [THR, #0x38]  ; THR::stack_limit
    //     0x537c80: cmp             SP, x16
    //     0x537c84: b.ls            #0x537cd8
    // 0x537c88: ldr             x0, [fp, #0x10]
    // 0x537c8c: r2 = Null
    //     0x537c8c: mov             x2, NULL
    // 0x537c90: r1 = Null
    //     0x537c90: mov             x1, NULL
    // 0x537c94: r4 = 59
    //     0x537c94: movz            x4, #0x3b
    // 0x537c98: branchIfSmi(r0, 0x537ca4)
    //     0x537c98: tbz             w0, #0, #0x537ca4
    // 0x537c9c: r4 = LoadClassIdInstr(r0)
    //     0x537c9c: ldur            x4, [x0, #-1]
    //     0x537ca0: ubfx            x4, x4, #0xc, #0x14
    // 0x537ca4: cmp             x4, #0x1dc
    // 0x537ca8: b.eq            #0x537cc0
    // 0x537cac: r8 = _Rla
    //     0x537cac: add             x8, PP, #0x23, lsl #12  ; [pp+0x234d0] Type: _Rla
    //     0x537cb0: ldr             x8, [x8, #0x4d0]
    // 0x537cb4: r3 = Null
    //     0x537cb4: add             x3, PP, #0x23, lsl #12  ; [pp+0x234e8] Null
    //     0x537cb8: ldr             x3, [x3, #0x4e8]
    // 0x537cbc: r0 = DefaultTypeTest()
    //     0x537cbc: bl              #0x5523c0  ; DefaultTypeTestStub
    // 0x537cc0: ldr             x1, [fp, #0x18]
    // 0x537cc4: ldr             x2, [fp, #0x10]
    // 0x537cc8: r0 = call 0x357250
    //     0x537cc8: bl              #0x357250
    // 0x537ccc: LeaveFrame
    //     0x537ccc: mov             SP, fp
    //     0x537cd0: ldp             fp, lr, [SP], #0x10
    // 0x537cd4: ret
    //     0x537cd4: ret             
    // 0x537cd8: r0 = StackOverflowSharedWithoutFPURegs()
    //     0x537cd8: bl              #0x554734  ; StackOverflowSharedWithoutFPURegsStub
    // 0x537cdc: b               #0x537c88
  }
  _Rla *(_Rla, double) {
    // ** addr: 0x537cf8, size: 0x50
    // 0x537cf8: EnterFrame
    //     0x537cf8: stp             fp, lr, [SP, #-0x10]!
    //     0x537cfc: mov             fp, SP
    // 0x537d00: CheckStackOverflow
    //     0x537d00: ldr             x16, [THR, #0x38]  ; THR::stack_limit
    //     0x537d04: cmp             SP, x16
    //     0x537d08: b.ls            #0x537d28
    // 0x537d0c: ldr             x0, [fp, #0x10]
    // 0x537d10: LoadField: d0 = r0->field_7
    //     0x537d10: ldur            d0, [x0, #7]
    // 0x537d14: ldr             x1, [fp, #0x18]
    // 0x537d18: r0 = call 0x3571c0
    //     0x537d18: bl              #0x3571c0
    // 0x537d1c: LeaveFrame
    //     0x537d1c: mov             SP, fp
    //     0x537d20: ldp             fp, lr, [SP], #0x10
    // 0x537d24: ret
    //     0x537d24: ret             
    // 0x537d28: r0 = StackOverflowSharedWithoutFPURegs()
    //     0x537d28: bl              #0x554734  ; StackOverflowSharedWithoutFPURegsStub
    // 0x537d2c: b               #0x537d0c
  }
}

// class id: 477, size: 0x8, field offset: 0x8
abstract class Qla extends Object {
}
