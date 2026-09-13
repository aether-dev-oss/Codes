// lib: , url: Xkg

// class id: 1049285, size: 0x8
class :: {
}

// class id: 1979, size: 0x1c, field offset: 0x14
//   transformed mixin,
abstract class _aqa extends Xu<dynamic>
     with Yu<X0 bound Vu> {

  [closure] void _LOb(dynamic) {
    // ** addr: 0x234768, size: -0x1
  }
}

// class id: 1980, size: 0x38, field offset: 0x1c
class _bqa extends _aqa {

  late yJ _bpe; // offset: 0x20

  [closure] Future<void> <anonymous closure>(dynamic) async {
    // ** addr: 0x535770, size: 0x10c
    // 0x535770: EnterFrame
    //     0x535770: stp             fp, lr, [SP, #-0x10]!
    //     0x535774: mov             fp, SP
    // 0x535778: AllocStack(0x30)
    //     0x535778: sub             SP, SP, #0x30
    // 0x53577c: SetupParameters(_bqa this /* r1 */)
    //     0x53577c: stur            NULL, [fp, #-8]
    //     0x535780: movz            x0, #0
    //     0x535784: add             x1, fp, w0, sxtw #2
    //     0x535788: ldr             x1, [x1, #0x10]
    //     0x53578c: ldur            w2, [x1, #0x17]
    //     0x535790: add             x2, x2, HEAP, lsl #32
    //     0x535794: stur            x2, [fp, #-0x10]
    // 0x535798: CheckStackOverflow
    //     0x535798: ldr             x16, [THR, #0x38]  ; THR::stack_limit
    //     0x53579c: cmp             SP, x16
    //     0x5357a0: b.ls            #0x535868
    // 0x5357a4: InitAsync() -> Future<void?>
    //     0x5357a4: ldr             x0, [PP, #0x2f8]  ; [pp+0x2f8] TypeArguments: <void?>
    //     0x5357a8: bl              #0x519270  ; InitAsyncStub
    // 0x5357ac: r1 = Null
    //     0x5357ac: mov             x1, NULL
    // 0x5357b0: r2 = 4
    //     0x5357b0: movz            x2, #0x4
    // 0x5357b4: r0 = AllocateArray()
    //     0x5357b4: bl              #0x55462c  ; AllocateArrayStub
    // 0x5357b8: r16 = "user_country"
    //     0x5357b8: add             x16, PP, #0x17, lsl #12  ; [pp+0x17e30] "user_country"
    //     0x5357bc: ldr             x16, [x16, #0xe30]
    // 0x5357c0: StoreField: r0->field_f = r16
    //     0x5357c0: stur            w16, [x0, #0xf]
    // 0x5357c4: ldur            x2, [fp, #-0x10]
    // 0x5357c8: LoadField: r1 = r2->field_f
    //     0x5357c8: ldur            w1, [x2, #0xf]
    // 0x5357cc: DecompressPointer r1
    //     0x5357cc: add             x1, x1, HEAP, lsl #32
    // 0x5357d0: LoadField: r3 = r1->field_13
    //     0x5357d0: ldur            w3, [x1, #0x13]
    // 0x5357d4: DecompressPointer r3
    //     0x5357d4: add             x3, x3, HEAP, lsl #32
    // 0x5357d8: StoreField: r0->field_13 = r3
    //     0x5357d8: stur            w3, [x0, #0x13]
    // 0x5357dc: r16 = <String, String>
    //     0x5357dc: add             x16, PP, #0xa, lsl #12  ; [pp+0xa438] TypeArguments: <String, String>
    //     0x5357e0: ldr             x16, [x16, #0x438]
    // 0x5357e4: stp             x0, x16, [SP]
    // 0x5357e8: r0 = Map._fromLiteral()
    //     0x5357e8: bl              #0x189e5c  ; [dart:core] Map::Map._fromLiteral
    // 0x5357ec: mov             x1, x0
    // 0x5357f0: r0 = __unknown_function__()
    //     0x5357f0: bl              #0x52c38c  ; [] ::__unknown_function__
    // 0x5357f4: mov             x1, x0
    // 0x5357f8: stur            x1, [fp, #-0x18]
    // 0x5357fc: r0 = Await()
    //     0x5357fc: bl              #0x518e60  ; AwaitStub
    // 0x535800: ldur            x2, [fp, #-0x10]
    // 0x535804: LoadField: r0 = r2->field_b
    //     0x535804: ldur            w0, [x2, #0xb]
    // 0x535808: DecompressPointer r0
    //     0x535808: add             x0, x0, HEAP, lsl #32
    // 0x53580c: stur            x0, [fp, #-0x20]
    // 0x535810: LoadField: r3 = r0->field_f
    //     0x535810: ldur            w3, [x0, #0xf]
    // 0x535814: DecompressPointer r3
    //     0x535814: add             x3, x3, HEAP, lsl #32
    // 0x535818: stur            x3, [fp, #-0x18]
    // 0x53581c: r1 = Function '<anonymous closure>':.
    //     0x53581c: add             x1, PP, #0x17, lsl #12  ; [pp+0x17e38] AnonymousClosure: (0x32f260), in [Xkg] _bqa::<anonymous closure> (0x32e498)
    //     0x535820: ldr             x1, [x1, #0xe38]
    // 0x535824: r0 = AllocateClosure()
    //     0x535824: bl              #0x553954  ; AllocateClosureStub
    // 0x535828: ldur            x1, [fp, #-0x18]
    // 0x53582c: mov             x2, x0
    // 0x535830: r0 = call 0x1a5b64
    //     0x535830: bl              #0x1a5b64
    // 0x535834: ldur            x0, [fp, #-0x20]
    // 0x535838: LoadField: r1 = r0->field_f
    //     0x535838: ldur            w1, [x0, #0xf]
    // 0x53583c: DecompressPointer r1
    //     0x53583c: add             x1, x1, HEAP, lsl #32
    // 0x535840: LoadField: r0 = r1->field_1f
    //     0x535840: ldur            w0, [x1, #0x1f]
    // 0x535844: DecompressPointer r0
    //     0x535844: add             x0, x0, HEAP, lsl #32
    // 0x535848: r16 = Sentinel
    //     0x535848: ldr             x16, [PP, #0x40]  ; [pp+0x40] Sentinel
    // 0x53584c: cmp             w0, w16
    // 0x535850: b.eq            #0x535870
    // 0x535854: mov             x1, x0
    // 0x535858: r2 = 1
    //     0x535858: movz            x2, #0x1
    // 0x53585c: r0 = call 0x2df408
    //     0x53585c: bl              #0x2df408
    // 0x535860: r0 = Null
    //     0x535860: mov             x0, NULL
    // 0x535864: r0 = ReturnAsyncNotFuture()
    //     0x535864: b               #0x519244  ; ReturnAsyncNotFutureStub
    // 0x535868: r0 = StackOverflowSharedWithoutFPURegs()
    //     0x535868: bl              #0x554734  ; StackOverflowSharedWithoutFPURegsStub
    // 0x53586c: b               #0x5357a4
    // 0x535870: r9 = _bpe
    //     0x535870: add             x9, PP, #0x17, lsl #12  ; [pp+0x17c60] Field <_bqa@704193377._bpe@704193377>: late (offset: 0x20)
    //     0x535874: ldr             x9, [x9, #0xc60]
    // 0x535878: r0 = LateInitializationErrorSharedWithoutFPURegs()
    //     0x535878: bl              #0x554f64  ; LateInitializationErrorSharedWithoutFPURegsStub
  }
  [closure] Future<void> <anonymous closure>(dynamic, bool) async {
    // ** addr: 0x53587c, size: 0xa4
    // 0x53587c: EnterFrame
    //     0x53587c: stp             fp, lr, [SP, #-0x10]!
    //     0x535880: mov             fp, SP
    // 0x535884: AllocStack(0x18)
    //     0x535884: sub             SP, SP, #0x18
    // 0x535888: SetupParameters(_bqa this /* r1 */, dynamic _ /* r2, fp-0x18 */)
    //     0x535888: stur            NULL, [fp, #-8]
    //     0x53588c: movz            x0, #0
    //     0x535890: add             x1, fp, w0, sxtw #2
    //     0x535894: ldr             x1, [x1, #0x18]
    //     0x535898: add             x2, fp, w0, sxtw #2
    //     0x53589c: ldr             x2, [x2, #0x10]
    //     0x5358a0: stur            x2, [fp, #-0x18]
    //     0x5358a4: ldur            w3, [x1, #0x17]
    //     0x5358a8: add             x3, x3, HEAP, lsl #32
    //     0x5358ac: stur            x3, [fp, #-0x10]
    // 0x5358b0: CheckStackOverflow
    //     0x5358b0: ldr             x16, [THR, #0x38]  ; THR::stack_limit
    //     0x5358b4: cmp             SP, x16
    //     0x5358b8: b.ls            #0x53590c
    // 0x5358bc: InitAsync() -> Future<void?>
    //     0x5358bc: ldr             x0, [PP, #0x2f8]  ; [pp+0x2f8] TypeArguments: <void?>
    //     0x5358c0: bl              #0x519270  ; InitAsyncStub
    // 0x5358c4: ldur            x0, [fp, #-0x18]
    // 0x5358c8: tbz             w0, #4, #0x535904
    // 0x5358cc: ldur            x0, [fp, #-0x10]
    // 0x5358d0: LoadField: r1 = r0->field_f
    //     0x5358d0: ldur            w1, [x0, #0xf]
    // 0x5358d4: DecompressPointer r1
    //     0x5358d4: add             x1, x1, HEAP, lsl #32
    // 0x5358d8: LoadField: r0 = r1->field_1f
    //     0x5358d8: ldur            w0, [x1, #0x1f]
    // 0x5358dc: DecompressPointer r0
    //     0x5358dc: add             x0, x0, HEAP, lsl #32
    // 0x5358e0: r16 = Sentinel
    //     0x5358e0: ldr             x16, [PP, #0x40]  ; [pp+0x40] Sentinel
    // 0x5358e4: cmp             w0, w16
    // 0x5358e8: b.eq            #0x535914
    // 0x5358ec: LoadField: r1 = r0->field_33
    //     0x5358ec: ldur            x1, [x0, #0x33]
    // 0x5358f0: cmp             x1, #0
    // 0x5358f4: b.le            #0x535904
    // 0x5358f8: sub             x2, x1, #1
    // 0x5358fc: mov             x1, x0
    // 0x535900: r0 = call 0x2df408
    //     0x535900: bl              #0x2df408
    // 0x535904: r0 = Null
    //     0x535904: mov             x0, NULL
    // 0x535908: r0 = ReturnAsyncNotFuture()
    //     0x535908: b               #0x519244  ; ReturnAsyncNotFutureStub
    // 0x53590c: r0 = StackOverflowSharedWithoutFPURegs()
    //     0x53590c: bl              #0x554734  ; StackOverflowSharedWithoutFPURegsStub
    // 0x535910: b               #0x5358bc
    // 0x535914: r9 = _bpe
    //     0x535914: add             x9, PP, #0x17, lsl #12  ; [pp+0x17c60] Field <_bqa@704193377._bpe@704193377>: late (offset: 0x20)
    //     0x535918: ldr             x9, [x9, #0xc60]
    // 0x53591c: r0 = LateInitializationErrorSharedWithoutFPURegs()
    //     0x53591c: bl              #0x554f64  ; LateInitializationErrorSharedWithoutFPURegsStub
  }
  [closure] void <anonymous closure>(dynamic) {
    // ** addr: 0x32f6c8, size: -0x1
  }
  [closure] void <anonymous closure>(dynamic) {
    // ** addr: 0x32f660, size: -0x1
  }
  [closure] void Oqe(dynamic) {
    // ** addr: 0x32c498, size: -0x1
  }
  [closure] void <anonymous closure>(dynamic) {
    // ** addr: 0x32cf18, size: -0x1
  }
  [closure] Null <anonymous closure>(dynamic, bool) {
    // ** addr: 0x32d12c, size: -0x1
  }
  [closure] void <anonymous closure>(dynamic) {
    // ** addr: 0x32c324, size: -0x1
  }
  [closure] void <anonymous closure>(dynamic) {
    // ** addr: 0x32c288, size: -0x1
  }
  [closure] void <anonymous closure>(dynamic) {
    // ** addr: 0x32c1ec, size: -0x1
  }
  [closure] void <anonymous closure>(dynamic) {
    // ** addr: 0x32c150, size: -0x1
  }
  [closure] void <anonymous closure>(dynamic) {
    // ** addr: 0x32c0b4, size: -0x1
  }
  [closure] yZ <anonymous closure>(dynamic, gZ, int) {
    // ** addr: 0x32d78c, size: -0x1
  }
  [closure] void <anonymous closure>(dynamic) {
    // ** addr: 0x32e080, size: -0x1
  }
  [closure] void <anonymous closure>(dynamic) {
    // ** addr: 0x32e124, size: -0x1
  }
  [closure] bool <anonymous closure>(dynamic, Woa) {
    // ** addr: 0x32f568, size: -0x1
  }
  [closure] yZ <anonymous closure>(dynamic, gZ, int) {
    // ** addr: 0x32e498, size: -0x1
  }
  [closure] mX <anonymous closure>(dynamic, Pa<int, Voa>) {
    // ** addr: 0x32f2e0, size: -0x1
  }
  [closure] void <anonymous closure>(dynamic) {
    // ** addr: 0x32f260, size: -0x1
  }
  [closure] Object? Kqe(dynamic, qoa) {
    // ** addr: 0x38f318, size: -0x1
  }
  [closure] Set<void> <anonymous closure>(dynamic, Xoa) {
    // ** addr: 0x38f238, size: -0x1
  }
  [closure] void <anonymous closure>(dynamic) {
    // ** addr: 0x378df8, size: -0x1
  }
  [closure] void <anonymous closure>(dynamic) {
    // ** addr: 0x38f1f0, size: -0x1
  }
}

// class id: 2470, size: 0x10, field offset: 0xc
//   const constructor, 
class Zpa extends Vu {
}
