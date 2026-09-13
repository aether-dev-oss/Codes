// lib: Pmg, url: amg

// class id: 1049337, size: 0x8
class :: {
}

// class id: 211, size: 0xc, field offset: 0x8
class Zsa extends Object
    implements Ysa {

  Zsa +(Zsa, Zsa) {
    // ** addr: 0x51b04c, size: 0x84
    // 0x51b04c: EnterFrame
    //     0x51b04c: stp             fp, lr, [SP, #-0x10]!
    //     0x51b050: mov             fp, SP
    // 0x51b054: CheckStackOverflow
    //     0x51b054: ldr             x16, [THR, #0x38]  ; THR::stack_limit
    //     0x51b058: cmp             SP, x16
    //     0x51b05c: b.ls            #0x51b0b0
    // 0x51b060: ldr             x0, [fp, #0x10]
    // 0x51b064: r2 = Null
    //     0x51b064: mov             x2, NULL
    // 0x51b068: r1 = Null
    //     0x51b068: mov             x1, NULL
    // 0x51b06c: r4 = 59
    //     0x51b06c: movz            x4, #0x3b
    // 0x51b070: branchIfSmi(r0, 0x51b07c)
    //     0x51b070: tbz             w0, #0, #0x51b07c
    // 0x51b074: r4 = LoadClassIdInstr(r0)
    //     0x51b074: ldur            x4, [x0, #-1]
    //     0x51b078: ubfx            x4, x4, #0xc, #0x14
    // 0x51b07c: cmp             x4, #0xd3
    // 0x51b080: b.eq            #0x51b098
    // 0x51b084: r8 = Zsa
    //     0x51b084: add             x8, PP, #0x1a, lsl #12  ; [pp+0x1a580] Type: Zsa
    //     0x51b088: ldr             x8, [x8, #0x580]
    // 0x51b08c: r3 = Null
    //     0x51b08c: add             x3, PP, #0x1a, lsl #12  ; [pp+0x1a588] Null
    //     0x51b090: ldr             x3, [x3, #0x588]
    // 0x51b094: r0 = DefaultTypeTest()
    //     0x51b094: bl              #0x5523c0  ; DefaultTypeTestStub
    // 0x51b098: ldr             x1, [fp, #0x18]
    // 0x51b09c: ldr             x2, [fp, #0x10]
    // 0x51b0a0: r0 = call 0x1db604
    //     0x51b0a0: bl              #0x1db604
    // 0x51b0a4: LeaveFrame
    //     0x51b0a4: mov             SP, fp
    //     0x51b0a8: ldp             fp, lr, [SP], #0x10
    // 0x51b0ac: ret
    //     0x51b0ac: ret             
    // 0x51b0b0: r0 = StackOverflowSharedWithoutFPURegs()
    //     0x51b0b0: bl              #0x554734  ; StackOverflowSharedWithoutFPURegsStub
    // 0x51b0b4: b               #0x51b060
  }
  Zsa *(Zsa, double) {
    // ** addr: 0x51b0d0, size: 0x50
    // 0x51b0d0: EnterFrame
    //     0x51b0d0: stp             fp, lr, [SP, #-0x10]!
    //     0x51b0d4: mov             fp, SP
    // 0x51b0d8: CheckStackOverflow
    //     0x51b0d8: ldr             x16, [THR, #0x38]  ; THR::stack_limit
    //     0x51b0dc: cmp             SP, x16
    //     0x51b0e0: b.ls            #0x51b100
    // 0x51b0e4: ldr             x0, [fp, #0x10]
    // 0x51b0e8: LoadField: d0 = r0->field_7
    //     0x51b0e8: ldur            d0, [x0, #7]
    // 0x51b0ec: ldr             x1, [fp, #0x18]
    // 0x51b0f0: r0 = call 0x1db7f8
    //     0x51b0f0: bl              #0x1db7f8
    // 0x51b0f4: LeaveFrame
    //     0x51b0f4: mov             SP, fp
    //     0x51b0f8: ldp             fp, lr, [SP], #0x10
    // 0x51b0fc: ret
    //     0x51b0fc: ret             
    // 0x51b100: r0 = StackOverflowSharedWithoutFPURegs()
    //     0x51b100: bl              #0x554734  ; StackOverflowSharedWithoutFPURegsStub
    // 0x51b104: b               #0x51b0e4
  }
  Zsa -(Zsa, Zsa) {
    // ** addr: 0x51b120, size: 0x84
    // 0x51b120: EnterFrame
    //     0x51b120: stp             fp, lr, [SP, #-0x10]!
    //     0x51b124: mov             fp, SP
    // 0x51b128: CheckStackOverflow
    //     0x51b128: ldr             x16, [THR, #0x38]  ; THR::stack_limit
    //     0x51b12c: cmp             SP, x16
    //     0x51b130: b.ls            #0x51b184
    // 0x51b134: ldr             x0, [fp, #0x10]
    // 0x51b138: r2 = Null
    //     0x51b138: mov             x2, NULL
    // 0x51b13c: r1 = Null
    //     0x51b13c: mov             x1, NULL
    // 0x51b140: r4 = 59
    //     0x51b140: movz            x4, #0x3b
    // 0x51b144: branchIfSmi(r0, 0x51b150)
    //     0x51b144: tbz             w0, #0, #0x51b150
    // 0x51b148: r4 = LoadClassIdInstr(r0)
    //     0x51b148: ldur            x4, [x0, #-1]
    //     0x51b14c: ubfx            x4, x4, #0xc, #0x14
    // 0x51b150: cmp             x4, #0xd3
    // 0x51b154: b.eq            #0x51b16c
    // 0x51b158: r8 = Zsa
    //     0x51b158: add             x8, PP, #0x1a, lsl #12  ; [pp+0x1a580] Type: Zsa
    //     0x51b15c: ldr             x8, [x8, #0x580]
    // 0x51b160: r3 = Null
    //     0x51b160: add             x3, PP, #0x1a, lsl #12  ; [pp+0x1a598] Null
    //     0x51b164: ldr             x3, [x3, #0x598]
    // 0x51b168: r0 = DefaultTypeTest()
    //     0x51b168: bl              #0x5523c0  ; DefaultTypeTestStub
    // 0x51b16c: ldr             x1, [fp, #0x18]
    // 0x51b170: ldr             x2, [fp, #0x10]
    // 0x51b174: r0 = call 0x1db8c8
    //     0x51b174: bl              #0x1db8c8
    // 0x51b178: LeaveFrame
    //     0x51b178: mov             SP, fp
    //     0x51b17c: ldp             fp, lr, [SP], #0x10
    // 0x51b180: ret
    //     0x51b180: ret             
    // 0x51b184: r0 = StackOverflowSharedWithoutFPURegs()
    //     0x51b184: bl              #0x554734  ; StackOverflowSharedWithoutFPURegsStub
    // 0x51b188: b               #0x51b134
  }
  double [](Zsa, int) {
    // ** addr: 0x51b1a4, size: 0xd4
    // 0x51b1a4: EnterFrame
    //     0x51b1a4: stp             fp, lr, [SP, #-0x10]!
    //     0x51b1a8: mov             fp, SP
    // 0x51b1ac: ldr             x0, [fp, #0x10]
    // 0x51b1b0: r2 = Null
    //     0x51b1b0: mov             x2, NULL
    // 0x51b1b4: r1 = Null
    //     0x51b1b4: mov             x1, NULL
    // 0x51b1b8: branchIfSmi(r0, 0x51b1e0)
    //     0x51b1b8: tbz             w0, #0, #0x51b1e0
    // 0x51b1bc: r4 = LoadClassIdInstr(r0)
    //     0x51b1bc: ldur            x4, [x0, #-1]
    //     0x51b1c0: ubfx            x4, x4, #0xc, #0x14
    // 0x51b1c4: sub             x4, x4, #0x3b
    // 0x51b1c8: cmp             x4, #1
    // 0x51b1cc: b.ls            #0x51b1e0
    // 0x51b1d0: r8 = int
    //     0x51b1d0: ldr             x8, [PP, #0xf80]  ; [pp+0xf80] Type: int
    // 0x51b1d4: r3 = Null
    //     0x51b1d4: add             x3, PP, #0x16, lsl #12  ; [pp+0x16b40] Null
    //     0x51b1d8: ldr             x3, [x3, #0xb40]
    // 0x51b1dc: r0 = int()
    //     0x51b1dc: bl              #0x55b758  ; IsType_int_Stub
    // 0x51b1e0: ldr             x2, [fp, #0x18]
    // 0x51b1e4: LoadField: r3 = r2->field_7
    //     0x51b1e4: ldur            w3, [x2, #7]
    // 0x51b1e8: DecompressPointer r3
    //     0x51b1e8: add             x3, x3, HEAP, lsl #32
    // 0x51b1ec: LoadField: r2 = r3->field_13
    //     0x51b1ec: ldur            w2, [x3, #0x13]
    // 0x51b1f0: ldr             x4, [fp, #0x10]
    // 0x51b1f4: r5 = LoadInt32Instr(r4)
    //     0x51b1f4: sbfx            x5, x4, #1, #0x1f
    //     0x51b1f8: tbz             w4, #0, #0x51b200
    //     0x51b1fc: ldur            x5, [x4, #7]
    // 0x51b200: r0 = LoadInt32Instr(r2)
    //     0x51b200: sbfx            x0, x2, #1, #0x1f
    // 0x51b204: mov             x1, x5
    // 0x51b208: cmp             x1, x0
    // 0x51b20c: b.hs            #0x51b24c
    // 0x51b210: ArrayLoad: d0 = r3[r5]  ; List_8
    //     0x51b210: add             x16, x3, x5, lsl #3
    //     0x51b214: ldur            d0, [x16, #0x17]
    // 0x51b218: r0 = inline_Allocate_Double()
    //     0x51b218: ldp             x0, x1, [THR, #0x50]  ; THR::top
    //     0x51b21c: add             x0, x0, #0x10
    //     0x51b220: cmp             x1, x0
    //     0x51b224: b.ls            #0x51b250
    //     0x51b228: str             x0, [THR, #0x50]  ; THR::top
    //     0x51b22c: sub             x0, x0, #0xf
    //     0x51b230: movz            x1, #0xd15c
    //     0x51b234: movk            x1, #0x3, lsl #16
    //     0x51b238: stur            x1, [x0, #-1]
    // 0x51b23c: StoreField: r0->field_7 = d0
    //     0x51b23c: stur            d0, [x0, #7]
    // 0x51b240: LeaveFrame
    //     0x51b240: mov             SP, fp
    //     0x51b244: ldp             fp, lr, [SP], #0x10
    // 0x51b248: ret
    //     0x51b248: ret             
    // 0x51b24c: r0 = RangeErrorSharedWithoutFPURegs()
    //     0x51b24c: bl              #0x554b7c  ; RangeErrorSharedWithoutFPURegsStub
    // 0x51b250: SaveReg d0
    //     0x51b250: str             q0, [SP, #-0x10]!
    // 0x51b254: r0 = AllocateDouble()
    //     0x51b254: bl              #0x554584  ; AllocateDoubleStub
    // 0x51b258: RestoreReg d0
    //     0x51b258: ldr             q0, [SP], #0x10
    // 0x51b25c: b               #0x51b23c
  }
}

