// lib: , url: mcg

// class id: 1048814, size: 0x8
class :: {
}

// class id: 1194, size: 0x8, field offset: 0x8
//   const constructor, 
abstract class jL extends Object {
}

// class id: 1195, size: 0x28, field offset: 0x8
//   const constructor, 
class _lL extends jL {
}

// class id: 1196, size: 0x18, field offset: 0x8
//   const constructor, 
class kL extends jL {

  dq field_8;
  dq field_c;
  dq field_10;
  dq field_14;

  kL -(kL, kL) {
    // ** addr: 0x525150, size: 0x84
    // 0x525150: EnterFrame
    //     0x525150: stp             fp, lr, [SP, #-0x10]!
    //     0x525154: mov             fp, SP
    // 0x525158: CheckStackOverflow
    //     0x525158: ldr             x16, [THR, #0x38]  ; THR::stack_limit
    //     0x52515c: cmp             SP, x16
    //     0x525160: b.ls            #0x5251b4
    // 0x525164: ldr             x0, [fp, #0x10]
    // 0x525168: r2 = Null
    //     0x525168: mov             x2, NULL
    // 0x52516c: r1 = Null
    //     0x52516c: mov             x1, NULL
    // 0x525170: r4 = 59
    //     0x525170: movz            x4, #0x3b
    // 0x525174: branchIfSmi(r0, 0x525180)
    //     0x525174: tbz             w0, #0, #0x525180
    // 0x525178: r4 = LoadClassIdInstr(r0)
    //     0x525178: ldur            x4, [x0, #-1]
    //     0x52517c: ubfx            x4, x4, #0xc, #0x14
    // 0x525180: cmp             x4, #0x4ac
    // 0x525184: b.eq            #0x52519c
    // 0x525188: r8 = kL
    //     0x525188: add             x8, PP, #0x18, lsl #12  ; [pp+0x18ed0] Type: kL
    //     0x52518c: ldr             x8, [x8, #0xed0]
    // 0x525190: r3 = Null
    //     0x525190: add             x3, PP, #0x18, lsl #12  ; [pp+0x18ee8] Null
    //     0x525194: ldr             x3, [x3, #0xee8]
    // 0x525198: r0 = DefaultTypeTest()
    //     0x525198: bl              #0x5523c0  ; DefaultTypeTestStub
    // 0x52519c: ldr             x1, [fp, #0x18]
    // 0x5251a0: ldr             x2, [fp, #0x10]
    // 0x5251a4: r0 = call 0x2487b8
    //     0x5251a4: bl              #0x2487b8
    // 0x5251a8: LeaveFrame
    //     0x5251a8: mov             SP, fp
    //     0x5251ac: ldp             fp, lr, [SP], #0x10
    // 0x5251b0: ret
    //     0x5251b0: ret             
    // 0x5251b4: r0 = StackOverflowSharedWithoutFPURegs()
    //     0x5251b4: bl              #0x554734  ; StackOverflowSharedWithoutFPURegsStub
    // 0x5251b8: b               #0x525164
  }
  kL *(kL, double) {
    // ** addr: 0x5251e0, size: 0x50
    // 0x5251e0: EnterFrame
    //     0x5251e0: stp             fp, lr, [SP, #-0x10]!
    //     0x5251e4: mov             fp, SP
    // 0x5251e8: CheckStackOverflow
    //     0x5251e8: ldr             x16, [THR, #0x38]  ; THR::stack_limit
    //     0x5251ec: cmp             SP, x16
    //     0x5251f0: b.ls            #0x525210
    // 0x5251f4: ldr             x0, [fp, #0x10]
    // 0x5251f8: LoadField: d0 = r0->field_7
    //     0x5251f8: ldur            d0, [x0, #7]
    // 0x5251fc: ldr             x1, [fp, #0x18]
    // 0x525200: r0 = call 0x4c4d80
    //     0x525200: bl              #0x4c4d80
    // 0x525204: LeaveFrame
    //     0x525204: mov             SP, fp
    //     0x525208: ldp             fp, lr, [SP], #0x10
    // 0x52520c: ret
    //     0x52520c: ret             
    // 0x525210: r0 = StackOverflowSharedWithoutFPURegs()
    //     0x525210: bl              #0x554734  ; StackOverflowSharedWithoutFPURegsStub
    // 0x525214: b               #0x5251f4
  }
  kL +(kL, kL) {
    // ** addr: 0x525230, size: 0x84
    // 0x525230: EnterFrame
    //     0x525230: stp             fp, lr, [SP, #-0x10]!
    //     0x525234: mov             fp, SP
    // 0x525238: CheckStackOverflow
    //     0x525238: ldr             x16, [THR, #0x38]  ; THR::stack_limit
    //     0x52523c: cmp             SP, x16
    //     0x525240: b.ls            #0x525294
    // 0x525244: ldr             x0, [fp, #0x10]
    // 0x525248: r2 = Null
    //     0x525248: mov             x2, NULL
    // 0x52524c: r1 = Null
    //     0x52524c: mov             x1, NULL
    // 0x525250: r4 = 59
    //     0x525250: movz            x4, #0x3b
    // 0x525254: branchIfSmi(r0, 0x525260)
    //     0x525254: tbz             w0, #0, #0x525260
    // 0x525258: r4 = LoadClassIdInstr(r0)
    //     0x525258: ldur            x4, [x0, #-1]
    //     0x52525c: ubfx            x4, x4, #0xc, #0x14
    // 0x525260: cmp             x4, #0x4ac
    // 0x525264: b.eq            #0x52527c
    // 0x525268: r8 = kL
    //     0x525268: add             x8, PP, #0x18, lsl #12  ; [pp+0x18ed0] Type: kL
    //     0x52526c: ldr             x8, [x8, #0xed0]
    // 0x525270: r3 = Null
    //     0x525270: add             x3, PP, #0x18, lsl #12  ; [pp+0x18ed8] Null
    //     0x525274: ldr             x3, [x3, #0xed8]
    // 0x525278: r0 = DefaultTypeTest()
    //     0x525278: bl              #0x5523c0  ; DefaultTypeTestStub
    // 0x52527c: ldr             x1, [fp, #0x18]
    // 0x525280: ldr             x2, [fp, #0x10]
    // 0x525284: r0 = call 0x24889c
    //     0x525284: bl              #0x24889c
    // 0x525288: LeaveFrame
    //     0x525288: mov             SP, fp
    //     0x52528c: ldp             fp, lr, [SP], #0x10
    // 0x525290: ret
    //     0x525290: ret             
    // 0x525294: r0 = StackOverflowSharedWithoutFPURegs()
    //     0x525294: bl              #0x554734  ; StackOverflowSharedWithoutFPURegsStub
    // 0x525298: b               #0x525244
  }
}
