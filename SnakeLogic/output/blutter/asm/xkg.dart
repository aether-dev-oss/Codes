// lib: , url: xkg

// class id: 1049261, size: 0x8
class :: {
}

// class id: 334, size: 0x8, field offset: 0x8
abstract class Yoa extends Object {

  static late Poa tKb; // offset: 0xe7c
  static late Loa hne; // offset: 0xe78
  static late final wx<int> fne; // offset: 0xe70
  static late String Wge; // offset: 0xe54
  static late String Vge; // offset: 0xe50
  static late String Xge; // offset: 0xe58
  static late String Yge; // offset: 0xe5c
  static late String Zge; // offset: 0xe60
  static late Uint8List gne; // offset: 0xe74
  static late int cne; // offset: 0xe64
  static late int dne; // offset: 0xe68
  static late int ene; // offset: 0xe6c
  static late Xoa ine; // offset: 0xe80

  [closure] static Future<Uint8List> <anonymous closure>(dynamic) async {
    // ** addr: 0x52b4e4, size: 0x388
    // 0x52b4e4: EnterFrame
    //     0x52b4e4: stp             fp, lr, [SP, #-0x10]!
    //     0x52b4e8: mov             fp, SP
    // 0x52b4ec: AllocStack(0x38)
    //     0x52b4ec: sub             SP, SP, #0x38
    // 0x52b4f0: SetupParameters(dynamic _ /* r0 */)
    //     0x52b4f0: stur            NULL, [fp, #-8]
    //     0x52b4f4: movz            x4, #0
    //     0x52b4f8: add             x0, fp, w4, sxtw #2
    //     0x52b4fc: ldr             x0, [x0, #0x10]
    //     0x52b500: ldur            w1, [x0, #0x17]
    //     0x52b504: add             x1, x1, HEAP, lsl #32
    //     0x52b508: stur            x1, [fp, #-0x10]
    // 0x52b50c: CheckStackOverflow
    //     0x52b50c: ldr             x16, [THR, #0x38]  ; THR::stack_limit
    //     0x52b510: cmp             SP, x16
    //     0x52b514: b.ls            #0x52b848
    // 0x52b518: InitAsync() -> Future<Uint8List>
    //     0x52b518: ldr             x0, [PP, #0x1300]  ; [pp+0x1300] TypeArguments: <Uint8List>
    //     0x52b51c: bl              #0x519270  ; InitAsyncStub
    // 0x52b520: r1 = 0
    //     0x52b520: movz            x1, #0
    // 0x52b524: ldur            x0, [fp, #-0x10]
    // 0x52b528: stur            x1, [fp, #-0x20]
    // 0x52b52c: CheckStackOverflow
    //     0x52b52c: ldr             x16, [THR, #0x38]  ; THR::stack_limit
    //     0x52b530: cmp             SP, x16
    //     0x52b534: b.ls            #0x52b850
    // 0x52b538: cmp             x1, #0x258
    // 0x52b53c: b.ge            #0x52b808
    // 0x52b540: LoadField: r2 = r0->field_f
    //     0x52b540: ldur            w2, [x0, #0xf]
    // 0x52b544: DecompressPointer r2
    //     0x52b544: add             x2, x2, HEAP, lsl #32
    // 0x52b548: LoadField: r3 = r2->field_7
    //     0x52b548: ldur            w3, [x2, #7]
    // 0x52b54c: DecompressPointer r3
    //     0x52b54c: add             x3, x3, HEAP, lsl #32
    // 0x52b550: LoadField: r4 = r2->field_b
    //     0x52b550: ldur            w4, [x2, #0xb]
    // 0x52b554: DecompressPointer r4
    //     0x52b554: add             x4, x4, HEAP, lsl #32
    // 0x52b558: r2 = LoadInt32Instr(r4)
    //     0x52b558: sbfx            x2, x4, #1, #0x1f
    //     0x52b55c: tbz             w4, #0, #0x52b564
    //     0x52b560: ldur            x2, [x4, #7]
    // 0x52b564: add             x4, x2, #0x10
    // 0x52b568: LoadField: r2 = r3->field_7
    //     0x52b568: ldur            x2, [x3, #7]
    // 0x52b56c: ldr             x3, [x2, x4]
    // 0x52b570: stur            x3, [fp, #-0x18]
    // 0x52b574: r0 = InitLateStaticField(0x36c) // [dart:ffi] ::Yza
    //     0x52b574: ldr             x0, [THR, #0x68]  ; THR::field_table_values
    //     0x52b578: ldr             x0, [x0, #0x6d8]
    //     0x52b57c: ldr             x16, [PP, #0x40]  ; [pp+0x40] Sentinel
    //     0x52b580: cmp             w0, w16
    //     0x52b584: b.ne            #0x52b594
    //     0x52b588: add             x2, PP, #0xe, lsl #12  ; [pp+0xe1d0] Field <::.Yza>: static late final (offset: 0x36c)
    //     0x52b58c: ldr             x2, [x2, #0x1d0]
    //     0x52b590: bl              #0x552678  ; InitLateFinalStaticFieldStub
    // 0x52b594: LoadField: r1 = r0->field_7
    //     0x52b594: ldur            x1, [x0, #7]
    // 0x52b598: ldur            x0, [fp, #-0x18]
    // 0x52b59c: cmp             x0, x1
    // 0x52b5a0: b.eq            #0x52b7c8
    // 0x52b5a4: ldur            x0, [fp, #-0x10]
    // 0x52b5a8: LoadField: r2 = r0->field_f
    //     0x52b5a8: ldur            w2, [x0, #0xf]
    // 0x52b5ac: DecompressPointer r2
    //     0x52b5ac: add             x2, x2, HEAP, lsl #32
    // 0x52b5b0: LoadField: r3 = r2->field_7
    //     0x52b5b0: ldur            w3, [x2, #7]
    // 0x52b5b4: DecompressPointer r3
    //     0x52b5b4: add             x3, x3, HEAP, lsl #32
    // 0x52b5b8: LoadField: r4 = r2->field_b
    //     0x52b5b8: ldur            w4, [x2, #0xb]
    // 0x52b5bc: DecompressPointer r4
    //     0x52b5bc: add             x4, x4, HEAP, lsl #32
    // 0x52b5c0: r2 = LoadInt32Instr(r4)
    //     0x52b5c0: sbfx            x2, x4, #1, #0x1f
    //     0x52b5c4: tbz             w4, #0, #0x52b5cc
    //     0x52b5c8: ldur            x2, [x4, #7]
    // 0x52b5cc: add             x4, x2, #0x10
    // 0x52b5d0: LoadField: r5 = r3->field_7
    //     0x52b5d0: ldur            x5, [x3, #7]
    // 0x52b5d4: ldr             x6, [x5, x4]
    // 0x52b5d8: ldr             x4, [x6]
    // 0x52b5dc: cmp             x4, x1
    // 0x52b5e0: b.eq            #0x52b7cc
    // 0x52b5e4: mov             x0, x4
    // 0x52b5e8: stur            x0, [fp, #-0x30]
    // 0x52b5ec: add             x1, x2, #0x18
    // 0x52b5f0: LoadField: r2 = r3->field_7
    //     0x52b5f0: ldur            x2, [x3, #7]
    // 0x52b5f4: ldr             x3, [x2, x1]
    // 0x52b5f8: ldr             w1, [x3]
    // 0x52b5fc: lsl             w2, w1, #1
    // 0x52b600: tst             x1, #0xc0000000
    // 0x52b604: b.eq            #0x52b634
    // 0x52b608: r2 = inline_Allocate_Mint()
    //     0x52b608: ldp             x2, x3, [THR, #0x50]  ; THR::top
    //     0x52b60c: add             x2, x2, #0x10
    //     0x52b610: cmp             x3, x2
    //     0x52b614: b.ls            #0x52b858
    //     0x52b618: str             x2, [THR, #0x50]  ; THR::top
    //     0x52b61c: sub             x2, x2, #0xf
    //     0x52b620: movz            x3, #0xc15c
    //     0x52b624: movk            x3, #0x3, lsl #16
    //     0x52b628: stur            x3, [x2, #-1]
    // 0x52b62c: ubfx            x3, x1, #0, #0x20
    // 0x52b630: StoreField: r2->field_7 = r3
    //     0x52b630: stur            x3, [x2, #7]
    // 0x52b634: stur            x2, [fp, #-0x28]
    // 0x52b638: ubfx            x1, x1, #0, #0x20
    // 0x52b63c: stur            x1, [fp, #-0x18]
    // 0x52b640: tbnz            x1, #0x3f, #0x52b814
    // 0x52b644: r17 = 1073741823
    //     0x52b644: orr             x17, xzr, #0x3fffffff
    // 0x52b648: cmp             x1, x17
    // 0x52b64c: b.gt            #0x52b814
    // 0x52b650: mov             x4, x2
    // 0x52b654: r0 = AllocateUint8Array()
    //     0x52b654: bl              #0x554308  ; AllocateUint8ArrayStub
    // 0x52b658: mov             x4, x0
    // 0x52b65c: ldur            x0, [fp, #-0x18]
    // 0x52b660: stur            x4, [fp, #-0x38]
    // 0x52b664: tbnz            x0, #0x3f, #0x52b670
    // 0x52b668: cmp             x0, x0
    // 0x52b66c: b.le            #0x52b684
    // 0x52b670: ldur            x2, [fp, #-0x28]
    // 0x52b674: mov             x3, x0
    // 0x52b678: r1 = 0
    //     0x52b678: movz            x1, #0
    // 0x52b67c: r4 = const [0, 0x3, 0, 0x3, null]
    //     0x52b67c: ldr             x4, [PP, #0x1d0]  ; [pp+0x1d0] List(5) [0, 0x3, 0, 0x3, Null]
    // 0x52b680: r0 = call 0x1773b0
    //     0x52b680: bl              #0x1773b0
    // 0x52b684: ldur            x2, [fp, #-0x18]
    // 0x52b688: cmp             x2, x2
    // 0x52b68c: b.lt            #0x52b83c
    // 0x52b690: cbnz            x2, #0x52b69c
    // 0x52b694: ldur            x20, [fp, #-0x38]
    // 0x52b698: b               #0x52b7c0
    // 0x52b69c: ldur            x0, [fp, #-0x28]
    // 0x52b6a0: cmp             w0, #0x800
    // 0x52b6a4: b.ge            #0x52b778
    // 0x52b6a8: ldur            x1, [fp, #-0x30]
    // 0x52b6ac: ldur            x20, [fp, #-0x38]
    // 0x52b6b0: mov             x3, x0
    // 0x52b6b4: mov             x2, x1
    // 0x52b6b8: add             x0, x20, #0x17
    // 0x52b6bc: cbz             x3, #0x52b774
    // 0x52b6c0: cmp             x0, x2
    // 0x52b6c4: b.ls            #0x52b72c
    // 0x52b6c8: sxtw            x3, w3
    // 0x52b6cc: add             x16, x2, x3, asr #1
    // 0x52b6d0: cmp             x0, x16
    // 0x52b6d4: b.hs            #0x52b72c
    // 0x52b6d8: mov             x2, x16
    // 0x52b6dc: add             x0, x0, x3, asr #1
    // 0x52b6e0: tbz             w3, #4, #0x52b6ec
    // 0x52b6e4: ldr             x16, [x2, #-8]!
    // 0x52b6e8: str             x16, [x0, #-8]!
    // 0x52b6ec: tbz             w3, #3, #0x52b6f8
    // 0x52b6f0: ldr             w16, [x2, #-4]!
    // 0x52b6f4: str             w16, [x0, #-4]!
    // 0x52b6f8: tbz             w3, #2, #0x52b704
    // 0x52b6fc: ldrh            w16, [x2, #-2]!
    // 0x52b700: strh            w16, [x0, #-2]!
    // 0x52b704: tbz             w3, #1, #0x52b710
    // 0x52b708: ldrb            w16, [x2, #-1]!
    // 0x52b70c: strb            w16, [x0, #-1]!
    // 0x52b710: ands            w3, w3, #0xffffffe1
    // 0x52b714: b.eq            #0x52b774
    // 0x52b718: ldp             x16, x17, [x2, #-0x10]!
    // 0x52b71c: stp             x16, x17, [x0, #-0x10]!
    // 0x52b720: subs            w3, w3, #0x20
    // 0x52b724: b.ne            #0x52b718
    // 0x52b728: b               #0x52b774
    // 0x52b72c: tbz             w3, #4, #0x52b738
    // 0x52b730: ldr             x16, [x2], #8
    // 0x52b734: str             x16, [x0], #8
    // 0x52b738: tbz             w3, #3, #0x52b744
    // 0x52b73c: ldr             w16, [x2], #4
    // 0x52b740: str             w16, [x0], #4
    // 0x52b744: tbz             w3, #2, #0x52b750
    // 0x52b748: ldrh            w16, [x2], #2
    // 0x52b74c: strh            w16, [x0], #2
    // 0x52b750: tbz             w3, #1, #0x52b75c
    // 0x52b754: ldrb            w16, [x2], #1
    // 0x52b758: strb            w16, [x0], #1
    // 0x52b75c: ands            w3, w3, #0xffffffe1
    // 0x52b760: b.eq            #0x52b774
    // 0x52b764: ldp             x16, x17, [x2], #0x10
    // 0x52b768: stp             x16, x17, [x0], #0x10
    // 0x52b76c: subs            w3, w3, #0x20
    // 0x52b770: b.ne            #0x52b764
    // 0x52b774: b               #0x52b7c0
    // 0x52b778: ldur            x1, [fp, #-0x30]
    // 0x52b77c: ldur            x20, [fp, #-0x38]
    // 0x52b780: LoadField: r0 = r20->field_7
    //     0x52b780: ldur            x0, [x20, #7]
    // 0x52b784: CallRuntime_MemoryMove(void*, const void*, size_t) -> void*
    //     0x52b784: mov             x3, THR
    //     0x52b788: ldr             x9, [x3, #0x608]
    //     0x52b78c: mov             x17, fp
    //     0x52b790: str             fp, [SP, #-8]!
    //     0x52b794: mov             fp, SP
    //     0x52b798: and             SP, SP, #0xfffffffffffffff0
    //     0x52b79c: mov             x19, sp
    //     0x52b7a0: mov             sp, SP
    //     0x52b7a4: str             x9, [THR, #0x750]  ; THR::vm_tag
    //     0x52b7a8: blr             x9
    //     0x52b7ac: movz            x16, #0x8
    //     0x52b7b0: str             x16, [THR, #0x750]  ; THR::vm_tag
    //     0x52b7b4: mov             sp, x19
    //     0x52b7b8: mov             SP, fp
    //     0x52b7bc: ldr             fp, [SP], #8
    // 0x52b7c0: mov             x0, x20
    // 0x52b7c4: r0 = ReturnAsyncNotFuture()
    //     0x52b7c4: b               #0x519244  ; ReturnAsyncNotFutureStub
    // 0x52b7c8: ldur            x0, [fp, #-0x10]
    // 0x52b7cc: ldur            x1, [fp, #-0x20]
    // 0x52b7d0: r0 = Ca()
    //     0x52b7d0: bl              #0x50fe20  ; AllocateCaStub -> Ca (size=0x10)
    // 0x52b7d4: mov             x1, x0
    // 0x52b7d8: r0 = 100000
    //     0x52b7d8: movz            x0, #0x86a0
    //     0x52b7dc: movk            x0, #0x1, lsl #16
    // 0x52b7e0: StoreField: r1->field_7 = r0
    //     0x52b7e0: stur            x0, [x1, #7]
    // 0x52b7e4: mov             x2, x1
    // 0x52b7e8: r1 = Null
    //     0x52b7e8: mov             x1, NULL
    // 0x52b7ec: r0 = call 0x1afcac
    //     0x52b7ec: bl              #0x1afcac
    // 0x52b7f0: mov             x1, x0
    // 0x52b7f4: stur            x1, [fp, #-0x28]
    // 0x52b7f8: r0 = Await()
    //     0x52b7f8: bl              #0x518e60  ; AwaitStub
    // 0x52b7fc: ldur            x0, [fp, #-0x20]
    // 0x52b800: add             x1, x0, #1
    // 0x52b804: b               #0x52b524
    // 0x52b808: r4 = 0
    //     0x52b808: movz            x4, #0
    // 0x52b80c: r0 = AllocateUint8Array()
    //     0x52b80c: bl              #0x554308  ; AllocateUint8ArrayStub
    // 0x52b810: r0 = ReturnAsyncNotFuture()
    //     0x52b810: b               #0x519244  ; ReturnAsyncNotFutureStub
    // 0x52b814: r0 = ArgumentError()
    //     0x52b814: bl              #0x510bc4  ; AllocateArgumentErrorStub -> ArgumentError (size=0x1c)
    // 0x52b818: mov             x1, x0
    // 0x52b81c: r0 = "length must be in the range [0, 1073741823]."
    //     0x52b81c: add             x0, PP, #0xe, lsl #12  ; [pp+0xe1e8] "length must be in the range [0, 1073741823]."
    //     0x52b820: ldr             x0, [x0, #0x1e8]
    // 0x52b824: ArrayStore: r1[0] = r0  ; List_4
    //     0x52b824: stur            w0, [x1, #0x17]
    // 0x52b828: r0 = false
    //     0x52b828: add             x0, NULL, #0x30  ; false
    // 0x52b82c: StoreField: r1->field_b = r0
    //     0x52b82c: stur            w0, [x1, #0xb]
    // 0x52b830: mov             x0, x1
    // 0x52b834: r0 = Throw()
    //     0x52b834: bl              #0x5527dc  ; ThrowStub
    // 0x52b838: brk             #0
    // 0x52b83c: r0 = call 0x177334
    //     0x52b83c: bl              #0x177334
    // 0x52b840: r0 = Throw()
    //     0x52b840: bl              #0x5527dc  ; ThrowStub
    // 0x52b844: brk             #0
    // 0x52b848: r0 = StackOverflowSharedWithoutFPURegs()
    //     0x52b848: bl              #0x554734  ; StackOverflowSharedWithoutFPURegsStub
    // 0x52b84c: b               #0x52b518
    // 0x52b850: r0 = StackOverflowSharedWithoutFPURegs()
    //     0x52b850: bl              #0x554734  ; StackOverflowSharedWithoutFPURegsStub
    // 0x52b854: b               #0x52b538
    // 0x52b858: stp             x0, x1, [SP, #-0x10]!
    // 0x52b85c: r0 = AllocateMint()
    //     0x52b85c: bl              #0x5545d8  ; AllocateMintStub
    // 0x52b860: mov             x2, x0
    // 0x52b864: ldp             x0, x1, [SP], #0x10
    // 0x52b868: b               #0x52b62c
  }
}