// class id: 212, size: 0xc, field offset: 0x8
class aC extends Object
    implements Ysa {

  aC +(aC, aC) {
    // ** addr: 0x52036c, size: 0x84
    // 0x52036c: EnterFrame
    //     0x52036c: stp             fp, lr, [SP, #-0x10]!
    //     0x520370: mov             fp, SP
    // 0x520374: CheckStackOverflow
    //     0x520374: ldr             x16, [THR, #0x38]  ; THR::stack_limit
    //     0x520378: cmp             SP, x16
    //     0x52037c: b.ls            #0x5203d0
    // 0x520380: ldr             x0, [fp, #0x10]
    // 0x520384: r2 = Null
    //     0x520384: mov             x2, NULL
    // 0x520388: r1 = Null
    //     0x520388: mov             x1, NULL
    // 0x52038c: r4 = 59
    //     0x52038c: movz            x4, #0x3b
    // 0x520390: branchIfSmi(r0, 0x52039c)
    //     0x520390: tbz             w0, #0, #0x52039c
    // 0x520394: r4 = LoadClassIdInstr(r0)
    //     0x520394: ldur            x4, [x0, #-1]
    //     0x520398: ubfx            x4, x4, #0xc, #0x14
    // 0x52039c: cmp             x4, #0xd4
    // 0x5203a0: b.eq            #0x5203b8
    // 0x5203a4: r8 = aC
    //     0x5203a4: add             x8, PP, #0x1a, lsl #12  ; [pp+0x1a558] Type: aC
    //     0x5203a8: ldr             x8, [x8, #0x558]
    // 0x5203ac: r3 = Null
    //     0x5203ac: add             x3, PP, #0x1a, lsl #12  ; [pp+0x1a560] Null
    //     0x5203b0: ldr             x3, [x3, #0x560]
    // 0x5203b4: r0 = DefaultTypeTest()
    //     0x5203b4: bl              #0x5523c0  ; DefaultTypeTestStub
    // 0x5203b8: ldr             x1, [fp, #0x18]
    // 0x5203bc: ldr             x2, [fp, #0x10]
    // 0x5203c0: r0 = call 0x201e74
    //     0x5203c0: bl              #0x201e74
    // 0x5203c4: LeaveFrame
    //     0x5203c4: mov             SP, fp
    //     0x5203c8: ldp             fp, lr, [SP], #0x10
    // 0x5203cc: ret
    //     0x5203cc: ret             
    // 0x5203d0: r0 = StackOverflowSharedWithoutFPURegs()
    //     0x5203d0: bl              #0x554734  ; StackOverflowSharedWithoutFPURegsStub
    // 0x5203d4: b               #0x520380
  }
  aC *(aC, double) {
    // ** addr: 0x5203f0, size: 0x50
    // 0x5203f0: EnterFrame
    //     0x5203f0: stp             fp, lr, [SP, #-0x10]!
    //     0x5203f4: mov             fp, SP
    // 0x5203f8: CheckStackOverflow
    //     0x5203f8: ldr             x16, [THR, #0x38]  ; THR::stack_limit
    //     0x5203fc: cmp             SP, x16
    //     0x520400: b.ls            #0x520420
    // 0x520404: ldr             x0, [fp, #0x10]
    // 0x520408: LoadField: d0 = r0->field_7
    //     0x520408: ldur            d0, [x0, #7]
    // 0x52040c: ldr             x1, [fp, #0x18]
    // 0x520410: r0 = call 0x201af4
    //     0x520410: bl              #0x201af4
    // 0x520414: LeaveFrame
    //     0x520414: mov             SP, fp
    //     0x520418: ldp             fp, lr, [SP], #0x10
    // 0x52041c: ret
    //     0x52041c: ret             
    // 0x520420: r0 = StackOverflowSharedWithoutFPURegs()
    //     0x520420: bl              #0x554734  ; StackOverflowSharedWithoutFPURegsStub
    // 0x520424: b               #0x520404
  }
  aC -(aC, aC) {
    // ** addr: 0x520440, size: 0x84
    // 0x520440: EnterFrame
    //     0x520440: stp             fp, lr, [SP, #-0x10]!
    //     0x520444: mov             fp, SP
    // 0x520448: CheckStackOverflow
    //     0x520448: ldr             x16, [THR, #0x38]  ; THR::stack_limit
    //     0x52044c: cmp             SP, x16
    //     0x520450: b.ls            #0x5204a4
    // 0x520454: ldr             x0, [fp, #0x10]
    // 0x520458: r2 = Null
    //     0x520458: mov             x2, NULL
    // 0x52045c: r1 = Null
    //     0x52045c: mov             x1, NULL
    // 0x520460: r4 = 59
    //     0x520460: movz            x4, #0x3b
    // 0x520464: branchIfSmi(r0, 0x520470)
    //     0x520464: tbz             w0, #0, #0x520470
    // 0x520468: r4 = LoadClassIdInstr(r0)
    //     0x520468: ldur            x4, [x0, #-1]
    //     0x52046c: ubfx            x4, x4, #0xc, #0x14
    // 0x520470: cmp             x4, #0xd4
    // 0x520474: b.eq            #0x52048c
    // 0x520478: r8 = aC
    //     0x520478: add             x8, PP, #0x1a, lsl #12  ; [pp+0x1a558] Type: aC
    //     0x52047c: ldr             x8, [x8, #0x558]
    // 0x520480: r3 = Null
    //     0x520480: add             x3, PP, #0x1a, lsl #12  ; [pp+0x1a570] Null
    //     0x520484: ldr             x3, [x3, #0x570]
    // 0x520488: r0 = DefaultTypeTest()
    //     0x520488: bl              #0x5523c0  ; DefaultTypeTestStub
    // 0x52048c: ldr             x1, [fp, #0x18]
    // 0x520490: ldr             x2, [fp, #0x10]
    // 0x520494: r0 = call 0x201b78
    //     0x520494: bl              #0x201b78
    // 0x520498: LeaveFrame
    //     0x520498: mov             SP, fp
    //     0x52049c: ldp             fp, lr, [SP], #0x10
    // 0x5204a0: ret
    //     0x5204a0: ret             
    // 0x5204a4: r0 = StackOverflowSharedWithoutFPURegs()
    //     0x5204a4: bl              #0x554734  ; StackOverflowSharedWithoutFPURegsStub
    // 0x5204a8: b               #0x520454
  }
  double [](aC, int) {
    // ** addr: 0x5204c4, size: 0x60
    // 0x5204c4: EnterFrame
    //     0x5204c4: stp             fp, lr, [SP, #-0x10]!
    //     0x5204c8: mov             fp, SP
    // 0x5204cc: ldr             x0, [fp, #0x10]
    // 0x5204d0: r2 = Null
    //     0x5204d0: mov             x2, NULL
    // 0x5204d4: r1 = Null
    //     0x5204d4: mov             x1, NULL
    // 0x5204d8: branchIfSmi(r0, 0x520500)
    //     0x5204d8: tbz             w0, #0, #0x520500
    // 0x5204dc: r4 = LoadClassIdInstr(r0)
    //     0x5204dc: ldur            x4, [x0, #-1]
    //     0x5204e0: ubfx            x4, x4, #0xc, #0x14
    // 0x5204e4: sub             x4, x4, #0x3b
    // 0x5204e8: cmp             x4, #1
    // 0x5204ec: b.ls            #0x520500
    // 0x5204f0: r8 = int
    //     0x5204f0: ldr             x8, [PP, #0xf80]  ; [pp+0xf80] Type: int
    // 0x5204f4: r3 = Null
    //     0x5204f4: add             x3, PP, #0x16, lsl #12  ; [pp+0x16b30] Null
    //     0x5204f8: ldr             x3, [x3, #0xb30]
    // 0x5204fc: r0 = int()
    //     0x5204fc: bl              #0x55b758  ; IsType_int_Stub
    // 0x520500: r0 = "Attempt to execute code removed by Dart AOT compiler (TFA)"
    //     0x520500: ldr             x0, [PP, #0x6d0]  ; [pp+0x6d0] "Attempt to execute code removed by Dart AOT compiler (TFA)"
    // 0x520504: r0 = Throw()
    //     0x520504: bl              #0x5527dc  ; ThrowStub
    // 0x520508: brk             #0
  }
}

