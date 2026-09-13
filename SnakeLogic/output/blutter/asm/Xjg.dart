// lib: , url: Xjg

// class id: 1049233, size: 0x8
class :: {

  static late final List<int> _Cfe; // offset: 0xb44
}

// class id: 392, size: 0xc, field offset: 0x8
class Gna extends Object {

  Ss [](Gna, int) {
    // ** addr: 0x543f9c, size: 0xa8
    // 0x543f9c: EnterFrame
    //     0x543f9c: stp             fp, lr, [SP, #-0x10]!
    //     0x543fa0: mov             fp, SP
    // 0x543fa4: ldr             x0, [fp, #0x10]
    // 0x543fa8: r2 = Null
    //     0x543fa8: mov             x2, NULL
    // 0x543fac: r1 = Null
    //     0x543fac: mov             x1, NULL
    // 0x543fb0: branchIfSmi(r0, 0x543fd8)
    //     0x543fb0: tbz             w0, #0, #0x543fd8
    // 0x543fb4: r4 = LoadClassIdInstr(r0)
    //     0x543fb4: ldur            x4, [x0, #-1]
    //     0x543fb8: ubfx            x4, x4, #0xc, #0x14
    // 0x543fbc: sub             x4, x4, #0x3b
    // 0x543fc0: cmp             x4, #1
    // 0x543fc4: b.ls            #0x543fd8
    // 0x543fc8: r8 = int
    //     0x543fc8: ldr             x8, [PP, #0xf80]  ; [pp+0xf80] Type: int
    // 0x543fcc: r3 = Null
    //     0x543fcc: add             x3, PP, #0x15, lsl #12  ; [pp+0x15a08] Null
    //     0x543fd0: ldr             x3, [x3, #0xa08]
    // 0x543fd4: r0 = int()
    //     0x543fd4: bl              #0x55b758  ; IsType_int_Stub
    // 0x543fd8: ldr             x2, [fp, #0x18]
    // 0x543fdc: LoadField: r3 = r2->field_7
    //     0x543fdc: ldur            w3, [x2, #7]
    // 0x543fe0: DecompressPointer r3
    //     0x543fe0: add             x3, x3, HEAP, lsl #32
    // 0x543fe4: LoadField: r2 = r3->field_b
    //     0x543fe4: ldur            w2, [x3, #0xb]
    // 0x543fe8: ldr             x4, [fp, #0x10]
    // 0x543fec: r5 = LoadInt32Instr(r4)
    //     0x543fec: sbfx            x5, x4, #1, #0x1f
    //     0x543ff0: tbz             w4, #0, #0x543ff8
    //     0x543ff4: ldur            x5, [x4, #7]
    // 0x543ff8: r0 = LoadInt32Instr(r2)
    //     0x543ff8: sbfx            x0, x2, #1, #0x1f
    // 0x543ffc: mov             x1, x5
    // 0x544000: cmp             x1, x0
    // 0x544004: b.hs            #0x544028
    // 0x544008: LoadField: r1 = r3->field_f
    //     0x544008: ldur            w1, [x3, #0xf]
    // 0x54400c: DecompressPointer r1
    //     0x54400c: add             x1, x1, HEAP, lsl #32
    // 0x544010: ArrayLoad: r0 = r1[r5]  ; Unknown_4
    //     0x544010: add             x16, x1, x5, lsl #2
    //     0x544014: ldur            w0, [x16, #0xf]
    // 0x544018: DecompressPointer r0
    //     0x544018: add             x0, x0, HEAP, lsl #32
    // 0x54401c: LeaveFrame
    //     0x54401c: mov             SP, fp
    //     0x544020: ldp             fp, lr, [SP], #0x10
    // 0x544024: ret
    //     0x544024: ret             
    // 0x544028: r0 = RangeErrorSharedWithoutFPURegs()
    //     0x544028: bl              #0x554b7c  ; RangeErrorSharedWithoutFPURegsStub
  }
}

// class id: 393, size: 0x10, field offset: 0x8
class Ss extends Object {

  late int _WAb; // offset: 0xc
  late int _VAb; // offset: 0x8

  int dyn:get:_WAb(Ss) {
    // ** addr: 0x543f04, size: 0x48
    // 0x543f04: ldr             x1, [SP]
    // 0x543f08: LoadField: r0 = r1->field_b
    //     0x543f08: ldur            w0, [x1, #0xb]
    // 0x543f0c: DecompressPointer r0
    //     0x543f0c: add             x0, x0, HEAP, lsl #32
    // 0x543f10: r16 = Sentinel
    //     0x543f10: ldr             x16, [PP, #0x40]  ; [pp+0x40] Sentinel
    // 0x543f14: cmp             w0, w16
    // 0x543f18: b.eq            #0x543f20
    // 0x543f1c: ret
    //     0x543f1c: ret             
    // 0x543f20: EnterFrame
    //     0x543f20: stp             fp, lr, [SP, #-0x10]!
    //     0x543f24: mov             fp, SP
    // 0x543f28: r9 = _WAb
    //     0x543f28: add             x9, PP, #0x11, lsl #12  ; [pp+0x11c58] Field <Ss._WAb@665143242>: late (offset: 0xc)
    //     0x543f2c: ldr             x9, [x9, #0xc58]
    // 0x543f30: r0 = LateInitializationErrorSharedWithoutFPURegs()
    //     0x543f30: bl              #0x554f64  ; LateInitializationErrorSharedWithoutFPURegsStub
  }
}
