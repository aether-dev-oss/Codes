// lib: , url: kkg

// class id: 1049248, size: 0x8
class :: {
}

// class id: 2009, size: 0x18, field offset: 0x14
class _ioa extends Xu<dynamic> {

  late final PU<LI> fxc; // offset: 0x14

  [closure] Future<Null> <anonymous closure>(dynamic, bool) async {
    // ** addr: 0x53db20, size: 0x98
    // 0x53db20: EnterFrame
    //     0x53db20: stp             fp, lr, [SP, #-0x10]!
    //     0x53db24: mov             fp, SP
    // 0x53db28: AllocStack(0x30)
    //     0x53db28: sub             SP, SP, #0x30
    // 0x53db2c: SetupParameters(_ioa this /* r1 */, dynamic _ /* r2, fp-0x18 */)
    //     0x53db2c: stur            NULL, [fp, #-8]
    //     0x53db30: movz            x0, #0
    //     0x53db34: add             x1, fp, w0, sxtw #2
    //     0x53db38: ldr             x1, [x1, #0x18]
    //     0x53db3c: add             x2, fp, w0, sxtw #2
    //     0x53db40: ldr             x2, [x2, #0x10]
    //     0x53db44: stur            x2, [fp, #-0x18]
    //     0x53db48: ldur            w3, [x1, #0x17]
    //     0x53db4c: add             x3, x3, HEAP, lsl #32
    //     0x53db50: stur            x3, [fp, #-0x10]
    // 0x53db54: CheckStackOverflow
    //     0x53db54: ldr             x16, [THR, #0x38]  ; THR::stack_limit
    //     0x53db58: cmp             SP, x16
    //     0x53db5c: b.ls            #0x53dbb0
    // 0x53db60: InitAsync() -> Future<Null?>
    //     0x53db60: ldr             x0, [PP, #0xd58]  ; [pp+0xd58] TypeArguments: <Null?>
    //     0x53db64: bl              #0x519270  ; InitAsyncStub
    // 0x53db68: ldur            x0, [fp, #-0x18]
    // 0x53db6c: tbnz            w0, #4, #0x53dba4
    // 0x53db70: r0 = __unknown_function__()
    //     0x53db70: bl              #0x53dc2c  ; [] ::__unknown_function__
    // 0x53db74: ldur            x2, [fp, #-0x10]
    // 0x53db78: r1 = Function '<anonymous closure>':.
    //     0x53db78: add             x1, PP, #0xd, lsl #12  ; [pp+0xd988] AnonymousClosure: (0x388334), in [kkg] _ioa::<anonymous closure> (0x37fe90)
    //     0x53db7c: ldr             x1, [x1, #0x988]
    // 0x53db80: stur            x0, [fp, #-0x10]
    // 0x53db84: r0 = AllocateClosure()
    //     0x53db84: bl              #0x553954  ; AllocateClosureStub
    // 0x53db88: r16 = <Null?>
    //     0x53db88: ldr             x16, [PP, #0xd58]  ; [pp+0xd58] TypeArguments: <Null?>
    // 0x53db8c: ldur            lr, [fp, #-0x10]
    // 0x53db90: stp             lr, x16, [SP, #8]
    // 0x53db94: str             x0, [SP]
    // 0x53db98: r4 = const [0x1, 0x2, 0x2, 0x2, null]
    //     0x53db98: ldr             x4, [PP, #0x58]  ; [pp+0x58] List(5) [0x1, 0x2, 0x2, 0x2, Null]
    // 0x53db9c: r0 = call 0x498258
    //     0x53db9c: bl              #0x498258
    // 0x53dba0: b               #0x53dba8
    // 0x53dba4: r0 = call 0x3882d0
    //     0x53dba4: bl              #0x3882d0
    // 0x53dba8: r0 = Null
    //     0x53dba8: mov             x0, NULL
    // 0x53dbac: r0 = ReturnAsyncNotFuture()
    //     0x53dbac: b               #0x519244  ; ReturnAsyncNotFutureStub
    // 0x53dbb0: r0 = StackOverflowSharedWithoutFPURegs()
    //     0x53dbb0: bl              #0x554734  ; StackOverflowSharedWithoutFPURegsStub
    // 0x53dbb4: b               #0x53db60
  }
  [closure] Future<Null> <anonymous closure>(dynamic, int) async {
    // ** addr: 0x53e7ac, size: 0x1c0
    // 0x53e7ac: EnterFrame
    //     0x53e7ac: stp             fp, lr, [SP, #-0x10]!
    //     0x53e7b0: mov             fp, SP
    // 0x53e7b4: AllocStack(0x48)
    //     0x53e7b4: sub             SP, SP, #0x48
    // 0x53e7b8: SetupParameters(_ioa this /* r1 */, dynamic _ /* r2, fp-0x18 */)
    //     0x53e7b8: stur            NULL, [fp, #-8]
    //     0x53e7bc: movz            x0, #0
    //     0x53e7c0: add             x1, fp, w0, sxtw #2
    //     0x53e7c4: ldr             x1, [x1, #0x18]
    //     0x53e7c8: add             x2, fp, w0, sxtw #2
    //     0x53e7cc: ldr             x2, [x2, #0x10]
    //     0x53e7d0: stur            x2, [fp, #-0x18]
    //     0x53e7d4: ldur            w3, [x1, #0x17]
    //     0x53e7d8: add             x3, x3, HEAP, lsl #32
    //     0x53e7dc: stur            x3, [fp, #-0x10]
    // 0x53e7e0: CheckStackOverflow
    //     0x53e7e0: ldr             x16, [THR, #0x38]  ; THR::stack_limit
    //     0x53e7e4: cmp             SP, x16
    //     0x53e7e8: b.ls            #0x53e95c
    // 0x53e7ec: InitAsync() -> Future<Null?>
    //     0x53e7ec: ldr             x0, [PP, #0xd58]  ; [pp+0xd58] TypeArguments: <Null?>
    //     0x53e7f0: bl              #0x519270  ; InitAsyncStub
    // 0x53e7f4: ldur            x0, [fp, #-0x18]
    // 0x53e7f8: cmp             w0, #4
    // 0x53e7fc: b.ne            #0x53e8a4
    // 0x53e800: ldur            x2, [fp, #-0x10]
    // 0x53e804: LoadField: r0 = r2->field_f
    //     0x53e804: ldur            w0, [x2, #0xf]
    // 0x53e808: DecompressPointer r0
    //     0x53e808: add             x0, x0, HEAP, lsl #32
    // 0x53e80c: LoadField: r1 = r0->field_f
    //     0x53e80c: ldur            w1, [x0, #0xf]
    // 0x53e810: DecompressPointer r1
    //     0x53e810: add             x1, x1, HEAP, lsl #32
    // 0x53e814: stur            x1, [fp, #-0x18]
    // 0x53e818: cmp             w1, NULL
    // 0x53e81c: b.eq            #0x53e964
    // 0x53e820: r16 = -2
    //     0x53e820: orr             x16, xzr, #0xfffffffffffffffe
    // 0x53e824: str             x16, [SP]
    // 0x53e828: r0 = call 0x3d0f50
    //     0x53e828: bl              #0x3d0f50
    // 0x53e82c: stur            x0, [fp, #-0x20]
    // 0x53e830: r0 = iba()
    //     0x53e830: bl              #0x528c4c  ; AllocateibaStub -> iba (size=0x10)
    // 0x53e834: mov             x3, x0
    // 0x53e838: ldur            x0, [fp, #-0x20]
    // 0x53e83c: stur            x3, [fp, #-0x28]
    // 0x53e840: StoreField: r3->field_7 = r0
    //     0x53e840: stur            w0, [x3, #7]
    // 0x53e844: ldur            x2, [fp, #-0x10]
    // 0x53e848: r1 = Function '<anonymous closure>':.
    //     0x53e848: add             x1, PP, #0xd, lsl #12  ; [pp+0xd9a0] AnonymousClosure: (0x38ae74), in [kkg] _ioa::<anonymous closure> (0x37fe90)
    //     0x53e84c: ldr             x1, [x1, #0x9a0]
    // 0x53e850: r0 = AllocateClosure()
    //     0x53e850: bl              #0x553954  ; AllocateClosureStub
    // 0x53e854: r1 = Null
    //     0x53e854: mov             x1, NULL
    // 0x53e858: stur            x0, [fp, #-0x20]
    // 0x53e85c: r0 = YG()
    //     0x53e85c: bl              #0x527498  ; AllocateYGStub -> YG<X0> (size=0x9c)
    // 0x53e860: stur            x0, [fp, #-0x30]
    // 0x53e864: ldur            x16, [fp, #-0x28]
    // 0x53e868: str             x16, [SP]
    // 0x53e86c: mov             x1, x0
    // 0x53e870: ldur            x2, [fp, #-0x20]
    // 0x53e874: r4 = const [0, 0x3, 0x1, 0x2, abc, 0x2, null]
    //     0x53e874: add             x4, PP, #0xd, lsl #12  ; [pp+0xd9a8] List(7) [0, 0x3, 0x1, 0x2, "abc", 0x2, Null]
    //     0x53e878: ldr             x4, [x4, #0x9a8]
    // 0x53e87c: r0 = call 0x29cb40
    //     0x53e87c: bl              #0x29cb40
    // 0x53e880: r16 = <dynamic, Object?>
    //     0x53e880: ldr             x16, [PP, #0x1e48]  ; [pp+0x1e48] TypeArguments: <dynamic, Object?>
    // 0x53e884: ldur            lr, [fp, #-0x18]
    // 0x53e888: stp             lr, x16, [SP, #8]
    // 0x53e88c: ldur            x16, [fp, #-0x30]
    // 0x53e890: str             x16, [SP]
    // 0x53e894: r4 = const [0x2, 0x2, 0x2, 0x2, null]
    //     0x53e894: ldr             x4, [PP, #0x7ae8]  ; [pp+0x7ae8] List(5) [0x2, 0x2, 0x2, 0x2, Null]
    // 0x53e898: r0 = call 0x38a364
    //     0x53e898: bl              #0x38a364
    // 0x53e89c: r0 = Null
    //     0x53e89c: mov             x0, NULL
    // 0x53e8a0: r0 = ReturnAsyncNotFuture()
    //     0x53e8a0: b               #0x519244  ; ReturnAsyncNotFutureStub
    // 0x53e8a4: r0 = InitLateStaticField(0xe7c) // [xkg] Yoa::tKb
    //     0x53e8a4: ldr             x0, [THR, #0x68]  ; THR::field_table_values
    //     0x53e8a8: ldr             x0, [x0, #0x1cf8]
    //     0x53e8ac: ldr             x16, [PP, #0x40]  ; [pp+0x40] Sentinel
    //     0x53e8b0: cmp             w0, w16
    //     0x53e8b4: b.ne            #0x53e8c4
    //     0x53e8b8: add             x2, PP, #0xd, lsl #12  ; [pp+0xd9b0] Field <Yoa.tKb>: static late (offset: 0xe7c)
    //     0x53e8bc: ldr             x2, [x2, #0x9b0]
    //     0x53e8c0: bl              #0x5526e0  ; InitLateStaticFieldStub
    // 0x53e8c4: LoadField: r1 = r0->field_7
    //     0x53e8c4: ldur            w1, [x0, #7]
    // 0x53e8c8: DecompressPointer r1
    //     0x53e8c8: add             x1, x1, HEAP, lsl #32
    // 0x53e8cc: tbz             w1, #4, #0x53e8d4
    // 0x53e8d0: r0 = call 0x3882d0
    //     0x53e8d0: bl              #0x3882d0
    // 0x53e8d4: ldur            x2, [fp, #-0x10]
    // 0x53e8d8: LoadField: r0 = r2->field_f
    //     0x53e8d8: ldur            w0, [x2, #0xf]
    // 0x53e8dc: DecompressPointer r0
    //     0x53e8dc: add             x0, x0, HEAP, lsl #32
    // 0x53e8e0: LoadField: r1 = r0->field_f
    //     0x53e8e0: ldur            w1, [x0, #0xf]
    // 0x53e8e4: DecompressPointer r1
    //     0x53e8e4: add             x1, x1, HEAP, lsl #32
    // 0x53e8e8: cmp             w1, NULL
    // 0x53e8ec: b.eq            #0x53e968
    // 0x53e8f0: r0 = __unknown_function__()
    //     0x53e8f0: bl              #0x53e96c  ; [] ::__unknown_function__
    // 0x53e8f4: mov             x1, x0
    // 0x53e8f8: stur            x1, [fp, #-0x18]
    // 0x53e8fc: r0 = Await()
    //     0x53e8fc: bl              #0x518e60  ; AwaitStub
    // 0x53e900: r1 = Function 'ugf':.
    //     0x53e900: add             x1, PP, #0xd, lsl #12  ; [pp+0xd9b8] AnonymousClosure: (0x53ec84), in [kkg] _ioa::<anonymous closure> (0x37fe90)
    //     0x53e904: ldr             x1, [x1, #0x9b8]
    // 0x53e908: r2 = Null
    //     0x53e908: mov             x2, NULL
    // 0x53e90c: r0 = AllocateClosure()
    //     0x53e90c: bl              #0x553954  ; AllocateClosureStub
    // 0x53e910: str             x0, [SP]
    // 0x53e914: ClosureCall
    //     0x53e914: ldr             x4, [PP, #0x2b0]  ; [pp+0x2b0] List(5) [0, 0x1, 0x1, 0x1, Null]
    //     0x53e918: ldur            x2, [x0, #0x1f]
    //     0x53e91c: blr             x2
    // 0x53e920: mov             x1, x0
    // 0x53e924: stur            x1, [fp, #-0x18]
    // 0x53e928: r0 = Await()
    //     0x53e928: bl              #0x518e60  ; AwaitStub
    // 0x53e92c: ldur            x2, [fp, #-0x10]
    // 0x53e930: LoadField: r0 = r2->field_f
    //     0x53e930: ldur            w0, [x2, #0xf]
    // 0x53e934: DecompressPointer r0
    //     0x53e934: add             x0, x0, HEAP, lsl #32
    // 0x53e938: stur            x0, [fp, #-0x18]
    // 0x53e93c: r1 = Function '<anonymous closure>':.
    //     0x53e93c: add             x1, PP, #0xd, lsl #12  ; [pp+0xd9c0] AnonymousClosure: (0x38a5d8), in [kkg] _ioa::<anonymous closure> (0x37fe90)
    //     0x53e940: ldr             x1, [x1, #0x9c0]
    // 0x53e944: r0 = AllocateClosure()
    //     0x53e944: bl              #0x553954  ; AllocateClosureStub
    // 0x53e948: ldur            x1, [fp, #-0x18]
    // 0x53e94c: mov             x2, x0
    // 0x53e950: r0 = call 0x1a5b64
    //     0x53e950: bl              #0x1a5b64
    // 0x53e954: r0 = Null
    //     0x53e954: mov             x0, NULL
    // 0x53e958: r0 = ReturnAsyncNotFuture()
    //     0x53e958: b               #0x519244  ; ReturnAsyncNotFutureStub
    // 0x53e95c: r0 = StackOverflowSharedWithoutFPURegs()
    //     0x53e95c: bl              #0x554734  ; StackOverflowSharedWithoutFPURegsStub
    // 0x53e960: b               #0x53e7ec
    // 0x53e964: r0 = NullCastErrorSharedWithoutFPURegs()
    //     0x53e964: bl              #0x554cdc  ; NullCastErrorSharedWithoutFPURegsStub
    // 0x53e968: r0 = NullCastErrorSharedWithoutFPURegs()
    //     0x53e968: bl              #0x554cdc  ; NullCastErrorSharedWithoutFPURegsStub
  }
  [closure] Future<bool> ugf(dynamic) async {
    // ** addr: 0x53ec84, size: 0x318
    // 0x53ec84: EnterFrame
    //     0x53ec84: stp             fp, lr, [SP, #-0x10]!
    //     0x53ec88: mov             fp, SP
    // 0x53ec8c: AllocStack(0x38)
    //     0x53ec8c: sub             SP, SP, #0x38
    // 0x53ec90: SetupParameters(_ioa this /* r1 */)
    //     0x53ec90: stur            NULL, [fp, #-8]
    //     0x53ec94: movz            x0, #0
    //     0x53ec98: add             x1, fp, w0, sxtw #2
    //     0x53ec9c: ldr             x1, [x1, #0x10]
    //     0x53eca0: ldur            w2, [x1, #0x17]
    //     0x53eca4: add             x2, x2, HEAP, lsl #32
    //     0x53eca8: stur            x2, [fp, #-0x10]
    // 0x53ecac: CheckStackOverflow
    //     0x53ecac: ldr             x16, [THR, #0x38]  ; THR::stack_limit
    //     0x53ecb0: cmp             SP, x16
    //     0x53ecb4: b.ls            #0x53ef78
    // 0x53ecb8: InitAsync() -> Future<bool>
    //     0x53ecb8: ldr             x0, [PP, #0x2d40]  ; [pp+0x2d40] TypeArguments: <bool>
    //     0x53ecbc: bl              #0x519270  ; InitAsyncStub
    // 0x53ecc0: r1 = 0
    //     0x53ecc0: movz            x1, #0
    // 0x53ecc4: stur            x1, [fp, #-0x18]
    // 0x53ecc8: CheckStackOverflow
    //     0x53ecc8: ldr             x16, [THR, #0x38]  ; THR::stack_limit
    //     0x53eccc: cmp             SP, x16
    //     0x53ecd0: b.ls            #0x53ef80
    // 0x53ecd4: r0 = InitLateStaticField(0xe7c) // [xkg] Yoa::tKb
    //     0x53ecd4: ldr             x0, [THR, #0x68]  ; THR::field_table_values
    //     0x53ecd8: ldr             x0, [x0, #0x1cf8]
    //     0x53ecdc: ldr             x16, [PP, #0x40]  ; [pp+0x40] Sentinel
    //     0x53ece0: cmp             w0, w16
    //     0x53ece4: b.ne            #0x53ecf4
    //     0x53ece8: add             x2, PP, #0xd, lsl #12  ; [pp+0xd9b0] Field <Yoa.tKb>: static late (offset: 0xe7c)
    //     0x53ecec: ldr             x2, [x2, #0x9b0]
    //     0x53ecf0: bl              #0x5526e0  ; InitLateStaticFieldStub
    // 0x53ecf4: LoadField: r2 = r0->field_1b
    //     0x53ecf4: ldur            w2, [x0, #0x1b]
    // 0x53ecf8: DecompressPointer r2
    //     0x53ecf8: add             x2, x2, HEAP, lsl #32
    // 0x53ecfc: LoadField: r0 = r2->field_b
    //     0x53ecfc: ldur            w0, [x2, #0xb]
    // 0x53ed00: r1 = LoadInt32Instr(r0)
    //     0x53ed00: sbfx            x1, x0, #1, #0x1f
    // 0x53ed04: ldur            x3, [fp, #-0x18]
    // 0x53ed08: cmp             x3, x1
    // 0x53ed0c: b.ge            #0x53ef70
    // 0x53ed10: r1 = LoadInt32Instr(r0)
    //     0x53ed10: sbfx            x1, x0, #1, #0x1f
    // 0x53ed14: mov             x0, x1
    // 0x53ed18: mov             x1, x3
    // 0x53ed1c: cmp             x1, x0
    // 0x53ed20: b.hs            #0x53ef88
    // 0x53ed24: LoadField: r0 = r2->field_f
    //     0x53ed24: ldur            w0, [x2, #0xf]
    // 0x53ed28: DecompressPointer r0
    //     0x53ed28: add             x0, x0, HEAP, lsl #32
    // 0x53ed2c: ArrayLoad: r2 = r0[r3]  ; Unknown_4
    //     0x53ed2c: add             x16, x0, x3, lsl #2
    //     0x53ed30: ldur            w2, [x16, #0xf]
    // 0x53ed34: DecompressPointer r2
    //     0x53ed34: add             x2, x2, HEAP, lsl #32
    // 0x53ed38: stur            x2, [fp, #-0x20]
    // 0x53ed3c: LoadField: r0 = r2->field_4b
    //     0x53ed3c: ldur            w0, [x2, #0x4b]
    // 0x53ed40: DecompressPointer r0
    //     0x53ed40: add             x0, x0, HEAP, lsl #32
    // 0x53ed44: tbz             w0, #4, #0x53ed50
    // 0x53ed48: r0 = 1
    //     0x53ed48: movz            x0, #0x1
    // 0x53ed4c: b               #0x53ef68
    // 0x53ed50: LoadField: r1 = r2->field_2f
    //     0x53ed50: ldur            w1, [x2, #0x2f]
    // 0x53ed54: DecompressPointer r1
    //     0x53ed54: add             x1, x1, HEAP, lsl #32
    // 0x53ed58: r0 = __unknown_function__()
    //     0x53ed58: bl              #0x53ef9c  ; [] ::__unknown_function__
    // 0x53ed5c: mov             x1, x0
    // 0x53ed60: stur            x1, [fp, #-0x28]
    // 0x53ed64: r0 = Await()
    //     0x53ed64: bl              #0x518e60  ; AwaitStub
    // 0x53ed68: mov             x2, x0
    // 0x53ed6c: ldur            x1, [fp, #-0x20]
    // 0x53ed70: stur            x2, [fp, #-0x28]
    // 0x53ed74: StoreField: r1->field_3f = r0
    //     0x53ed74: stur            w0, [x1, #0x3f]
    //     0x53ed78: ldurb           w16, [x1, #-1]
    //     0x53ed7c: ldurb           w17, [x0, #-1]
    //     0x53ed80: and             x16, x17, x16, lsr #2
    //     0x53ed84: tst             x16, HEAP, lsr #32
    //     0x53ed88: b.eq            #0x53ed90
    //     0x53ed8c: bl              #0x552d4c  ; WriteBarrierWrappersStub
    // 0x53ed90: LoadField: r0 = r2->field_b
    //     0x53ed90: ldur            x0, [x2, #0xb]
    // 0x53ed94: cbnz            x0, #0x53ede8
    // 0x53ed98: ldur            x3, [fp, #-0x18]
    // 0x53ed9c: r4 = 0
    //     0x53ed9c: movz            x4, #0
    // 0x53eda0: r0 = LoadStaticField(0xe7c)
    //     0x53eda0: ldr             x0, [THR, #0x68]  ; THR::field_table_values
    //     0x53eda4: ldr             x0, [x0, #0x1cf8]
    // 0x53eda8: LoadField: r2 = r0->field_1b
    //     0x53eda8: ldur            w2, [x0, #0x1b]
    // 0x53edac: DecompressPointer r2
    //     0x53edac: add             x2, x2, HEAP, lsl #32
    // 0x53edb0: LoadField: r0 = r2->field_b
    //     0x53edb0: ldur            w0, [x2, #0xb]
    // 0x53edb4: r1 = LoadInt32Instr(r0)
    //     0x53edb4: sbfx            x1, x0, #1, #0x1f
    // 0x53edb8: mov             x0, x1
    // 0x53edbc: mov             x1, x3
    // 0x53edc0: cmp             x1, x0
    // 0x53edc4: b.hs            #0x53ef8c
    // 0x53edc8: LoadField: r0 = r2->field_f
    //     0x53edc8: ldur            w0, [x2, #0xf]
    // 0x53edcc: DecompressPointer r0
    //     0x53edcc: add             x0, x0, HEAP, lsl #32
    // 0x53edd0: ArrayLoad: r1 = r0[r3]  ; Unknown_4
    //     0x53edd0: add             x16, x0, x3, lsl #2
    //     0x53edd4: ldur            w1, [x16, #0xf]
    // 0x53edd8: DecompressPointer r1
    //     0x53edd8: add             x1, x1, HEAP, lsl #32
    // 0x53eddc: StoreField: r1->field_43 = r4
    //     0x53eddc: stur            x4, [x1, #0x43]
    // 0x53ede0: r0 = 1
    //     0x53ede0: movz            x0, #0x1
    // 0x53ede4: b               #0x53ef68
    // 0x53ede8: ldur            x3, [fp, #-0x18]
    // 0x53edec: r4 = 0
    //     0x53edec: movz            x4, #0
    // 0x53edf0: LoadField: r0 = r2->field_7
    //     0x53edf0: ldur            w0, [x2, #7]
    // 0x53edf4: DecompressPointer r0
    //     0x53edf4: add             x0, x0, HEAP, lsl #32
    // 0x53edf8: tbnz            w0, #4, #0x53ee04
    // 0x53edfc: mov             x2, x3
    // 0x53ee00: b               #0x53ee38
    // 0x53ee04: ArrayLoad: r0 = r2[0]  ; List_4
    //     0x53ee04: ldur            w0, [x2, #0x17]
    // 0x53ee08: DecompressPointer r0
    //     0x53ee08: add             x0, x0, HEAP, lsl #32
    // 0x53ee0c: LoadField: r5 = r1->field_33
    //     0x53ee0c: ldur            w5, [x1, #0x33]
    // 0x53ee10: DecompressPointer r5
    //     0x53ee10: add             x5, x5, HEAP, lsl #32
    // 0x53ee14: r6 = LoadClassIdInstr(r0)
    //     0x53ee14: ldur            x6, [x0, #-1]
    //     0x53ee18: ubfx            x6, x6, #0xc, #0x14
    // 0x53ee1c: stp             x5, x0, [SP]
    // 0x53ee20: mov             x0, x6
    // 0x53ee24: mov             lr, x0
    // 0x53ee28: ldr             lr, [x21, lr, lsl #3]
    // 0x53ee2c: blr             lr
    // 0x53ee30: tbz             w0, #4, #0x53ee88
    // 0x53ee34: ldur            x2, [fp, #-0x18]
    // 0x53ee38: r3 = 3
    //     0x53ee38: movz            x3, #0x3
    // 0x53ee3c: r0 = LoadStaticField(0xe7c)
    //     0x53ee3c: ldr             x0, [THR, #0x68]  ; THR::field_table_values
    //     0x53ee40: ldr             x0, [x0, #0x1cf8]
    // 0x53ee44: LoadField: r4 = r0->field_1b
    //     0x53ee44: ldur            w4, [x0, #0x1b]
    // 0x53ee48: DecompressPointer r4
    //     0x53ee48: add             x4, x4, HEAP, lsl #32
    // 0x53ee4c: LoadField: r0 = r4->field_b
    //     0x53ee4c: ldur            w0, [x4, #0xb]
    // 0x53ee50: r1 = LoadInt32Instr(r0)
    //     0x53ee50: sbfx            x1, x0, #1, #0x1f
    // 0x53ee54: mov             x0, x1
    // 0x53ee58: mov             x1, x2
    // 0x53ee5c: cmp             x1, x0
    // 0x53ee60: b.hs            #0x53ef90
    // 0x53ee64: LoadField: r0 = r4->field_f
    //     0x53ee64: ldur            w0, [x4, #0xf]
    // 0x53ee68: DecompressPointer r0
    //     0x53ee68: add             x0, x0, HEAP, lsl #32
    // 0x53ee6c: ArrayLoad: r1 = r0[r2]  ; Unknown_4
    //     0x53ee6c: add             x16, x0, x2, lsl #2
    //     0x53ee70: ldur            w1, [x16, #0xf]
    // 0x53ee74: DecompressPointer r1
    //     0x53ee74: add             x1, x1, HEAP, lsl #32
    // 0x53ee78: StoreField: r1->field_43 = r3
    //     0x53ee78: stur            x3, [x1, #0x43]
    // 0x53ee7c: mov             x3, x2
    // 0x53ee80: r0 = 1
    //     0x53ee80: movz            x0, #0x1
    // 0x53ee84: b               #0x53ef68
    // 0x53ee88: ldur            x2, [fp, #-0x18]
    // 0x53ee8c: ldur            x1, [fp, #-0x28]
    // 0x53ee90: ldur            x0, [fp, #-0x20]
    // 0x53ee94: r3 = 3
    //     0x53ee94: movz            x3, #0x3
    // 0x53ee98: LoadField: r4 = r1->field_b
    //     0x53ee98: ldur            x4, [x1, #0xb]
    // 0x53ee9c: ArrayLoad: r1 = r0[0]  ; List_8
    //     0x53ee9c: ldur            x1, [x0, #0x17]
    // 0x53eea0: cmp             x4, x1
    // 0x53eea4: b.gt            #0x53eeb4
    // 0x53eea8: LoadField: r1 = r0->field_1f
    //     0x53eea8: ldur            x1, [x0, #0x1f]
    // 0x53eeac: cmp             x4, x1
    // 0x53eeb0: b.ge            #0x53ef04
    // 0x53eeb4: r4 = 2
    //     0x53eeb4: movz            x4, #0x2
    // 0x53eeb8: r0 = LoadStaticField(0xe7c)
    //     0x53eeb8: ldr             x0, [THR, #0x68]  ; THR::field_table_values
    //     0x53eebc: ldr             x0, [x0, #0x1cf8]
    // 0x53eec0: LoadField: r5 = r0->field_1b
    //     0x53eec0: ldur            w5, [x0, #0x1b]
    // 0x53eec4: DecompressPointer r5
    //     0x53eec4: add             x5, x5, HEAP, lsl #32
    // 0x53eec8: LoadField: r0 = r5->field_b
    //     0x53eec8: ldur            w0, [x5, #0xb]
    // 0x53eecc: r1 = LoadInt32Instr(r0)
    //     0x53eecc: sbfx            x1, x0, #1, #0x1f
    // 0x53eed0: mov             x0, x1
    // 0x53eed4: mov             x1, x2
    // 0x53eed8: cmp             x1, x0
    // 0x53eedc: b.hs            #0x53ef94
    // 0x53eee0: LoadField: r0 = r5->field_f
    //     0x53eee0: ldur            w0, [x5, #0xf]
    // 0x53eee4: DecompressPointer r0
    //     0x53eee4: add             x0, x0, HEAP, lsl #32
    // 0x53eee8: ArrayLoad: r1 = r0[r2]  ; Unknown_4
    //     0x53eee8: add             x16, x0, x2, lsl #2
    //     0x53eeec: ldur            w1, [x16, #0xf]
    // 0x53eef0: DecompressPointer r1
    //     0x53eef0: add             x1, x1, HEAP, lsl #32
    // 0x53eef4: StoreField: r1->field_43 = r4
    //     0x53eef4: stur            x4, [x1, #0x43]
    // 0x53eef8: mov             x3, x2
    // 0x53eefc: r0 = 1
    //     0x53eefc: movz            x0, #0x1
    // 0x53ef00: b               #0x53ef68
    // 0x53ef04: r4 = 2
    //     0x53ef04: movz            x4, #0x2
    // 0x53ef08: LoadField: r1 = r0->field_7
    //     0x53ef08: ldur            x1, [x0, #7]
    // 0x53ef0c: r0 = __unknown_function__()
    //     0x53ef0c: bl              #0x53380c  ; [] ::__unknown_function__
    // 0x53ef10: mov             x1, x0
    // 0x53ef14: stur            x1, [fp, #-0x20]
    // 0x53ef18: r0 = Await()
    //     0x53ef18: bl              #0x518e60  ; AwaitStub
    // 0x53ef1c: mov             x2, x0
    // 0x53ef20: r3 = LoadStaticField(0xe7c)
    //     0x53ef20: ldr             x3, [THR, #0x68]  ; THR::field_table_values
    //     0x53ef24: ldr             x3, [x3, #0x1cf8]
    // 0x53ef28: LoadField: r4 = r3->field_1b
    //     0x53ef28: ldur            w4, [x3, #0x1b]
    // 0x53ef2c: DecompressPointer r4
    //     0x53ef2c: add             x4, x4, HEAP, lsl #32
    // 0x53ef30: LoadField: r3 = r4->field_b
    //     0x53ef30: ldur            w3, [x4, #0xb]
    // 0x53ef34: r0 = LoadInt32Instr(r3)
    //     0x53ef34: sbfx            x0, x3, #1, #0x1f
    // 0x53ef38: ldur            x1, [fp, #-0x18]
    // 0x53ef3c: cmp             x1, x0
    // 0x53ef40: b.hs            #0x53ef98
    // 0x53ef44: LoadField: r1 = r4->field_f
    //     0x53ef44: ldur            w1, [x4, #0xf]
    // 0x53ef48: DecompressPointer r1
    //     0x53ef48: add             x1, x1, HEAP, lsl #32
    // 0x53ef4c: ldur            x3, [fp, #-0x18]
    // 0x53ef50: ArrayLoad: r4 = r1[r3]  ; Unknown_4
    //     0x53ef50: add             x16, x1, x3, lsl #2
    //     0x53ef54: ldur            w4, [x16, #0xf]
    // 0x53ef58: DecompressPointer r4
    //     0x53ef58: add             x4, x4, HEAP, lsl #32
    // 0x53ef5c: StoreField: r4->field_4b = r2
    //     0x53ef5c: stur            w2, [x4, #0x4b]
    // 0x53ef60: r0 = 1
    //     0x53ef60: movz            x0, #0x1
    // 0x53ef64: StoreField: r4->field_43 = r0
    //     0x53ef64: stur            x0, [x4, #0x43]
    // 0x53ef68: add             x1, x3, #1
    // 0x53ef6c: b               #0x53ecc4
    // 0x53ef70: r0 = true
    //     0x53ef70: add             x0, NULL, #0x20  ; true
    // 0x53ef74: r0 = ReturnAsyncNotFuture()
    //     0x53ef74: b               #0x519244  ; ReturnAsyncNotFutureStub
    // 0x53ef78: r0 = StackOverflowSharedWithoutFPURegs()
    //     0x53ef78: bl              #0x554734  ; StackOverflowSharedWithoutFPURegsStub
    // 0x53ef7c: b               #0x53ecb8
    // 0x53ef80: r0 = StackOverflowSharedWithoutFPURegs()
    //     0x53ef80: bl              #0x554734  ; StackOverflowSharedWithoutFPURegsStub
    // 0x53ef84: b               #0x53ecd4
    // 0x53ef88: r0 = RangeErrorSharedWithoutFPURegs()
    //     0x53ef88: bl              #0x554b7c  ; RangeErrorSharedWithoutFPURegsStub
    // 0x53ef8c: r0 = RangeErrorSharedWithoutFPURegs()
    //     0x53ef8c: bl              #0x554b7c  ; RangeErrorSharedWithoutFPURegsStub
    // 0x53ef90: r0 = RangeErrorSharedWithoutFPURegs()
    //     0x53ef90: bl              #0x554b7c  ; RangeErrorSharedWithoutFPURegsStub
    // 0x53ef94: r0 = RangeErrorSharedWithoutFPURegs()
    //     0x53ef94: bl              #0x554b7c  ; RangeErrorSharedWithoutFPURegsStub
    // 0x53ef98: r0 = RangeErrorSharedWithoutFPURegs()
    //     0x53ef98: bl              #0x554b7c  ; RangeErrorSharedWithoutFPURegsStub
  }
  [closure] Null <anonymous closure>(dynamic, void) {
    // ** addr: 0x37fe90, size: -0x1
  }
  [closure] Null <anonymous closure>(dynamic, String?) {
    // ** addr: 0x38aec0, size: -0x1
  }
  [closure] Null <anonymous closure>(dynamic, String) {
    // ** addr: 0x388334, size: -0x1
  }
  [closure] Null <anonymous closure>(dynamic, String) {
    // ** addr: 0x389374, size: -0x1
  }
  [closure] jI <anonymous closure>(dynamic, gZ) {
    // ** addr: 0x38ae74, size: -0x1
  }
  [closure] void <anonymous closure>(dynamic) {
    // ** addr: 0x38a5d8, size: -0x1
  }
  [closure] jI <anonymous closure>(dynamic, gZ) {
    // ** addr: 0x38a730, size: -0x1
  }
  [closure] Zca<dynamic> <anonymous closure>(dynamic, gZ) {
    // ** addr: 0x38a6f8, size: -0x1
  }
  [closure] void <anonymous closure>(dynamic) {
    // ** addr: 0x38af64, size: -0x1
  }
  [closure] Object? mac(dynamic, qoa) {
    // ** addr: 0x4b0010, size: -0x1
  }
  [closure] joa <anonymous closure>(dynamic, gZ) {
    // ** addr: 0x4b0688, size: -0x1
  }
  [closure] joa <anonymous closure>(dynamic, gZ) {
    // ** addr: 0x4b0638, size: -0x1
  }
  [closure] eW <anonymous closure>(dynamic, gZ) {
    // ** addr: 0x4b0504, size: -0x1
  }
  [closure] jI <anonymous closure>(dynamic, gZ) {
    // ** addr: 0x4b04a0, size: -0x1
  }
}

// class id: 2011, size: 0x18, field offset: 0x14
class _eoa extends Xu<dynamic> {

  [closure] void <anonymous closure>(dynamic, r) {
    // ** addr: 0x37fca0, size: -0x1
  }
  [closure] woa <anonymous closure>(dynamic, dynamic) {
    // ** addr: 0x37f8e4, size: -0x1
  }
}

// class id: 2396, size: 0x10, field offset: 0xc
//   const constructor, 
class joa extends ov {
}

// class id: 2492, size: 0xc, field offset: 0xc
//   const constructor, 
class hoa extends Vu {
}

// class id: 2494, size: 0x10, field offset: 0xc
//   const constructor, 
class doa extends Vu {
}