// class id: 213, size: 0xc, field offset: 0x8
class dta extends Object
    implements Ysa {

  dta +(dta, dta) {
    // ** addr: 0x54bea8, size: 0x84
    // 0x54bea8: EnterFrame
    //     0x54bea8: stp             fp, lr, [SP, #-0x10]!
    //     0x54beac: mov             fp, SP
    // 0x54beb0: CheckStackOverflow
    //     0x54beb0: ldr             x16, [THR, #0x38]  ; THR::stack_limit
    //     0x54beb4: cmp             SP, x16
    //     0x54beb8: b.ls            #0x54bf0c
    // 0x54bebc: ldr             x0, [fp, #0x10]
    // 0x54bec0: r2 = Null
    //     0x54bec0: mov             x2, NULL
    // 0x54bec4: r1 = Null
    //     0x54bec4: mov             x1, NULL
    // 0x54bec8: r4 = 59
    //     0x54bec8: movz            x4, #0x3b
    // 0x54becc: branchIfSmi(r0, 0x54bed8)
    //     0x54becc: tbz             w0, #0, #0x54bed8
    // 0x54bed0: r4 = LoadClassIdInstr(r0)
    //     0x54bed0: ldur            x4, [x0, #-1]
    //     0x54bed4: ubfx            x4, x4, #0xc, #0x14
    // 0x54bed8: cmp             x4, #0xd5
    // 0x54bedc: b.eq            #0x54bef4
    // 0x54bee0: r8 = dta
    //     0x54bee0: add             x8, PP, #0x23, lsl #12  ; [pp+0x23d90] Type: dta
    //     0x54bee4: ldr             x8, [x8, #0xd90]
    // 0x54bee8: r3 = Null
    //     0x54bee8: add             x3, PP, #0x23, lsl #12  ; [pp+0x23d98] Null
    //     0x54beec: ldr             x3, [x3, #0xd98]
    // 0x54bef0: r0 = dta()
    //     0x54bef0: bl              #0x54c054  ; IsType_dta_Stub
    // 0x54bef4: ldr             x1, [fp, #0x18]
    // 0x54bef8: ldr             x2, [fp, #0x10]
    // 0x54befc: r0 = call 0x477408
    //     0x54befc: bl              #0x477408
    // 0x54bf00: LeaveFrame
    //     0x54bf00: mov             SP, fp
    //     0x54bf04: ldp             fp, lr, [SP], #0x10
    // 0x54bf08: ret
    //     0x54bf08: ret             
    // 0x54bf0c: r0 = StackOverflowSharedWithoutFPURegs()
    //     0x54bf0c: bl              #0x554734  ; StackOverflowSharedWithoutFPURegsStub
    // 0x54bf10: b               #0x54bebc
  }
  dta *(dta, double) {
    // ** addr: 0x54bf38, size: 0x50
    // 0x54bf38: EnterFrame
    //     0x54bf38: stp             fp, lr, [SP, #-0x10]!
    //     0x54bf3c: mov             fp, SP
    // 0x54bf40: CheckStackOverflow
    //     0x54bf40: ldr             x16, [THR, #0x38]  ; THR::stack_limit
    //     0x54bf44: cmp             SP, x16
    //     0x54bf48: b.ls            #0x54bf68
    // 0x54bf4c: ldr             x0, [fp, #0x10]
    // 0x54bf50: LoadField: d0 = r0->field_7
    //     0x54bf50: ldur            d0, [x0, #7]
    // 0x54bf54: ldr             x1, [fp, #0x18]
    // 0x54bf58: r0 = call 0x47757c
    //     0x54bf58: bl              #0x47757c
    // 0x54bf5c: LeaveFrame
    //     0x54bf5c: mov             SP, fp
    //     0x54bf60: ldp             fp, lr, [SP], #0x10
    // 0x54bf64: ret
    //     0x54bf64: ret             
    // 0x54bf68: r0 = StackOverflowSharedWithoutFPURegs()
    //     0x54bf68: bl              #0x554734  ; StackOverflowSharedWithoutFPURegsStub
    // 0x54bf6c: b               #0x54bf4c
  }
  dta -(dta, dta) {
    // ** addr: 0x54bf88, size: 0x84
    // 0x54bf88: EnterFrame
    //     0x54bf88: stp             fp, lr, [SP, #-0x10]!
    //     0x54bf8c: mov             fp, SP
    // 0x54bf90: CheckStackOverflow
    //     0x54bf90: ldr             x16, [THR, #0x38]  ; THR::stack_limit
    //     0x54bf94: cmp             SP, x16
    //     0x54bf98: b.ls            #0x54bfec
    // 0x54bf9c: ldr             x0, [fp, #0x10]
    // 0x54bfa0: r2 = Null
    //     0x54bfa0: mov             x2, NULL
    // 0x54bfa4: r1 = Null
    //     0x54bfa4: mov             x1, NULL
    // 0x54bfa8: r4 = 59
    //     0x54bfa8: movz            x4, #0x3b
    // 0x54bfac: branchIfSmi(r0, 0x54bfb8)
    //     0x54bfac: tbz             w0, #0, #0x54bfb8
    // 0x54bfb0: r4 = LoadClassIdInstr(r0)
    //     0x54bfb0: ldur            x4, [x0, #-1]
    //     0x54bfb4: ubfx            x4, x4, #0xc, #0x14
    // 0x54bfb8: cmp             x4, #0xd5
    // 0x54bfbc: b.eq            #0x54bfd4
    // 0x54bfc0: r8 = dta
    //     0x54bfc0: add             x8, PP, #0x23, lsl #12  ; [pp+0x23d90] Type: dta
    //     0x54bfc4: ldr             x8, [x8, #0xd90]
    // 0x54bfc8: r3 = Null
    //     0x54bfc8: add             x3, PP, #0x23, lsl #12  ; [pp+0x23da8] Null
    //     0x54bfcc: ldr             x3, [x3, #0xda8]
    // 0x54bfd0: r0 = dta()
    //     0x54bfd0: bl              #0x54c054  ; IsType_dta_Stub
    // 0x54bfd4: ldr             x1, [fp, #0x18]
    // 0x54bfd8: ldr             x2, [fp, #0x10]
    // 0x54bfdc: r0 = call 0x4775f4
    //     0x54bfdc: bl              #0x4775f4
    // 0x54bfe0: LeaveFrame
    //     0x54bfe0: mov             SP, fp
    //     0x54bfe4: ldp             fp, lr, [SP], #0x10
    // 0x54bfe8: ret
    //     0x54bfe8: ret             
    // 0x54bfec: r0 = StackOverflowSharedWithoutFPURegs()
    //     0x54bfec: bl              #0x554734  ; StackOverflowSharedWithoutFPURegsStub
    // 0x54bff0: b               #0x54bf9c
  }
  double [](dta, int) {
    // ** addr: 0x54c00c, size: 0x60
    // 0x54c00c: EnterFrame
    //     0x54c00c: stp             fp, lr, [SP, #-0x10]!
    //     0x54c010: mov             fp, SP
    // 0x54c014: ldr             x0, [fp, #0x10]
    // 0x54c018: r2 = Null
    //     0x54c018: mov             x2, NULL
    // 0x54c01c: r1 = Null
    //     0x54c01c: mov             x1, NULL
    // 0x54c020: branchIfSmi(r0, 0x54c048)
    //     0x54c020: tbz             w0, #0, #0x54c048
    // 0x54c024: r4 = LoadClassIdInstr(r0)
    //     0x54c024: ldur            x4, [x0, #-1]
    //     0x54c028: ubfx            x4, x4, #0xc, #0x14
    // 0x54c02c: sub             x4, x4, #0x3b
    // 0x54c030: cmp             x4, #1
    // 0x54c034: b.ls            #0x54c048
    // 0x54c038: r8 = int
    //     0x54c038: ldr             x8, [PP, #0xf80]  ; [pp+0xf80] Type: int
    // 0x54c03c: r3 = Null
    //     0x54c03c: add             x3, PP, #0x23, lsl #12  ; [pp+0x23d80] Null
    //     0x54c040: ldr             x3, [x3, #0xd80]
    // 0x54c044: r0 = int()
    //     0x54c044: bl              #0x55b758  ; IsType_int_Stub
    // 0x54c048: r0 = "Attempt to execute code removed by Dart AOT compiler (TFA)"
    //     0x54c048: ldr             x0, [PP, #0x6d0]  ; [pp+0x6d0] "Attempt to execute code removed by Dart AOT compiler (TFA)"
    // 0x54c04c: r0 = Throw()
    //     0x54c04c: bl              #0x5527dc  ; ThrowStub
    // 0x54c050: brk             #0
  }
}