// class id: 335, size: 0x1c, field offset: 0x8
class Xoa extends Object {

  [closure] int <anonymous closure>(dynamic, Voa, Voa) {
    // ** addr: 0x32f1f0, size: -0x1
  }
}

// class id: 336, size: 0x18, field offset: 0x8
class Woa extends Object {
}

// class id: 337, size: 0x2c, field offset: 0x8
class Voa extends Object {
}

// class id: 338, size: 0x28, field offset: 0x8
class Uoa extends Object {
}

// class id: 339, size: 0x28, field offset: 0x8
class Toa extends Object {
}

// class id: 340, size: 0xc, field offset: 0x8
class Soa extends Object {
}

// class id: 341, size: 0x30, field offset: 0x8
class Roa extends Object {
}

// class id: 342, size: 0x24, field offset: 0x8
class Qoa extends Object {
}

// class id: 343, size: 0x28, field offset: 0x8
class Poa extends Object {
}

// class id: 344, size: 0x54, field offset: 0x8
class Ooa extends Object {
}

// class id: 345, size: 0x14, field offset: 0x8
class Noa extends Object {
}

// class id: 346, size: 0x10, field offset: 0x8
class Moa extends Object {
}

// class id: 347, size: 0x28, field offset: 0x8
class Loa extends Object {
}

// class id: 348, size: 0xc, field offset: 0x8
class Koa extends Object {
}

// class id: 349, size: 0x4c, field offset: 0x8
class Joa extends Object {
}

// class id: 351, size: 0x44, field offset: 0x8
class Hoa extends Object {
}

// class id: 352, size: 0x40, field offset: 0x8
class Goa extends Object {
}

// class id: 353, size: 0x34, field offset: 0x8
class Foa extends Object {
}

// class id: 354, size: 0x78, field offset: 0x8
class Eoa extends Object {
}

// class id: 355, size: 0x10, field offset: 0x8
class Doa extends Object {
}

// class id: 356, size: 0x18, field offset: 0x8
class Coa extends Object {
}

// class id: 357, size: 0x28, field offset: 0x8
class Boa extends Object {
}

// class id: 358, size: 0x14, field offset: 0x8
class Aoa extends Object {
}

// class id: 359, size: 0x1c, field offset: 0x8
class zoa extends Object {
}
