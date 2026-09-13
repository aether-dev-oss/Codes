// lib: , url: Kkg

// class id: 1049274, size: 0x8
class :: {
}

// class id: 1994, size: 0x38, field offset: 0x14
class _Bpa extends Xu<dynamic> {

  late double tpe; // offset: 0x18

  [closure] Null <anonymous closure>(dynamic, bool, String) {
    // ** addr: 0x533110, size: 0x188
    // 0x533110: EnterFrame
    //     0x533110: stp             fp, lr, [SP, #-0x10]!
    //     0x533114: mov             fp, SP
    // 0x533118: AllocStack(0x58)
    //     0x533118: sub             SP, SP, #0x58
    // 0x53311c: SetupParameters([dynamic _ /* r0 */])
    //     0x53311c: ldr             x0, [fp, #0x20]
    //     0x533120: ldur            w2, [x0, #0x17]
    //     0x533124: add             x2, x2, HEAP, lsl #32
    //     0x533128: stur            x2, [fp, #-0x38]
    // 0x53312c: CheckStackOverflow
    //     0x53312c: ldr             x16, [THR, #0x38]  ; THR::stack_limit
    //     0x533130: cmp             SP, x16
    //     0x533134: b.ls            #0x53328c
    // 0x533138: ldr             x1, [fp, #0x10]
    // 0x53313c: r0 = call 0x3102f4
    //     0x53313c: bl              #0x3102f4
    // 0x533140: stur            x0, [fp, #-0x40]
    // 0x533144: r16 = "success"
    //     0x533144: add             x16, PP, #0x13, lsl #12  ; [pp+0x139f8] "success"
    //     0x533148: ldr             x16, [x16, #0x9f8]
    // 0x53314c: stp             x16, x0, [SP]
    // 0x533150: r4 = 0
    //     0x533150: movz            x4, #0
    // 0x533154: ldr             x0, [SP, #8]
    // 0x533158: r16 = UnlinkedCall_0x173c2c
    //     0x533158: add             x16, PP, #0x13, lsl #12  ; [pp+0x13a00] UnlinkedCall: 0x173c2c - SwitchableCallMissStub
    //     0x53315c: add             x16, x16, #0xa00
    // 0x533160: ldp             x5, lr, [x16]
    // 0x533164: blr             lr
    // 0x533168: r1 = 59
    //     0x533168: movz            x1, #0x3b
    // 0x53316c: branchIfSmi(r0, 0x533178)
    //     0x53316c: tbz             w0, #0, #0x533178
    // 0x533170: r1 = LoadClassIdInstr(r0)
    //     0x533170: ldur            x1, [x0, #-1]
    //     0x533174: ubfx            x1, x1, #0xc, #0x14
    // 0x533178: r16 = true
    //     0x533178: add             x16, NULL, #0x20  ; true
    // 0x53317c: stp             x16, x0, [SP]
    // 0x533180: mov             x0, x1
    // 0x533184: mov             lr, x0
    // 0x533188: ldr             lr, [x21, lr, lsl #3]
    // 0x53318c: blr             lr
    // 0x533190: tbnz            w0, #4, #0x53323c
    // 0x533194: r0 = InitLateStaticField(0xe78) // [xkg] Yoa::hne
    //     0x533194: ldr             x0, [THR, #0x68]  ; THR::field_table_values
    //     0x533198: ldr             x0, [x0, #0x1cf0]
    //     0x53319c: ldr             x16, [PP, #0x40]  ; [pp+0x40] Sentinel
    //     0x5331a0: cmp             w0, w16
    //     0x5331a4: b.ne            #0x5331b4
    //     0x5331a8: add             x2, PP, #0xd, lsl #12  ; [pp+0xd9e0] Field <Yoa.hne>: static late (offset: 0xe78)
    //     0x5331ac: ldr             x2, [x2, #0x9e0]
    //     0x5331b0: bl              #0x5526e0  ; InitLateStaticFieldStub
    // 0x5331b4: LoadField: r1 = r0->field_1f
    //     0x5331b4: ldur            w1, [x0, #0x1f]
    // 0x5331b8: DecompressPointer r1
    //     0x5331b8: add             x1, x1, HEAP, lsl #32
    // 0x5331bc: stur            x1, [fp, #-0x48]
    // 0x5331c0: cmp             w1, NULL
    // 0x5331c4: b.eq            #0x533294
    // 0x5331c8: ldur            x16, [fp, #-0x40]
    // 0x5331cc: r30 = "data"
    //     0x5331cc: ldr             lr, [PP, #0x1340]  ; [pp+0x1340] "data"
    // 0x5331d0: stp             lr, x16, [SP]
    // 0x5331d4: r4 = 0
    //     0x5331d4: movz            x4, #0
    // 0x5331d8: ldr             x0, [SP, #8]
    // 0x5331dc: r16 = UnlinkedCall_0x173c2c
    //     0x5331dc: add             x16, PP, #0x13, lsl #12  ; [pp+0x13a10] UnlinkedCall: 0x173c2c - SwitchableCallMissStub
    //     0x5331e0: add             x16, x16, #0xa10
    // 0x5331e4: ldp             x5, lr, [x16]
    // 0x5331e8: blr             lr
    // 0x5331ec: mov             x3, x0
    // 0x5331f0: r2 = Null
    //     0x5331f0: mov             x2, NULL
    // 0x5331f4: r1 = Null
    //     0x5331f4: mov             x1, NULL
    // 0x5331f8: stur            x3, [fp, #-0x40]
    // 0x5331fc: branchIfSmi(r0, 0x533224)
    //     0x5331fc: tbz             w0, #0, #0x533224
    // 0x533200: r4 = LoadClassIdInstr(r0)
    //     0x533200: ldur            x4, [x0, #-1]
    //     0x533204: ubfx            x4, x4, #0xc, #0x14
    // 0x533208: sub             x4, x4, #0x3b
    // 0x53320c: cmp             x4, #1
    // 0x533210: b.ls            #0x533224
    // 0x533214: r8 = int
    //     0x533214: ldr             x8, [PP, #0xf80]  ; [pp+0xf80] Type: int
    // 0x533218: r3 = Null
    //     0x533218: add             x3, PP, #0x13, lsl #12  ; [pp+0x13a20] Null
    //     0x53321c: ldr             x3, [x3, #0xa20]
    // 0x533220: r0 = int()
    //     0x533220: bl              #0x55b758  ; IsType_int_Stub
    // 0x533224: ldur            x0, [fp, #-0x40]
    // 0x533228: r1 = LoadInt32Instr(r0)
    //     0x533228: sbfx            x1, x0, #1, #0x1f
    //     0x53322c: tbz             w0, #0, #0x533234
    //     0x533230: ldur            x1, [x0, #7]
    // 0x533234: ldur            x0, [fp, #-0x48]
    // 0x533238: StoreField: r0->field_1b = r1
    //     0x533238: stur            x1, [x0, #0x1b]
    // 0x53323c: ldur            x2, [fp, #-0x38]
    // 0x533240: b               #0x533250
    // 0x533244: sub             SP, fp, #0x58
    // 0x533248: ldur            x0, [fp, #-0x10]
    // 0x53324c: mov             x2, x0
    // 0x533250: LoadField: r0 = r2->field_b
    //     0x533250: ldur            w0, [x2, #0xb]
    // 0x533254: DecompressPointer r0
    //     0x533254: add             x0, x0, HEAP, lsl #32
    // 0x533258: LoadField: r3 = r0->field_f
    //     0x533258: ldur            w3, [x0, #0xf]
    // 0x53325c: DecompressPointer r3
    //     0x53325c: add             x3, x3, HEAP, lsl #32
    // 0x533260: stur            x3, [fp, #-0x38]
    // 0x533264: r1 = Function '<anonymous closure>':.
    //     0x533264: add             x1, PP, #0x13, lsl #12  ; [pp+0x13a30] AnonymousClosure: (0x310338), in [Kkg] _Bpa::<anonymous closure> (0x2f8928)
    //     0x533268: ldr             x1, [x1, #0xa30]
    // 0x53326c: r0 = AllocateClosure()
    //     0x53326c: bl              #0x553954  ; AllocateClosureStub
    // 0x533270: ldur            x1, [fp, #-0x38]
    // 0x533274: mov             x2, x0
    // 0x533278: r0 = call 0x1a5b64
    //     0x533278: bl              #0x1a5b64
    // 0x53327c: r0 = Null
    //     0x53327c: mov             x0, NULL
    // 0x533280: LeaveFrame
    //     0x533280: mov             SP, fp
    //     0x533284: ldp             fp, lr, [SP], #0x10
    // 0x533288: ret
    //     0x533288: ret             
    // 0x53328c: r0 = StackOverflowSharedWithoutFPURegs()
    //     0x53328c: bl              #0x554734  ; StackOverflowSharedWithoutFPURegsStub
    // 0x533290: b               #0x533138
    // 0x533294: r0 = NullCastErrorSharedWithoutFPURegs()
    //     0x533294: bl              #0x554cdc  ; NullCastErrorSharedWithoutFPURegsStub
  }
  [closure] Future<void> <anonymous closure>(dynamic) async {
    // ** addr: 0x5332c4, size: 0x134
    // 0x5332c4: EnterFrame
    //     0x5332c4: stp             fp, lr, [SP, #-0x10]!
    //     0x5332c8: mov             fp, SP
    // 0x5332cc: AllocStack(0x18)
    //     0x5332cc: sub             SP, SP, #0x18
    // 0x5332d0: SetupParameters(_Bpa this /* r1 */)
    //     0x5332d0: stur            NULL, [fp, #-8]
    //     0x5332d4: movz            x0, #0
    //     0x5332d8: add             x1, fp, w0, sxtw #2
    //     0x5332dc: ldr             x1, [x1, #0x10]
    //     0x5332e0: ldur            w2, [x1, #0x17]
    //     0x5332e4: add             x2, x2, HEAP, lsl #32
    //     0x5332e8: stur            x2, [fp, #-0x10]
    // 0x5332ec: CheckStackOverflow
    //     0x5332ec: ldr             x16, [THR, #0x38]  ; THR::stack_limit
    //     0x5332f0: cmp             SP, x16
    //     0x5332f4: b.ls            #0x5333e8
    // 0x5332f8: InitAsync() -> Future<void?>
    //     0x5332f8: ldr             x0, [PP, #0x2f8]  ; [pp+0x2f8] TypeArguments: <void?>
    //     0x5332fc: bl              #0x519270  ; InitAsyncStub
    // 0x533300: r0 = __unknown_function__()
    //     0x533300: bl              #0x5333f8  ; [] ::__unknown_function__
    // 0x533304: mov             x1, x0
    // 0x533308: stur            x1, [fp, #-0x18]
    // 0x53330c: r0 = Await()
    //     0x53330c: bl              #0x518e60  ; AwaitStub
    // 0x533310: ldur            x0, [fp, #-0x10]
    // 0x533314: LoadField: r1 = r0->field_13
    //     0x533314: ldur            w1, [x0, #0x13]
    // 0x533318: DecompressPointer r1
    //     0x533318: add             x1, x1, HEAP, lsl #32
    // 0x53331c: stur            x1, [fp, #-0x18]
    // 0x533320: r0 = qoa()
    //     0x533320: bl              #0x52b878  ; AllocateqoaStub -> qoa (size=0x30)
    // 0x533324: mov             x1, x0
    // 0x533328: r0 = 1
    //     0x533328: movz            x0, #0x1
    // 0x53332c: StoreField: r1->field_7 = r0
    //     0x53332c: stur            x0, [x1, #7]
    // 0x533330: ldur            x0, [fp, #-0x18]
    // 0x533334: StoreField: r1->field_23 = r0
    //     0x533334: stur            w0, [x1, #0x23]
    // 0x533338: r0 = 0
    //     0x533338: movz            x0, #0
    // 0x53333c: StoreField: r1->field_f = r0
    //     0x53333c: stur            x0, [x1, #0xf]
    // 0x533340: ArrayStore: r1[0] = r0  ; List_8
    //     0x533340: stur            x0, [x1, #0x17]
    // 0x533344: ldur            x3, [fp, #-0x10]
    // 0x533348: LoadField: r2 = r3->field_f
    //     0x533348: ldur            w2, [x3, #0xf]
    // 0x53334c: DecompressPointer r2
    //     0x53334c: add             x2, x2, HEAP, lsl #32
    // 0x533350: LoadField: r4 = r2->field_b
    //     0x533350: ldur            w4, [x2, #0xb]
    // 0x533354: DecompressPointer r4
    //     0x533354: add             x4, x4, HEAP, lsl #32
    // 0x533358: cmp             w4, NULL
    // 0x53335c: b.eq            #0x5333f0
    // 0x533360: LoadField: r2 = r4->field_b
    //     0x533360: ldur            w2, [x4, #0xb]
    // 0x533364: DecompressPointer r2
    //     0x533364: add             x2, x2, HEAP, lsl #32
    // 0x533368: mov             x16, x1
    // 0x53336c: mov             x1, x2
    // 0x533370: mov             x2, x16
    // 0x533374: r0 = call 0x448aa0
    //     0x533374: bl              #0x448aa0
    // 0x533378: ldur            x0, [fp, #-0x10]
    // 0x53337c: LoadField: r1 = r0->field_13
    //     0x53337c: ldur            w1, [x0, #0x13]
    // 0x533380: DecompressPointer r1
    //     0x533380: add             x1, x1, HEAP, lsl #32
    // 0x533384: stur            x1, [fp, #-0x18]
    // 0x533388: r0 = qoa()
    //     0x533388: bl              #0x52b878  ; AllocateqoaStub -> qoa (size=0x30)
    // 0x53338c: mov             x1, x0
    // 0x533390: r0 = 7
    //     0x533390: movz            x0, #0x7
    // 0x533394: StoreField: r1->field_7 = r0
    //     0x533394: stur            x0, [x1, #7]
    // 0x533398: ldur            x0, [fp, #-0x18]
    // 0x53339c: StoreField: r1->field_23 = r0
    //     0x53339c: stur            w0, [x1, #0x23]
    // 0x5333a0: r0 = 0
    //     0x5333a0: movz            x0, #0
    // 0x5333a4: StoreField: r1->field_f = r0
    //     0x5333a4: stur            x0, [x1, #0xf]
    // 0x5333a8: ArrayStore: r1[0] = r0  ; List_8
    //     0x5333a8: stur            x0, [x1, #0x17]
    // 0x5333ac: ldur            x0, [fp, #-0x10]
    // 0x5333b0: LoadField: r2 = r0->field_f
    //     0x5333b0: ldur            w2, [x0, #0xf]
    // 0x5333b4: DecompressPointer r2
    //     0x5333b4: add             x2, x2, HEAP, lsl #32
    // 0x5333b8: LoadField: r0 = r2->field_b
    //     0x5333b8: ldur            w0, [x2, #0xb]
    // 0x5333bc: DecompressPointer r0
    //     0x5333bc: add             x0, x0, HEAP, lsl #32
    // 0x5333c0: cmp             w0, NULL
    // 0x5333c4: b.eq            #0x5333f4
    // 0x5333c8: LoadField: r2 = r0->field_b
    //     0x5333c8: ldur            w2, [x0, #0xb]
    // 0x5333cc: DecompressPointer r2
    //     0x5333cc: add             x2, x2, HEAP, lsl #32
    // 0x5333d0: mov             x16, x1
    // 0x5333d4: mov             x1, x2
    // 0x5333d8: mov             x2, x16
    // 0x5333dc: r0 = call 0x448aa0
    //     0x5333dc: bl              #0x448aa0
    // 0x5333e0: r0 = Null
    //     0x5333e0: mov             x0, NULL
    // 0x5333e4: r0 = ReturnAsyncNotFuture()
    //     0x5333e4: b               #0x519244  ; ReturnAsyncNotFutureStub
    // 0x5333e8: r0 = StackOverflowSharedWithoutFPURegs()
    //     0x5333e8: bl              #0x554734  ; StackOverflowSharedWithoutFPURegsStub
    // 0x5333ec: b               #0x5332f8
    // 0x5333f0: r0 = NullCastErrorSharedWithoutFPURegs()
    //     0x5333f0: bl              #0x554cdc  ; NullCastErrorSharedWithoutFPURegsStub
    // 0x5333f4: r0 = NullCastErrorSharedWithoutFPURegs()
    //     0x5333f4: bl              #0x554cdc  ; NullCastErrorSharedWithoutFPURegsStub
  }
  [closure] void <anonymous closure>(dynamic) {
    // ** addr: 0x310fb4, size: -0x1
  }
  [closure] void <anonymous closure>(dynamic) {
    // ** addr: 0x310e64, size: -0x1
  }
  [closure] void <anonymous closure>(dynamic) {
    // ** addr: 0x310a78, size: -0x1
  }
  [closure] void <anonymous closure>(dynamic) {
    // ** addr: 0x310720, size: -0x1
  }
  [closure] void <anonymous closure>(dynamic) {
    // ** addr: 0x310688, size: -0x1
  }
  [closure] void <anonymous closure>(dynamic) {
    // ** addr: 0x3105ac, size: -0x1
  }
  [closure] void <anonymous closure>(dynamic) {
    // ** addr: 0x3104c4, size: -0x1
  }
  [closure] void <anonymous closure>(dynamic) {
    // ** addr: 0x310910, size: -0x1
  }
  [closure] bpa <anonymous closure>(dynamic, gZ) {
    // ** addr: 0x310e58, size: -0x1
  }
  [closure] void <anonymous closure>(dynamic) {
    // ** addr: 0x2f7aac, size: -0x1
  }
  [closure] void <anonymous closure>(dynamic) {
    // ** addr: 0x3103b0, size: -0x1
  }
  [closure] void <anonymous closure>(dynamic) {
    // ** addr: 0x2f8928, size: -0x1
  }
  [closure] Null <anonymous closure>(dynamic, Uint8List?) {
    // ** addr: 0x2f8998, size: -0x1
  }
  [closure] void <anonymous closure>(dynamic) {
    // ** addr: 0x310360, size: -0x1
  }
  [closure] void <anonymous closure>(dynamic) {
    // ** addr: 0x310338, size: -0x1
  }
  [closure] void <anonymous closure>(dynamic, r) {
    // ** addr: 0x38c2cc, size: -0x1
  }
  [closure] void <anonymous closure>(dynamic) {
    // ** addr: 0x38c260, size: -0x1
  }
  [closure] void <anonymous closure>(dynamic) {
    // ** addr: 0x38c32c, size: -0x1
  }
}

// class id: 2480, size: 0x10, field offset: 0xc
//   const constructor, 
class Apa extends Vu {
}