// class id: 214, size: 0x8, field offset: 0x8
abstract class Ysa extends Object {
}

// class id: 215, size: 0xc, field offset: 0x8
class cta extends Object {

  cta *(cta, cta) {
    // ** addr: 0x5472e0, size: 0x84
    // 0x5472e0: EnterFrame
    //     0x5472e0: stp             fp, lr, [SP, #-0x10]!
    //     0x5472e4: mov             fp, SP
    // 0x5472e8: ldr             x0, [fp, #0x10]
    // 0x5472ec: r2 = Null
    //     0x5472ec: mov             x2, NULL
    // 0x5472f0: r1 = Null
    //     0x5472f0: mov             x1, NULL
    // 0x5472f4: r4 = LoadClassIdInstr(r0)
    //     0x5472f4: ldur            x4, [x0, #-1]
    //     0x5472f8: ubfx            x4, x4, #0xc, #0x14
    // 0x5472fc: cmp             x4, #0xd7
    // 0x547300: b.eq            #0x547318
    // 0x547304: r8 = cta
    //     0x547304: add             x8, PP, #0x1e, lsl #12  ; [pp+0x1e7e0] Type: cta
    //     0x547308: ldr             x8, [x8, #0x7e0]
    // 0x54730c: r3 = Null
    //     0x54730c: add             x3, PP, #0x1e, lsl #12  ; [pp+0x1e808] Null
    //     0x547310: ldr             x3, [x3, #0x808]
    // 0x547314: r0 = DefaultTypeTest()
    //     0x547314: bl              #0x5523c0  ; DefaultTypeTestStub
    // 0x547318: ldr             x0, [fp, #0x18]
    // 0x54731c: LoadField: r1 = r0->field_7
    //     0x54731c: ldur            w1, [x0, #7]
    // 0x547320: DecompressPointer r1
    //     0x547320: add             x1, x1, HEAP, lsl #32
    // 0x547324: LoadField: r0 = r1->field_13
    //     0x547324: ldur            w0, [x1, #0x13]
    // 0x547328: r1 = LoadInt32Instr(r0)
    //     0x547328: sbfx            x1, x0, #1, #0x1f
    // 0x54732c: mov             x0, x1
    // 0x547330: r1 = 3
    //     0x547330: movz            x1, #0x3
    // 0x547334: cmp             x1, x0
    // 0x547338: b.hs            #0x547348
    // 0x54733c: r0 = "Attempt to execute code removed by Dart AOT compiler (TFA)"
    //     0x54733c: ldr             x0, [PP, #0x6d0]  ; [pp+0x6d0] "Attempt to execute code removed by Dart AOT compiler (TFA)"
    // 0x547340: r0 = Throw()
    //     0x547340: bl              #0x5527dc  ; ThrowStub
    // 0x547344: brk             #0
    // 0x547348: r0 = RangeErrorSharedWithoutFPURegs()
    //     0x547348: bl              #0x554b7c  ; RangeErrorSharedWithoutFPURegsStub
  }
  cta -(cta, cta) {
    // ** addr: 0x547364, size: 0x84
    // 0x547364: EnterFrame
    //     0x547364: stp             fp, lr, [SP, #-0x10]!
    //     0x547368: mov             fp, SP
    // 0x54736c: CheckStackOverflow
    //     0x54736c: ldr             x16, [THR, #0x38]  ; THR::stack_limit
    //     0x547370: cmp             SP, x16
    //     0x547374: b.ls            #0x5473c8
    // 0x547378: ldr             x0, [fp, #0x10]
    // 0x54737c: r2 = Null
    //     0x54737c: mov             x2, NULL
    // 0x547380: r1 = Null
    //     0x547380: mov             x1, NULL
    // 0x547384: r4 = 59
    //     0x547384: movz            x4, #0x3b
    // 0x547388: branchIfSmi(r0, 0x547394)
    //     0x547388: tbz             w0, #0, #0x547394
    // 0x54738c: r4 = LoadClassIdInstr(r0)
    //     0x54738c: ldur            x4, [x0, #-1]
    //     0x547390: ubfx            x4, x4, #0xc, #0x14
    // 0x547394: cmp             x4, #0xd7
    // 0x547398: b.eq            #0x5473b0
    // 0x54739c: r8 = cta
    //     0x54739c: add             x8, PP, #0x1e, lsl #12  ; [pp+0x1e7e0] Type: cta
    //     0x5473a0: ldr             x8, [x8, #0x7e0]
    // 0x5473a4: r3 = Null
    //     0x5473a4: add             x3, PP, #0x1e, lsl #12  ; [pp+0x1e7e8] Null
    //     0x5473a8: ldr             x3, [x3, #0x7e8]
    // 0x5473ac: r0 = DefaultTypeTest()
    //     0x5473ac: bl              #0x5523c0  ; DefaultTypeTestStub
    // 0x5473b0: ldr             x1, [fp, #0x18]
    // 0x5473b4: ldr             x2, [fp, #0x10]
    // 0x5473b8: r0 = call 0x40b4e4
    //     0x5473b8: bl              #0x40b4e4
    // 0x5473bc: LeaveFrame
    //     0x5473bc: mov             SP, fp
    //     0x5473c0: ldp             fp, lr, [SP], #0x10
    // 0x5473c4: ret
    //     0x5473c4: ret             
    // 0x5473c8: r0 = StackOverflowSharedWithoutFPURegs()
    //     0x5473c8: bl              #0x554734  ; StackOverflowSharedWithoutFPURegsStub
    // 0x5473cc: b               #0x547378
  }
  cta +(cta, cta) {
    // ** addr: 0x5473e8, size: 0x84
    // 0x5473e8: EnterFrame
    //     0x5473e8: stp             fp, lr, [SP, #-0x10]!
    //     0x5473ec: mov             fp, SP
    // 0x5473f0: CheckStackOverflow
    //     0x5473f0: ldr             x16, [THR, #0x38]  ; THR::stack_limit
    //     0x5473f4: cmp             SP, x16
    //     0x5473f8: b.ls            #0x54744c
    // 0x5473fc: ldr             x0, [fp, #0x10]
    // 0x547400: r2 = Null
    //     0x547400: mov             x2, NULL
    // 0x547404: r1 = Null
    //     0x547404: mov             x1, NULL
    // 0x547408: r4 = 59
    //     0x547408: movz            x4, #0x3b
    // 0x54740c: branchIfSmi(r0, 0x547418)
    //     0x54740c: tbz             w0, #0, #0x547418
    // 0x547410: r4 = LoadClassIdInstr(r0)
    //     0x547410: ldur            x4, [x0, #-1]
    //     0x547414: ubfx            x4, x4, #0xc, #0x14
    // 0x547418: cmp             x4, #0xd7
    // 0x54741c: b.eq            #0x547434
    // 0x547420: r8 = cta
    //     0x547420: add             x8, PP, #0x1e, lsl #12  ; [pp+0x1e7e0] Type: cta
    //     0x547424: ldr             x8, [x8, #0x7e0]
    // 0x547428: r3 = Null
    //     0x547428: add             x3, PP, #0x1e, lsl #12  ; [pp+0x1e7f8] Null
    //     0x54742c: ldr             x3, [x3, #0x7f8]
    // 0x547430: r0 = DefaultTypeTest()
    //     0x547430: bl              #0x5523c0  ; DefaultTypeTestStub
    // 0x547434: ldr             x1, [fp, #0x18]
    // 0x547438: ldr             x2, [fp, #0x10]
    // 0x54743c: r0 = call 0x40b624
    //     0x54743c: bl              #0x40b624
    // 0x547440: LeaveFrame
    //     0x547440: mov             SP, fp
    //     0x547444: ldp             fp, lr, [SP], #0x10
    // 0x547448: ret
    //     0x547448: ret             
    // 0x54744c: r0 = StackOverflowSharedWithoutFPURegs()
    //     0x54744c: bl              #0x554734  ; StackOverflowSharedWithoutFPURegsStub
    // 0x547450: b               #0x5473fc
  }
  double [](cta, int) {
    // ** addr: 0x54746c, size: 0x60
    // 0x54746c: EnterFrame
    //     0x54746c: stp             fp, lr, [SP, #-0x10]!
    //     0x547470: mov             fp, SP
    // 0x547474: ldr             x0, [fp, #0x10]
    // 0x547478: r2 = Null
    //     0x547478: mov             x2, NULL
    // 0x54747c: r1 = Null
    //     0x54747c: mov             x1, NULL
    // 0x547480: branchIfSmi(r0, 0x5474a8)
    //     0x547480: tbz             w0, #0, #0x5474a8
    // 0x547484: r4 = LoadClassIdInstr(r0)
    //     0x547484: ldur            x4, [x0, #-1]
    //     0x547488: ubfx            x4, x4, #0xc, #0x14
    // 0x54748c: sub             x4, x4, #0x3b
    // 0x547490: cmp             x4, #1
    // 0x547494: b.ls            #0x5474a8
    // 0x547498: r8 = int
    //     0x547498: ldr             x8, [PP, #0xf80]  ; [pp+0xf80] Type: int
    // 0x54749c: r3 = Null
    //     0x54749c: add             x3, PP, #0x1e, lsl #12  ; [pp+0x1e7d0] Null
    //     0x5474a0: ldr             x3, [x3, #0x7d0]
    // 0x5474a4: r0 = int()
    //     0x5474a4: bl              #0x55b758  ; IsType_int_Stub
    // 0x5474a8: r0 = "Attempt to execute code removed by Dart AOT compiler (TFA)"
    //     0x5474a8: ldr             x0, [PP, #0x6d0]  ; [pp+0x6d0] "Attempt to execute code removed by Dart AOT compiler (TFA)"
    // 0x5474ac: r0 = Throw()
    //     0x5474ac: bl              #0x5527dc  ; ThrowStub
    // 0x5474b0: brk             #0
  }
}

