// lib: , url: fgg

// class id: 1049019, size: 0x8
class :: {
}

// class id: 2203, size: 0x58, field offset: 0x44
class qga extends zw
    implements PQ {

  [closure] void <anonymous closure>(dynamic) {
    // ** addr: 0x5214d0, size: 0x290
    // 0x5214d0: EnterFrame
    //     0x5214d0: stp             fp, lr, [SP, #-0x10]!
    //     0x5214d4: mov             fp, SP
    // 0x5214d8: AllocStack(0x68)
    //     0x5214d8: sub             SP, SP, #0x68
    // 0x5214dc: SetupParameters([dynamic _ /* r0 */])
    //     0x5214dc: ldr             x0, [fp, #0x10]
    //     0x5214e0: ldur            w3, [x0, #0x17]
    //     0x5214e4: add             x3, x3, HEAP, lsl #32
    //     0x5214e8: stur            x3, [fp, #-0x58]
    // 0x5214ec: CheckStackOverflow
    //     0x5214ec: ldr             x16, [THR, #0x38]  ; THR::stack_limit
    //     0x5214f0: cmp             SP, x16
    //     0x5214f4: b.ls            #0x521750
    // 0x5214f8: ArrayLoad: r0 = r3[0]  ; List_4
    //     0x5214f8: ldur            w0, [x3, #0x17]
    // 0x5214fc: DecompressPointer r0
    //     0x5214fc: add             x0, x0, HEAP, lsl #32
    // 0x521500: LoadField: r4 = r3->field_f
    //     0x521500: ldur            w4, [x3, #0xf]
    // 0x521504: DecompressPointer r4
    //     0x521504: add             x4, x4, HEAP, lsl #32
    // 0x521508: stur            x4, [fp, #-0x50]
    // 0x52150c: cmp             w0, NULL
    // 0x521510: b.ne            #0x521520
    // 0x521514: mov             x1, x4
    // 0x521518: r0 = Null
    //     0x521518: mov             x0, NULL
    // 0x52151c: b               #0x5215c4
    // 0x521520: LoadField: r2 = r4->field_47
    //     0x521520: ldur            w2, [x4, #0x47]
    // 0x521524: DecompressPointer r2
    //     0x521524: add             x2, x2, HEAP, lsl #32
    // 0x521528: LoadField: r0 = r3->field_13
    //     0x521528: ldur            w0, [x3, #0x13]
    // 0x52152c: DecompressPointer r0
    //     0x52152c: add             x0, x0, HEAP, lsl #32
    // 0x521530: r1 = LoadInt32Instr(r0)
    //     0x521530: sbfx            x1, x0, #1, #0x1f
    //     0x521534: tbz             w0, #0, #0x52153c
    //     0x521538: ldur            x1, [x0, #7]
    // 0x52153c: sub             x5, x1, #1
    // 0x521540: r0 = BoxInt64Instr(r5)
    //     0x521540: sbfiz           x0, x5, #1, #0x1f
    //     0x521544: cmp             x5, x0, asr #1
    //     0x521548: b.eq            #0x521554
    //     0x52154c: bl              #0x5548b4  ; AllocateMintSharedWithoutFPURegsStub
    //     0x521550: stur            x5, [x0, #7]
    // 0x521554: mov             x1, x2
    // 0x521558: mov             x2, x0
    // 0x52155c: r0 = call 0x49c190
    //     0x52155c: bl              #0x49c190
    // 0x521560: cmp             w0, NULL
    // 0x521564: b.eq            #0x521758
    // 0x521568: r1 = LoadClassIdInstr(r0)
    //     0x521568: ldur            x1, [x0, #-1]
    //     0x52156c: ubfx            x1, x1, #0xc, #0x14
    // 0x521570: mov             x16, x0
    // 0x521574: mov             x0, x1
    // 0x521578: mov             x1, x16
    // 0x52157c: r0 = GDT[cid_x0 + -0xfe7]()
    //     0x52157c: sub             lr, x0, #0xfe7
    //     0x521580: ldr             lr, [x21, lr, lsl #3]
    //     0x521584: blr             lr
    // 0x521588: mov             x3, x0
    // 0x52158c: r2 = Null
    //     0x52158c: mov             x2, NULL
    // 0x521590: r1 = Null
    //     0x521590: mov             x1, NULL
    // 0x521594: stur            x3, [fp, #-0x60]
    // 0x521598: r4 = LoadClassIdInstr(r0)
    //     0x521598: ldur            x4, [x0, #-1]
    //     0x52159c: ubfx            x4, x4, #0xc, #0x14
    // 0x5215a0: sub             x4, x4, #0x3d0
    // 0x5215a4: cmp             x4, #0x74
    // 0x5215a8: b.ls            #0x5215bc
    // 0x5215ac: r8 = sv?
    //     0x5215ac: ldr             x8, [PP, #0x2bc0]  ; [pp+0x2bc0] Type: sv?
    // 0x5215b0: r3 = Null
    //     0x5215b0: add             x3, PP, #0x1b, lsl #12  ; [pp+0x1bd10] Null
    //     0x5215b4: ldr             x3, [x3, #0xd10]
    // 0x5215b8: r0 = sv?()
    //     0x5215b8: bl              #0x51a094  ; IsType_sv?_Stub
    // 0x5215bc: ldur            x0, [fp, #-0x60]
    // 0x5215c0: ldur            x1, [fp, #-0x50]
    // 0x5215c4: StoreField: r1->field_4b = r0
    //     0x5215c4: stur            w0, [x1, #0x4b]
    //     0x5215c8: ldurb           w16, [x1, #-1]
    //     0x5215cc: ldurb           w17, [x0, #-1]
    //     0x5215d0: and             x16, x17, x16, lsr #2
    //     0x5215d4: tst             x16, HEAP, lsr #32
    //     0x5215d8: b.eq            #0x5215e0
    //     0x5215dc: bl              #0x552d4c  ; WriteBarrierWrappersStub
    // 0x5215e0: ldur            x3, [fp, #-0x58]
    // 0x5215e4: LoadField: r4 = r3->field_f
    //     0x5215e4: ldur            w4, [x3, #0xf]
    // 0x5215e8: DecompressPointer r4
    //     0x5215e8: add             x4, x4, HEAP, lsl #32
    // 0x5215ec: stur            x4, [fp, #-0x60]
    // 0x5215f0: ArrayLoad: r5 = r4[0]  ; List_4
    //     0x5215f0: ldur            w5, [x4, #0x17]
    // 0x5215f4: DecompressPointer r5
    //     0x5215f4: add             x5, x5, HEAP, lsl #32
    // 0x5215f8: stur            x5, [fp, #-0x50]
    // 0x5215fc: cmp             w5, NULL
    // 0x521600: b.eq            #0x52175c
    // 0x521604: mov             x0, x5
    // 0x521608: r2 = Null
    //     0x521608: mov             x2, NULL
    // 0x52160c: r1 = Null
    //     0x52160c: mov             x1, NULL
    // 0x521610: r4 = LoadClassIdInstr(r0)
    //     0x521610: ldur            x4, [x0, #-1]
    //     0x521614: ubfx            x4, x4, #0xc, #0x14
    // 0x521618: sub             x4, x4, #0x8b6
    // 0x52161c: cmp             x4, #5
    // 0x521620: b.ls            #0x521638
    // 0x521624: r8 = lga
    //     0x521624: add             x8, PP, #0x1b, lsl #12  ; [pp+0x1bd20] Type: lga
    //     0x521628: ldr             x8, [x8, #0xd20]
    // 0x52162c: r3 = Null
    //     0x52162c: add             x3, PP, #0x1b, lsl #12  ; [pp+0x1bd28] Null
    //     0x521630: ldr             x3, [x3, #0xd28]
    // 0x521634: r0 = DefaultTypeTest()
    //     0x521634: bl              #0x5523c0  ; DefaultTypeTestStub
    // 0x521638: ldur            x3, [fp, #-0x58]
    // 0x52163c: LoadField: r1 = r3->field_13
    //     0x52163c: ldur            w1, [x3, #0x13]
    // 0x521640: DecompressPointer r1
    //     0x521640: add             x1, x1, HEAP, lsl #32
    // 0x521644: mov             x0, x1
    // 0x521648: ldur            x4, [fp, #-0x60]
    // 0x52164c: StoreField: r4->field_4f = r0
    //     0x52164c: stur            w0, [x4, #0x4f]
    //     0x521650: tbz             w0, #0, #0x52166c
    //     0x521654: ldurb           w16, [x4, #-1]
    //     0x521658: ldurb           w17, [x0, #-1]
    //     0x52165c: and             x16, x17, x16, lsr #2
    //     0x521660: tst             x16, HEAP, lsr #32
    //     0x521664: b.eq            #0x52166c
    //     0x521668: bl              #0x552dac  ; WriteBarrierWrappersStub
    // 0x52166c: LoadField: r0 = r4->field_47
    //     0x52166c: ldur            w0, [x4, #0x47]
    // 0x521670: DecompressPointer r0
    //     0x521670: add             x0, x0, HEAP, lsl #32
    // 0x521674: mov             x2, x1
    // 0x521678: mov             x1, x0
    // 0x52167c: r0 = call 0x49c190
    //     0x52167c: bl              #0x49c190
    // 0x521680: mov             x4, x0
    // 0x521684: ldur            x0, [fp, #-0x58]
    // 0x521688: stur            x4, [fp, #-0x68]
    // 0x52168c: LoadField: r1 = r0->field_f
    //     0x52168c: ldur            w1, [x0, #0xf]
    // 0x521690: DecompressPointer r1
    //     0x521690: add             x1, x1, HEAP, lsl #32
    // 0x521694: LoadField: r2 = r0->field_13
    //     0x521694: ldur            w2, [x0, #0x13]
    // 0x521698: DecompressPointer r2
    //     0x521698: add             x2, x2, HEAP, lsl #32
    // 0x52169c: r3 = LoadInt32Instr(r2)
    //     0x52169c: sbfx            x3, x2, #1, #0x1f
    //     0x5216a0: tbz             w2, #0, #0x5216a8
    //     0x5216a4: ldur            x3, [x2, #7]
    // 0x5216a8: mov             x2, x3
    // 0x5216ac: ldur            x3, [fp, #-0x50]
    // 0x5216b0: r0 = call 0x214d04
    //     0x5216b0: bl              #0x214d04
    // 0x5216b4: mov             x1, x0
    // 0x5216b8: ldur            x0, [fp, #-0x58]
    // 0x5216bc: LoadField: r5 = r0->field_13
    //     0x5216bc: ldur            w5, [x0, #0x13]
    // 0x5216c0: DecompressPointer r5
    //     0x5216c0: add             x5, x5, HEAP, lsl #32
    // 0x5216c4: mov             x3, x1
    // 0x5216c8: ldur            x1, [fp, #-0x60]
    // 0x5216cc: ldur            x2, [fp, #-0x68]
    // 0x5216d0: r0 = call 0x3e983c
    //     0x5216d0: bl              #0x3e983c
    // 0x5216d4: ldur            x1, [fp, #-0x58]
    // 0x5216d8: LoadField: r2 = r1->field_f
    //     0x5216d8: ldur            w2, [x1, #0xf]
    // 0x5216dc: DecompressPointer r2
    //     0x5216dc: add             x2, x2, HEAP, lsl #32
    // 0x5216e0: StoreField: r2->field_4f = rNULL
    //     0x5216e0: stur            NULL, [x2, #0x4f]
    // 0x5216e4: cmp             w0, NULL
    // 0x5216e8: b.eq            #0x52170c
    // 0x5216ec: LoadField: r3 = r2->field_47
    //     0x5216ec: ldur            w3, [x2, #0x47]
    // 0x5216f0: DecompressPointer r3
    //     0x5216f0: add             x3, x3, HEAP, lsl #32
    // 0x5216f4: LoadField: r2 = r1->field_13
    //     0x5216f4: ldur            w2, [x1, #0x13]
    // 0x5216f8: DecompressPointer r2
    //     0x5216f8: add             x2, x2, HEAP, lsl #32
    // 0x5216fc: mov             x1, x3
    // 0x521700: mov             x3, x0
    // 0x521704: r0 = call 0x48c2e0
    //     0x521704: bl              #0x48c2e0
    // 0x521708: b               #0x521724
    // 0x52170c: LoadField: r0 = r2->field_47
    //     0x52170c: ldur            w0, [x2, #0x47]
    // 0x521710: DecompressPointer r0
    //     0x521710: add             x0, x0, HEAP, lsl #32
    // 0x521714: LoadField: r2 = r1->field_13
    //     0x521714: ldur            w2, [x1, #0x13]
    // 0x521718: DecompressPointer r2
    //     0x521718: add             x2, x2, HEAP, lsl #32
    // 0x52171c: mov             x1, x0
    // 0x521720: r0 = call 0x48b9b8
    //     0x521720: bl              #0x48b9b8
    // 0x521724: r0 = Null
    //     0x521724: mov             x0, NULL
    // 0x521728: LeaveFrame
    //     0x521728: mov             SP, fp
    //     0x52172c: ldp             fp, lr, [SP], #0x10
    // 0x521730: ret
    //     0x521730: ret             
    // 0x521734: sub             SP, fp, #0x68
    // 0x521738: ldur            x2, [fp, #-0x10]
    // 0x52173c: LoadField: r3 = r2->field_f
    //     0x52173c: ldur            w3, [x2, #0xf]
    // 0x521740: DecompressPointer r3
    //     0x521740: add             x3, x3, HEAP, lsl #32
    // 0x521744: StoreField: r3->field_4f = rNULL
    //     0x521744: stur            NULL, [x3, #0x4f]
    // 0x521748: r0 = ReThrow()
    //     0x521748: bl              #0x5527b0  ; ReThrowStub
    // 0x52174c: brk             #0
    // 0x521750: r0 = StackOverflowSharedWithoutFPURegs()
    //     0x521750: bl              #0x554734  ; StackOverflowSharedWithoutFPURegsStub
    // 0x521754: b               #0x5214f8
    // 0x521758: r0 = NullCastErrorSharedWithoutFPURegs()
    //     0x521758: bl              #0x554cdc  ; NullCastErrorSharedWithoutFPURegsStub
    // 0x52175c: r0 = NullCastErrorSharedWithoutFPURegs()
    //     0x52175c: bl              #0x554cdc  ; NullCastErrorSharedWithoutFPURegsStub
  }
  [closure] void <anonymous closure>(dynamic) {
    // ** addr: 0x52176c, size: 0xe0
    // 0x52176c: EnterFrame
    //     0x52176c: stp             fp, lr, [SP, #-0x10]!
    //     0x521770: mov             fp, SP
    // 0x521774: AllocStack(0x48)
    //     0x521774: sub             SP, SP, #0x48
    // 0x521778: SetupParameters([dynamic _ /* r0 */])
    //     0x521778: ldr             x0, [fp, #0x10]
    //     0x52177c: ldur            w3, [x0, #0x17]
    //     0x521780: add             x3, x3, HEAP, lsl #32
    //     0x521784: stur            x3, [fp, #-0x48]
    // 0x521788: CheckStackOverflow
    //     0x521788: ldr             x16, [THR, #0x38]  ; THR::stack_limit
    //     0x52178c: cmp             SP, x16
    //     0x521790: b.ls            #0x521844
    // 0x521794: LoadField: r4 = r3->field_f
    //     0x521794: ldur            w4, [x3, #0xf]
    // 0x521798: DecompressPointer r4
    //     0x521798: add             x4, x4, HEAP, lsl #32
    // 0x52179c: stur            x4, [fp, #-0x40]
    // 0x5217a0: LoadField: r5 = r3->field_13
    //     0x5217a0: ldur            w5, [x3, #0x13]
    // 0x5217a4: DecompressPointer r5
    //     0x5217a4: add             x5, x5, HEAP, lsl #32
    // 0x5217a8: mov             x0, x5
    // 0x5217ac: stur            x5, [fp, #-0x38]
    // 0x5217b0: StoreField: r4->field_4f = r0
    //     0x5217b0: stur            w0, [x4, #0x4f]
    //     0x5217b4: tbz             w0, #0, #0x5217d0
    //     0x5217b8: ldurb           w16, [x4, #-1]
    //     0x5217bc: ldurb           w17, [x0, #-1]
    //     0x5217c0: and             x16, x17, x16, lsr #2
    //     0x5217c4: tst             x16, HEAP, lsr #32
    //     0x5217c8: b.eq            #0x5217d0
    //     0x5217cc: bl              #0x552dac  ; WriteBarrierWrappersStub
    // 0x5217d0: LoadField: r1 = r4->field_47
    //     0x5217d0: ldur            w1, [x4, #0x47]
    // 0x5217d4: DecompressPointer r1
    //     0x5217d4: add             x1, x1, HEAP, lsl #32
    // 0x5217d8: mov             x2, x5
    // 0x5217dc: r0 = call 0x49c190
    //     0x5217dc: bl              #0x49c190
    // 0x5217e0: ldur            x1, [fp, #-0x40]
    // 0x5217e4: mov             x2, x0
    // 0x5217e8: ldur            x5, [fp, #-0x38]
    // 0x5217ec: r3 = Null
    //     0x5217ec: mov             x3, NULL
    // 0x5217f0: r0 = call 0x3e983c
    //     0x5217f0: bl              #0x3e983c
    // 0x5217f4: ldur            x0, [fp, #-0x48]
    // 0x5217f8: LoadField: r1 = r0->field_f
    //     0x5217f8: ldur            w1, [x0, #0xf]
    // 0x5217fc: DecompressPointer r1
    //     0x5217fc: add             x1, x1, HEAP, lsl #32
    // 0x521800: StoreField: r1->field_4f = rNULL
    //     0x521800: stur            NULL, [x1, #0x4f]
    // 0x521804: LoadField: r0 = r1->field_47
    //     0x521804: ldur            w0, [x1, #0x47]
    // 0x521808: DecompressPointer r0
    //     0x521808: add             x0, x0, HEAP, lsl #32
    // 0x52180c: mov             x1, x0
    // 0x521810: ldur            x2, [fp, #-0x38]
    // 0x521814: r0 = call 0x48b9b8
    //     0x521814: bl              #0x48b9b8
    // 0x521818: r0 = Null
    //     0x521818: mov             x0, NULL
    // 0x52181c: LeaveFrame
    //     0x52181c: mov             SP, fp
    //     0x521820: ldp             fp, lr, [SP], #0x10
    // 0x521824: ret
    //     0x521824: ret             
    // 0x521828: sub             SP, fp, #0x48
    // 0x52182c: ldur            x2, [fp, #-0x10]
    // 0x521830: LoadField: r3 = r2->field_f
    //     0x521830: ldur            w3, [x2, #0xf]
    // 0x521834: DecompressPointer r3
    //     0x521834: add             x3, x3, HEAP, lsl #32
    // 0x521838: StoreField: r3->field_4f = rNULL
    //     0x521838: stur            NULL, [x3, #0x4f]
    // 0x52183c: r0 = ReThrow()
    //     0x52183c: bl              #0x5527b0  ; ReThrowStub
    // 0x521840: brk             #0
    // 0x521844: r0 = StackOverflowSharedWithoutFPURegs()
    //     0x521844: bl              #0x554734  ; StackOverflowSharedWithoutFPURegsStub
    // 0x521848: b               #0x521794
  }
  [closure] void VDf(dynamic, int) {
    // ** addr: 0x3e770c, size: -0x1
  }
  [closure] YW? <anonymous closure>(dynamic) {
    // ** addr: 0x3e76b0, size: -0x1
  }
  [closure] void PNc(dynamic, sv) {
    // ** addr: 0x4acacc, size: -0x1
  }
}

// class id: 2228, size: 0xc, field offset: 0xc
//   const constructor, 
abstract class kga extends xw {
}

// class id: 2229, size: 0x10, field offset: 0xc
//   const constructor, 
abstract class lga extends kga {
}

// class id: 2232, size: 0x14, field offset: 0x10
//   const constructor, 
class pga extends lga {
}

// class id: 2235, size: 0x10, field offset: 0x10
//   const constructor, 
class mga extends lga {
}

// class id: 2334, size: 0x18, field offset: 0x14
//   const constructor, 
class rga extends hW<dynamic> {
}
