// lib: , url: dZf

// class id: 1048663, size: 0x8
class :: {

  [closure] static void <anonymous closure>(dynamic, List<int>) {
    // ** addr: 0x54b100, size: 0x198
    // 0x54b100: EnterFrame
    //     0x54b100: stp             fp, lr, [SP, #-0x10]!
    //     0x54b104: mov             fp, SP
    // 0x54b108: AllocStack(0x58)
    //     0x54b108: sub             SP, SP, #0x58
    // 0x54b10c: SetupParameters([dynamic _ /* r0 */])
    //     0x54b10c: ldr             x0, [fp, #0x18]
    //     0x54b110: ldur            w3, [x0, #0x17]
    //     0x54b114: add             x3, x3, HEAP, lsl #32
    //     0x54b118: stur            x3, [fp, #-0x38]
    // 0x54b11c: CheckStackOverflow
    //     0x54b11c: ldr             x16, [THR, #0x38]  ; THR::stack_limit
    //     0x54b120: cmp             SP, x16
    //     0x54b124: b.ls            #0x54b290
    // 0x54b128: LoadField: r1 = r3->field_1b
    //     0x54b128: ldur            w1, [x3, #0x1b]
    // 0x54b12c: DecompressPointer r1
    //     0x54b12c: add             x1, x1, HEAP, lsl #32
    // 0x54b130: r0 = LoadClassIdInstr(r1)
    //     0x54b130: ldur            x0, [x1, #-1]
    //     0x54b134: ubfx            x0, x0, #0xc, #0x14
    // 0x54b138: ldr             x2, [fp, #0x10]
    // 0x54b13c: r0 = GDT[cid_x0 + 0x7a9]()
    //     0x54b13c: add             lr, x0, #0x7a9
    //     0x54b140: ldr             lr, [x21, lr, lsl #3]
    //     0x54b144: blr             lr
    // 0x54b148: ldur            x1, [fp, #-0x38]
    // 0x54b14c: LoadField: r2 = r1->field_23
    //     0x54b14c: ldur            w2, [x1, #0x23]
    // 0x54b150: DecompressPointer r2
    //     0x54b150: add             x2, x2, HEAP, lsl #32
    // 0x54b154: ldr             x0, [fp, #0x10]
    // 0x54b158: stur            x2, [fp, #-0x40]
    // 0x54b15c: r3 = LoadClassIdInstr(r0)
    //     0x54b15c: ldur            x3, [x0, #-1]
    //     0x54b160: ubfx            x3, x3, #0xc, #0x14
    // 0x54b164: str             x0, [SP]
    // 0x54b168: mov             x0, x3
    // 0x54b16c: r0 = GDT[cid_x0 + -0xee7]()
    //     0x54b16c: sub             lr, x0, #0xee7
    //     0x54b170: ldr             lr, [x21, lr, lsl #3]
    //     0x54b174: blr             lr
    // 0x54b178: mov             x1, x0
    // 0x54b17c: ldur            x0, [fp, #-0x40]
    // 0x54b180: r2 = LoadInt32Instr(r0)
    //     0x54b180: sbfx            x2, x0, #1, #0x1f
    //     0x54b184: tbz             w0, #0, #0x54b18c
    //     0x54b188: ldur            x2, [x0, #7]
    // 0x54b18c: r0 = LoadInt32Instr(r1)
    //     0x54b18c: sbfx            x0, x1, #1, #0x1f
    //     0x54b190: tbz             w1, #0, #0x54b198
    //     0x54b194: ldur            x0, [x1, #7]
    // 0x54b198: add             x3, x2, x0
    // 0x54b19c: r0 = BoxInt64Instr(r3)
    //     0x54b19c: sbfiz           x0, x3, #1, #0x1f
    //     0x54b1a0: cmp             x3, x0, asr #1
    //     0x54b1a4: b.eq            #0x54b1b0
    //     0x54b1a8: bl              #0x5548b4  ; AllocateMintSharedWithoutFPURegsStub
    //     0x54b1ac: stur            x3, [x0, #7]
    // 0x54b1b0: mov             x2, x0
    // 0x54b1b4: ldur            x1, [fp, #-0x38]
    // 0x54b1b8: StoreField: r1->field_23 = r0
    //     0x54b1b8: stur            w0, [x1, #0x23]
    //     0x54b1bc: tbz             w0, #0, #0x54b1d8
    //     0x54b1c0: ldurb           w16, [x1, #-1]
    //     0x54b1c4: ldurb           w17, [x0, #-1]
    //     0x54b1c8: and             x16, x17, x16, lsr #2
    //     0x54b1cc: tst             x16, HEAP, lsr #32
    //     0x54b1d0: b.eq            #0x54b1d8
    //     0x54b1d4: bl              #0x552d4c  ; WriteBarrierWrappersStub
    // 0x54b1d8: LoadField: r3 = r1->field_f
    //     0x54b1d8: ldur            w3, [x1, #0xf]
    // 0x54b1dc: DecompressPointer r3
    //     0x54b1dc: add             x3, x3, HEAP, lsl #32
    // 0x54b1e0: stur            x3, [fp, #-0x40]
    // 0x54b1e4: LoadField: r0 = r1->field_1f
    //     0x54b1e4: ldur            w0, [x1, #0x1f]
    // 0x54b1e8: DecompressPointer r0
    //     0x54b1e8: add             x0, x0, HEAP, lsl #32
    // 0x54b1ec: stp             x2, x3, [SP, #8]
    // 0x54b1f0: str             x0, [SP]
    // 0x54b1f4: mov             x0, x3
    // 0x54b1f8: ClosureCall
    //     0x54b1f8: ldr             x4, [PP, #0x270]  ; [pp+0x270] List(5) [0, 0x3, 0x3, 0x3, Null]
    //     0x54b1fc: ldur            x2, [x0, #0x1f]
    //     0x54b200: blr             x2
    // 0x54b204: r0 = Null
    //     0x54b204: mov             x0, NULL
    // 0x54b208: LeaveFrame
    //     0x54b208: mov             SP, fp
    //     0x54b20c: ldp             fp, lr, [SP], #0x10
    // 0x54b210: ret
    //     0x54b210: ret             
    // 0x54b214: sub             SP, fp, #0x58
    // 0x54b218: mov             x2, x0
    // 0x54b21c: ldur            x0, [fp, #-0x10]
    // 0x54b220: LoadField: r3 = r0->field_13
    //     0x54b220: ldur            w3, [x0, #0x13]
    // 0x54b224: DecompressPointer r3
    //     0x54b224: add             x3, x3, HEAP, lsl #32
    // 0x54b228: str             x1, [SP]
    // 0x54b22c: mov             x1, x3
    // 0x54b230: r4 = const [0, 0x3, 0x1, 0x3, null]
    //     0x54b230: ldr             x4, [PP, #0x170]  ; [pp+0x170] List(5) [0, 0x3, 0x1, 0x3, Null]
    // 0x54b234: r0 = call 0x18c7b4
    //     0x54b234: bl              #0x18c7b4
    // 0x54b238: ldur            x0, [fp, #-0x10]
    // 0x54b23c: LoadField: r1 = r0->field_27
    //     0x54b23c: ldur            w1, [x0, #0x27]
    // 0x54b240: DecompressPointer r1
    //     0x54b240: add             x1, x1, HEAP, lsl #32
    // 0x54b244: r16 = Sentinel
    //     0x54b244: ldr             x16, [PP, #0x40]  ; [pp+0x40] Sentinel
    // 0x54b248: cmp             w1, w16
    // 0x54b24c: b.ne            #0x54b260
    // 0x54b250: r16 = "Gza"
    //     0x54b250: add             x16, PP, #0xa, lsl #12  ; [pp+0xab70] "Gza"
    //     0x54b254: ldr             x16, [x16, #0xb70]
    // 0x54b258: str             x16, [SP]
    // 0x54b25c: r0 = _throwLocalNotInitialized()
    //     0x54b25c: bl              #0x197214  ; [dart:_internal] LateError::_throwLocalNotInitialized
    // 0x54b260: ldur            x0, [fp, #-0x10]
    // 0x54b264: LoadField: r1 = r0->field_27
    //     0x54b264: ldur            w1, [x0, #0x27]
    // 0x54b268: DecompressPointer r1
    //     0x54b268: add             x1, x1, HEAP, lsl #32
    // 0x54b26c: r0 = LoadClassIdInstr(r1)
    //     0x54b26c: ldur            x0, [x1, #-1]
    //     0x54b270: ubfx            x0, x0, #0xc, #0x14
    // 0x54b274: r0 = GDT[cid_x0 + -0xfef]()
    //     0x54b274: sub             lr, x0, #0xfef
    //     0x54b278: ldr             lr, [x21, lr, lsl #3]
    //     0x54b27c: blr             lr
    // 0x54b280: r0 = Null
    //     0x54b280: mov             x0, NULL
    // 0x54b284: LeaveFrame
    //     0x54b284: mov             SP, fp
    //     0x54b288: ldp             fp, lr, [SP], #0x10
    // 0x54b28c: ret
    //     0x54b28c: ret             
    // 0x54b290: r0 = StackOverflowSharedWithoutFPURegs()
    //     0x54b290: bl              #0x554734  ; StackOverflowSharedWithoutFPURegsStub
    // 0x54b294: b               #0x54b128
  }
  [closure] static void <anonymous closure>(dynamic) {
    // ** addr: 0x4509c4, size: -0x1
  }
}

// class id: 3114, size: 0x18, field offset: 0x8
class _xx extends ze {

  [closure] void add(dynamic, Object?) {
    // ** addr: 0x41cd30, size: -0x1
  }
}