// class id: 216, size: 0xc, field offset: 0x8
class bta extends Object {

  bta +(bta, bta) {
    // ** addr: 0x5474d8, size: 0x84
    // 0x5474d8: EnterFrame
    //     0x5474d8: stp             fp, lr, [SP, #-0x10]!
    //     0x5474dc: mov             fp, SP
    // 0x5474e0: CheckStackOverflow
    //     0x5474e0: ldr             x16, [THR, #0x38]  ; THR::stack_limit
    //     0x5474e4: cmp             SP, x16
    //     0x5474e8: b.ls            #0x54753c
    // 0x5474ec: ldr             x0, [fp, #0x10]
    // 0x5474f0: r2 = Null
    //     0x5474f0: mov             x2, NULL
    // 0x5474f4: r1 = Null
    //     0x5474f4: mov             x1, NULL
    // 0x5474f8: r4 = 59
    //     0x5474f8: movz            x4, #0x3b
    // 0x5474fc: branchIfSmi(r0, 0x547508)
    //     0x5474fc: tbz             w0, #0, #0x547508
    // 0x547500: r4 = LoadClassIdInstr(r0)
    //     0x547500: ldur            x4, [x0, #-1]
    //     0x547504: ubfx            x4, x4, #0xc, #0x14
    // 0x547508: cmp             x4, #0xd8
    // 0x54750c: b.eq            #0x547524
    // 0x547510: r8 = bta
    //     0x547510: add             x8, PP, #0x1e, lsl #12  ; [pp+0x1e790] Type: bta
    //     0x547514: ldr             x8, [x8, #0x790]
    // 0x547518: r3 = Null
    //     0x547518: add             x3, PP, #0x1e, lsl #12  ; [pp+0x1e7a8] Null
    //     0x54751c: ldr             x3, [x3, #0x7a8]
    // 0x547520: r0 = DefaultTypeTest()
    //     0x547520: bl              #0x5523c0  ; DefaultTypeTestStub
    // 0x547524: ldr             x1, [fp, #0x18]
    // 0x547528: ldr             x2, [fp, #0x10]
    // 0x54752c: r0 = call 0x40c294
    //     0x54752c: bl              #0x40c294
    // 0x547530: LeaveFrame
    //     0x547530: mov             SP, fp
    //     0x547534: ldp             fp, lr, [SP], #0x10
    // 0x547538: ret
    //     0x547538: ret             
    // 0x54753c: r0 = StackOverflowSharedWithoutFPURegs()
    //     0x54753c: bl              #0x554734  ; StackOverflowSharedWithoutFPURegsStub
    // 0x547540: b               #0x5474ec
  }
  dynamic *(bta, dynamic) {
    // ** addr: 0x54755c, size: 0x50
    // 0x54755c: EnterFrame
    //     0x54755c: stp             fp, lr, [SP, #-0x10]!
    //     0x547560: mov             fp, SP
    // 0x547564: CheckStackOverflow
    //     0x547564: ldr             x16, [THR, #0x38]  ; THR::stack_limit
    //     0x547568: cmp             SP, x16
    //     0x54756c: b.ls            #0x54758c
    // 0x547570: ldr             x0, [fp, #0x10]
    // 0x547574: LoadField: d0 = r0->field_7
    //     0x547574: ldur            d0, [x0, #7]
    // 0x547578: ldr             x1, [fp, #0x18]
    // 0x54757c: r0 = call 0x40c6e0
    //     0x54757c: bl              #0x40c6e0
    // 0x547580: LeaveFrame
    //     0x547580: mov             SP, fp
    //     0x547584: ldp             fp, lr, [SP], #0x10
    // 0x547588: ret
    //     0x547588: ret             
    // 0x54758c: r0 = StackOverflowSharedWithoutFPURegs()
    //     0x54758c: bl              #0x554734  ; StackOverflowSharedWithoutFPURegsStub
    // 0x547590: b               #0x547570
  }
  bta -(bta, bta) {
    // ** addr: 0x5475ac, size: 0x84
    // 0x5475ac: EnterFrame
    //     0x5475ac: stp             fp, lr, [SP, #-0x10]!
    //     0x5475b0: mov             fp, SP
    // 0x5475b4: CheckStackOverflow
    //     0x5475b4: ldr             x16, [THR, #0x38]  ; THR::stack_limit
    //     0x5475b8: cmp             SP, x16
    //     0x5475bc: b.ls            #0x547610
    // 0x5475c0: ldr             x0, [fp, #0x10]
    // 0x5475c4: r2 = Null
    //     0x5475c4: mov             x2, NULL
    // 0x5475c8: r1 = Null
    //     0x5475c8: mov             x1, NULL
    // 0x5475cc: r4 = 59
    //     0x5475cc: movz            x4, #0x3b
    // 0x5475d0: branchIfSmi(r0, 0x5475dc)
    //     0x5475d0: tbz             w0, #0, #0x5475dc
    // 0x5475d4: r4 = LoadClassIdInstr(r0)
    //     0x5475d4: ldur            x4, [x0, #-1]
    //     0x5475d8: ubfx            x4, x4, #0xc, #0x14
    // 0x5475dc: cmp             x4, #0xd8
    // 0x5475e0: b.eq            #0x5475f8
    // 0x5475e4: r8 = bta
    //     0x5475e4: add             x8, PP, #0x1e, lsl #12  ; [pp+0x1e790] Type: bta
    //     0x5475e8: ldr             x8, [x8, #0x790]
    // 0x5475ec: r3 = Null
    //     0x5475ec: add             x3, PP, #0x1e, lsl #12  ; [pp+0x1e798] Null
    //     0x5475f0: ldr             x3, [x3, #0x798]
    // 0x5475f4: r0 = DefaultTypeTest()
    //     0x5475f4: bl              #0x5523c0  ; DefaultTypeTestStub
    // 0x5475f8: ldr             x1, [fp, #0x18]
    // 0x5475fc: ldr             x2, [fp, #0x10]
    // 0x547600: r0 = call 0x40c870
    //     0x547600: bl              #0x40c870
    // 0x547604: LeaveFrame
    //     0x547604: mov             SP, fp
    //     0x547608: ldp             fp, lr, [SP], #0x10
    // 0x54760c: ret
    //     0x54760c: ret             
    // 0x547610: r0 = StackOverflowSharedWithoutFPURegs()
    //     0x547610: bl              #0x554734  ; StackOverflowSharedWithoutFPURegsStub
    // 0x547614: b               #0x5475c0
  }
  double [](bta, int) {
    // ** addr: 0x547630, size: 0x60
    // 0x547630: EnterFrame
    //     0x547630: stp             fp, lr, [SP, #-0x10]!
    //     0x547634: mov             fp, SP
    // 0x547638: ldr             x0, [fp, #0x10]
    // 0x54763c: r2 = Null
    //     0x54763c: mov             x2, NULL
    // 0x547640: r1 = Null
    //     0x547640: mov             x1, NULL
    // 0x547644: branchIfSmi(r0, 0x54766c)
    //     0x547644: tbz             w0, #0, #0x54766c
    // 0x547648: r4 = LoadClassIdInstr(r0)
    //     0x547648: ldur            x4, [x0, #-1]
    //     0x54764c: ubfx            x4, x4, #0xc, #0x14
    // 0x547650: sub             x4, x4, #0x3b
    // 0x547654: cmp             x4, #1
    // 0x547658: b.ls            #0x54766c
    // 0x54765c: r8 = int
    //     0x54765c: ldr             x8, [PP, #0xf80]  ; [pp+0xf80] Type: int
    // 0x547660: r3 = Null
    //     0x547660: add             x3, PP, #0x1e, lsl #12  ; [pp+0x1e7b8] Null
    //     0x547664: ldr             x3, [x3, #0x7b8]
    // 0x547668: r0 = int()
    //     0x547668: bl              #0x55b758  ; IsType_int_Stub
    // 0x54766c: r0 = "Attempt to execute code removed by Dart AOT compiler (TFA)"
    //     0x54766c: ldr             x0, [PP, #0x6d0]  ; [pp+0x6d0] "Attempt to execute code removed by Dart AOT compiler (TFA)"
    // 0x547670: r0 = Throw()
    //     0x547670: bl              #0x5527dc  ; ThrowStub
    // 0x547674: brk             #0
  }
}

