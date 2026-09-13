// lib: , url: Ykg

// class id: 1049286, size: 0x8
class :: {
}

// class id: 1978, size: 0x14, field offset: 0x14
class _eqa extends Xu<dynamic> {

  [closure] Future<void> <anonymous closure>(dynamic) async {
    // ** addr: 0x53592c, size: 0x13c
    // 0x53592c: EnterFrame
    //     0x53592c: stp             fp, lr, [SP, #-0x10]!
    //     0x535930: mov             fp, SP
    // 0x535934: AllocStack(0x30)
    //     0x535934: sub             SP, SP, #0x30
    // 0x535938: SetupParameters(_eqa this /* r1 */)
    //     0x535938: stur            NULL, [fp, #-8]
    //     0x53593c: movz            x0, #0
    //     0x535940: add             x1, fp, w0, sxtw #2
    //     0x535944: ldr             x1, [x1, #0x10]
    //     0x535948: ldur            w2, [x1, #0x17]
    //     0x53594c: add             x2, x2, HEAP, lsl #32
    //     0x535950: stur            x2, [fp, #-0x10]
    // 0x535954: CheckStackOverflow
    //     0x535954: ldr             x16, [THR, #0x38]  ; THR::stack_limit
    //     0x535958: cmp             SP, x16
    //     0x53595c: b.ls            #0x535a60
    // 0x535960: InitAsync() -> Future<void?>
    //     0x535960: ldr             x0, [PP, #0x2f8]  ; [pp+0x2f8] TypeArguments: <void?>
    //     0x535964: bl              #0x519270  ; InitAsyncStub
    // 0x535968: ldur            x0, [fp, #-0x10]
    // 0x53596c: LoadField: r3 = r0->field_f
    //     0x53596c: ldur            w3, [x0, #0xf]
    // 0x535970: DecompressPointer r3
    //     0x535970: add             x3, x3, HEAP, lsl #32
    // 0x535974: stur            x3, [fp, #-0x18]
    // 0x535978: StoreStaticField(0xb50, r3)
    //     0x535978: ldr             x1, [THR, #0x68]  ; THR::field_table_values
    //     0x53597c: str             x3, [x1, #0x16a0]
    // 0x535980: r1 = Null
    //     0x535980: mov             x1, NULL
    // 0x535984: r2 = 4
    //     0x535984: movz            x2, #0x4
    // 0x535988: r0 = AllocateArray()
    //     0x535988: bl              #0x55462c  ; AllocateArrayStub
    // 0x53598c: mov             x1, x0
    // 0x535990: stur            x1, [fp, #-0x20]
    // 0x535994: r16 = "selected_language"
    //     0x535994: add             x16, PP, #9, lsl #12  ; [pp+0x9ff8] "selected_language"
    //     0x535998: ldr             x16, [x16, #0xff8]
    // 0x53599c: StoreField: r1->field_f = r16
    //     0x53599c: stur            w16, [x1, #0xf]
    // 0x5359a0: ldur            x0, [fp, #-0x18]
    // 0x5359a4: r2 = 59
    //     0x5359a4: movz            x2, #0x3b
    // 0x5359a8: branchIfSmi(r0, 0x5359b4)
    //     0x5359a8: tbz             w0, #0, #0x5359b4
    // 0x5359ac: r2 = LoadClassIdInstr(r0)
    //     0x5359ac: ldur            x2, [x0, #-1]
    //     0x5359b0: ubfx            x2, x2, #0xc, #0x14
    // 0x5359b4: str             x0, [SP]
    // 0x5359b8: mov             x0, x2
    // 0x5359bc: r4 = const [0, 0x1, 0x1, 0x1, null]
    //     0x5359bc: ldr             x4, [PP, #0x2b0]  ; [pp+0x2b0] List(5) [0, 0x1, 0x1, 0x1, Null]
    // 0x5359c0: r0 = GDT[cid_x0 + 0x56dd]()
    //     0x5359c0: movz            x17, #0x56dd
    //     0x5359c4: add             lr, x0, x17
    //     0x5359c8: ldr             lr, [x21, lr, lsl #3]
    //     0x5359cc: blr             lr
    // 0x5359d0: ldur            x1, [fp, #-0x20]
    // 0x5359d4: ArrayStore: r1[1] = r0  ; List_4
    //     0x5359d4: add             x25, x1, #0x13
    //     0x5359d8: str             w0, [x25]
    //     0x5359dc: tbz             w0, #0, #0x5359f8
    //     0x5359e0: ldurb           w16, [x1, #-1]
    //     0x5359e4: ldurb           w17, [x0, #-1]
    //     0x5359e8: and             x16, x17, x16, lsr #2
    //     0x5359ec: tst             x16, HEAP, lsr #32
    //     0x5359f0: b.eq            #0x5359f8
    //     0x5359f4: bl              #0x552800  ; ArrayWriteBarrierStub
    // 0x5359f8: r16 = <String, String>
    //     0x5359f8: add             x16, PP, #0xa, lsl #12  ; [pp+0xa438] TypeArguments: <String, String>
    //     0x5359fc: ldr             x16, [x16, #0x438]
    // 0x535a00: ldur            lr, [fp, #-0x20]
    // 0x535a04: stp             lr, x16, [SP]
    // 0x535a08: r0 = Map._fromLiteral()
    //     0x535a08: bl              #0x189e5c  ; [dart:core] Map::Map._fromLiteral
    // 0x535a0c: mov             x1, x0
    // 0x535a10: r0 = __unknown_function__()
    //     0x535a10: bl              #0x52c38c  ; [] ::__unknown_function__
    // 0x535a14: mov             x1, x0
    // 0x535a18: stur            x1, [fp, #-0x18]
    // 0x535a1c: r0 = Await()
    //     0x535a1c: bl              #0x518e60  ; AwaitStub
    // 0x535a20: ldur            x0, [fp, #-0x10]
    // 0x535a24: LoadField: r1 = r0->field_b
    //     0x535a24: ldur            w1, [x0, #0xb]
    // 0x535a28: DecompressPointer r1
    //     0x535a28: add             x1, x1, HEAP, lsl #32
    // 0x535a2c: stur            x1, [fp, #-0x18]
    // 0x535a30: LoadField: r0 = r1->field_f
    //     0x535a30: ldur            w0, [x1, #0xf]
    // 0x535a34: DecompressPointer r0
    //     0x535a34: add             x0, x0, HEAP, lsl #32
    // 0x535a38: r16 = <Object?>
    //     0x535a38: ldr             x16, [PP, #0xa0]  ; [pp+0xa0] TypeArguments: <Object?>
    // 0x535a3c: stp             x0, x16, [SP]
    // 0x535a40: r4 = const [0x1, 0x1, 0x1, 0x1, null]
    //     0x535a40: ldr             x4, [PP, #0x8b0]  ; [pp+0x8b0] List(5) [0x1, 0x1, 0x1, 0x1, Null]
    // 0x535a44: r0 = call 0x2ce588
    //     0x535a44: bl              #0x2ce588
    // 0x535a48: ldur            x0, [fp, #-0x18]
    // 0x535a4c: LoadField: r1 = r0->field_f
    //     0x535a4c: ldur            w1, [x0, #0xf]
    // 0x535a50: DecompressPointer r1
    //     0x535a50: add             x1, x1, HEAP, lsl #32
    // 0x535a54: r0 = call 0x2f04e8
    //     0x535a54: bl              #0x2f04e8
    // 0x535a58: r0 = Null
    //     0x535a58: mov             x0, NULL
    // 0x535a5c: r0 = ReturnAsyncNotFuture()
    //     0x535a5c: b               #0x519244  ; ReturnAsyncNotFutureStub
    // 0x535a60: r0 = StackOverflowSharedWithoutFPURegs()
    //     0x535a60: bl              #0x554734  ; StackOverflowSharedWithoutFPURegsStub
    // 0x535a64: b               #0x535960
  }
  [closure] void <anonymous closure>(dynamic) {
    // ** addr: 0x330598, size: -0x1
  }
  [closure] void <anonymous closure>(dynamic) {
    // ** addr: 0x32fe3c, size: -0x1
  }
  [closure] XC <anonymous closure>(dynamic, gZ) {
    // ** addr: 0x32fef0, size: -0x1
  }
  [closure] yZ <anonymous closure>(dynamic, Pa<int, poa>) {
    // ** addr: 0x3301d0, size: -0x1
  }
  [closure] void <anonymous closure>(dynamic) {
    // ** addr: 0x38f408, size: -0x1
  }
}

// class id: 2469, size: 0x10, field offset: 0xc
//   const constructor, 
class cqa extends Vu {
}
