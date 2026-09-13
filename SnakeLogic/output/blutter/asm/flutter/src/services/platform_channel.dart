// lib: , url: package:flutter/src/services/platform_channel.dart

// class id: 1048908, size: 0x8
class :: {
}

// class id: 811, size: 0x14, field offset: 0x8
//   const constructor, 
class MethodChannel extends Object {

  _OneByteString field_8;
  mT field_c;

  [closure] Future<ByteData?> <anonymous closure>(dynamic, ByteData?) {
    // ** addr: 0x1e357c, size: -0x1
  }
}

// class id: 812, size: 0x14, field offset: 0x14
//   const constructor, 
class vT extends MethodChannel {

  _OneByteString field_8;
  mT field_c;
}

// class id: 813, size: 0x18, field offset: 0x8
//   const constructor, 
class uT<X0> extends Object {

  _OneByteString field_c;
  jT field_10;

  [closure] Future<ByteData?> <anonymous closure>(dynamic, ByteData?) async {
    // ** addr: 0x5572b4, size: 0xdc
    // 0x5572b4: EnterFrame
    //     0x5572b4: stp             fp, lr, [SP, #-0x10]!
    //     0x5572b8: mov             fp, SP
    // 0x5572bc: AllocStack(0x38)
    //     0x5572bc: sub             SP, SP, #0x38
    // 0x5572c0: SetupParameters(uT<X0> this /* r1 */, dynamic _ /* r2, fp-0x18 */)
    //     0x5572c0: stur            NULL, [fp, #-8]
    //     0x5572c4: movz            x0, #0
    //     0x5572c8: add             x1, fp, w0, sxtw #2
    //     0x5572cc: ldr             x1, [x1, #0x18]
    //     0x5572d0: add             x2, fp, w0, sxtw #2
    //     0x5572d4: ldr             x2, [x2, #0x10]
    //     0x5572d8: stur            x2, [fp, #-0x18]
    //     0x5572dc: ldur            w3, [x1, #0x17]
    //     0x5572e0: add             x3, x3, HEAP, lsl #32
    //     0x5572e4: stur            x3, [fp, #-0x10]
    // 0x5572e8: CheckStackOverflow
    //     0x5572e8: ldr             x16, [THR, #0x38]  ; THR::stack_limit
    //     0x5572ec: cmp             SP, x16
    //     0x5572f0: b.ls            #0x557388
    // 0x5572f4: InitAsync() -> Future<ByteData?>
    //     0x5572f4: ldr             x0, [PP, #0x470]  ; [pp+0x470] TypeArguments: <ByteData?>
    //     0x5572f8: bl              #0x519270  ; InitAsyncStub
    // 0x5572fc: ldur            x3, [fp, #-0x10]
    // 0x557300: LoadField: r0 = r3->field_f
    //     0x557300: ldur            w0, [x3, #0xf]
    // 0x557304: DecompressPointer r0
    //     0x557304: add             x0, x0, HEAP, lsl #32
    // 0x557308: LoadField: r4 = r0->field_f
    //     0x557308: ldur            w4, [x0, #0xf]
    // 0x55730c: DecompressPointer r4
    //     0x55730c: add             x4, x4, HEAP, lsl #32
    // 0x557310: stur            x4, [fp, #-0x28]
    // 0x557314: LoadField: r5 = r3->field_13
    //     0x557314: ldur            w5, [x3, #0x13]
    // 0x557318: DecompressPointer r5
    //     0x557318: add             x5, x5, HEAP, lsl #32
    // 0x55731c: stur            x5, [fp, #-0x20]
    // 0x557320: r0 = LoadClassIdInstr(r4)
    //     0x557320: ldur            x0, [x4, #-1]
    //     0x557324: ubfx            x0, x0, #0xc, #0x14
    // 0x557328: mov             x1, x4
    // 0x55732c: ldur            x2, [fp, #-0x18]
    // 0x557330: r0 = GDT[cid_x0 + -0x1000]()
    //     0x557330: sub             lr, x0, #1, lsl #12
    //     0x557334: ldr             lr, [x21, lr, lsl #3]
    //     0x557338: blr             lr
    // 0x55733c: ldur            x16, [fp, #-0x20]
    // 0x557340: stp             x0, x16, [SP]
    // 0x557344: ldur            x0, [fp, #-0x20]
    // 0x557348: ClosureCall
    //     0x557348: ldr             x4, [PP, #0x298]  ; [pp+0x298] List(5) [0, 0x2, 0x2, 0x2, Null]
    //     0x55734c: ldur            x2, [x0, #0x1f]
    //     0x557350: blr             x2
    // 0x557354: mov             x1, x0
    // 0x557358: stur            x1, [fp, #-0x18]
    // 0x55735c: r0 = Await()
    //     0x55735c: bl              #0x518e60  ; AwaitStub
    // 0x557360: ldur            x1, [fp, #-0x28]
    // 0x557364: r2 = LoadClassIdInstr(r1)
    //     0x557364: ldur            x2, [x1, #-1]
    //     0x557368: ubfx            x2, x2, #0xc, #0x14
    // 0x55736c: mov             x16, x0
    // 0x557370: mov             x0, x2
    // 0x557374: mov             x2, x16
    // 0x557378: r0 = GDT[cid_x0 + -0xffc]()
    //     0x557378: sub             lr, x0, #0xffc
    //     0x55737c: ldr             lr, [x21, lr, lsl #3]
    //     0x557380: blr             lr
    // 0x557384: r0 = ReturnAsyncNotFuture()
    //     0x557384: b               #0x519244  ; ReturnAsyncNotFutureStub
    // 0x557388: r0 = StackOverflowSharedWithoutFPURegs()
    //     0x557388: bl              #0x554734  ; StackOverflowSharedWithoutFPURegsStub
    // 0x55738c: b               #0x5572f4
  }
}