// class id: 1161, size: 0xc, field offset: 0x8
class Hy extends Object {

  Hy +(Hy, Hy) {
    // ** addr: 0x5137a8, size: 0x84
    // 0x5137a8: EnterFrame
    //     0x5137a8: stp             fp, lr, [SP, #-0x10]!
    //     0x5137ac: mov             fp, SP
    // 0x5137b0: CheckStackOverflow
    //     0x5137b0: ldr             x16, [THR, #0x38]  ; THR::stack_limit
    //     0x5137b4: cmp             SP, x16
    //     0x5137b8: b.ls            #0x51380c
    // 0x5137bc: ldr             x0, [fp, #0x10]
    // 0x5137c0: r2 = Null
    //     0x5137c0: mov             x2, NULL
    // 0x5137c4: r1 = Null
    //     0x5137c4: mov             x1, NULL
    // 0x5137c8: r4 = 59
    //     0x5137c8: movz            x4, #0x3b
    // 0x5137cc: branchIfSmi(r0, 0x5137d8)
    //     0x5137cc: tbz             w0, #0, #0x5137d8
    // 0x5137d0: r4 = LoadClassIdInstr(r0)
    //     0x5137d0: ldur            x4, [x0, #-1]
    //     0x5137d4: ubfx            x4, x4, #0xc, #0x14
    // 0x5137d8: cmp             x4, #0x489
    // 0x5137dc: b.eq            #0x5137f4
    // 0x5137e0: r8 = Hy
    //     0x5137e0: add             x8, PP, #0x1a, lsl #12  ; [pp+0x1a100] Type: Hy
    //     0x5137e4: ldr             x8, [x8, #0x100]
    // 0x5137e8: r3 = Null
    //     0x5137e8: add             x3, PP, #0x1a, lsl #12  ; [pp+0x1a5b8] Null
    //     0x5137ec: ldr             x3, [x3, #0x5b8]
    // 0x5137f0: r0 = Hy()
    //     0x5137f0: bl              #0x513960  ; IsType_Hy_Stub
    // 0x5137f4: ldr             x1, [fp, #0x18]
    // 0x5137f8: ldr             x2, [fp, #0x10]
    // 0x5137fc: r0 = call 0x19af48
    //     0x5137fc: bl              #0x19af48
    // 0x513800: LeaveFrame
    //     0x513800: mov             SP, fp
    //     0x513804: ldp             fp, lr, [SP], #0x10
    // 0x513808: ret
    //     0x513808: ret             
    // 0x51380c: r0 = StackOverflowSharedWithoutFPURegs()
    //     0x51380c: bl              #0x554734  ; StackOverflowSharedWithoutFPURegsStub
    // 0x513810: b               #0x5137bc
  }
  dynamic *(Hy, dynamic) {
    // ** addr: 0x513838, size: 0x50
    // 0x513838: EnterFrame
    //     0x513838: stp             fp, lr, [SP, #-0x10]!
    //     0x51383c: mov             fp, SP
    // 0x513840: CheckStackOverflow
    //     0x513840: ldr             x16, [THR, #0x38]  ; THR::stack_limit
    //     0x513844: cmp             SP, x16
    //     0x513848: b.ls            #0x513868
    // 0x51384c: ldr             x0, [fp, #0x10]
    // 0x513850: LoadField: d0 = r0->field_7
    //     0x513850: ldur            d0, [x0, #7]
    // 0x513854: ldr             x1, [fp, #0x18]
    // 0x513858: r0 = call 0x19b5b0
    //     0x513858: bl              #0x19b5b0
    // 0x51385c: LeaveFrame
    //     0x51385c: mov             SP, fp
    //     0x513860: ldp             fp, lr, [SP], #0x10
    // 0x513864: ret
    //     0x513864: ret             
    // 0x513868: r0 = StackOverflowSharedWithoutFPURegs()
    //     0x513868: bl              #0x554734  ; StackOverflowSharedWithoutFPURegsStub
    // 0x51386c: b               #0x51384c
  }
  Hy -(Hy, Hy) {
    // ** addr: 0x513894, size: 0x84
    // 0x513894: EnterFrame
    //     0x513894: stp             fp, lr, [SP, #-0x10]!
    //     0x513898: mov             fp, SP
    // 0x51389c: CheckStackOverflow
    //     0x51389c: ldr             x16, [THR, #0x38]  ; THR::stack_limit
    //     0x5138a0: cmp             SP, x16
    //     0x5138a4: b.ls            #0x5138f8
    // 0x5138a8: ldr             x0, [fp, #0x10]
    // 0x5138ac: r2 = Null
    //     0x5138ac: mov             x2, NULL
    // 0x5138b0: r1 = Null
    //     0x5138b0: mov             x1, NULL
    // 0x5138b4: r4 = 59
    //     0x5138b4: movz            x4, #0x3b
    // 0x5138b8: branchIfSmi(r0, 0x5138c4)
    //     0x5138b8: tbz             w0, #0, #0x5138c4
    // 0x5138bc: r4 = LoadClassIdInstr(r0)
    //     0x5138bc: ldur            x4, [x0, #-1]
    //     0x5138c0: ubfx            x4, x4, #0xc, #0x14
    // 0x5138c4: cmp             x4, #0x489
    // 0x5138c8: b.eq            #0x5138e0
    // 0x5138cc: r8 = Hy
    //     0x5138cc: add             x8, PP, #0x1a, lsl #12  ; [pp+0x1a100] Type: Hy
    //     0x5138d0: ldr             x8, [x8, #0x100]
    // 0x5138d4: r3 = Null
    //     0x5138d4: add             x3, PP, #0x1a, lsl #12  ; [pp+0x1a5a8] Null
    //     0x5138d8: ldr             x3, [x3, #0x5a8]
    // 0x5138dc: r0 = Hy()
    //     0x5138dc: bl              #0x513960  ; IsType_Hy_Stub
    // 0x5138e0: ldr             x1, [fp, #0x18]
    // 0x5138e4: ldr             x2, [fp, #0x10]
    // 0x5138e8: r0 = call 0x19b94c
    //     0x5138e8: bl              #0x19b94c
    // 0x5138ec: LeaveFrame
    //     0x5138ec: mov             SP, fp
    //     0x5138f0: ldp             fp, lr, [SP], #0x10
    // 0x5138f4: ret
    //     0x5138f4: ret             
    // 0x5138f8: r0 = StackOverflowSharedWithoutFPURegs()
    //     0x5138f8: bl              #0x554734  ; StackOverflowSharedWithoutFPURegsStub
    // 0x5138fc: b               #0x5138a8
  }
  double [](Hy, int) {
    // ** addr: 0x513918, size: 0x60
    // 0x513918: EnterFrame
    //     0x513918: stp             fp, lr, [SP, #-0x10]!
    //     0x51391c: mov             fp, SP
    // 0x513920: ldr             x0, [fp, #0x10]
    // 0x513924: r2 = Null
    //     0x513924: mov             x2, NULL
    // 0x513928: r1 = Null
    //     0x513928: mov             x1, NULL
    // 0x51392c: branchIfSmi(r0, 0x513954)
    //     0x51392c: tbz             w0, #0, #0x513954
    // 0x513930: r4 = LoadClassIdInstr(r0)
    //     0x513930: ldur            x4, [x0, #-1]
    //     0x513934: ubfx            x4, x4, #0xc, #0x14
    // 0x513938: sub             x4, x4, #0x3b
    // 0x51393c: cmp             x4, #1
    // 0x513940: b.ls            #0x513954
    // 0x513944: r8 = int
    //     0x513944: ldr             x8, [PP, #0xf80]  ; [pp+0xf80] Type: int
    // 0x513948: r3 = Null
    //     0x513948: add             x3, PP, #0x16, lsl #12  ; [pp+0x16b50] Null
    //     0x51394c: ldr             x3, [x3, #0xb50]
    // 0x513950: r0 = int()
    //     0x513950: bl              #0x55b758  ; IsType_int_Stub
    // 0x513954: r0 = "Attempt to execute code removed by Dart AOT compiler (TFA)"
    //     0x513954: ldr             x0, [PP, #0x6d0]  ; [pp+0x6d0] "Attempt to execute code removed by Dart AOT compiler (TFA)"
    // 0x513958: r0 = Throw()
    //     0x513958: bl              #0x5527dc  ; ThrowStub
    // 0x51395c: brk             #0
  }
}
