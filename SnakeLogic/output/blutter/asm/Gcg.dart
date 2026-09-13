// lib: , url: Gcg

// class id: 1048830, size: 0x8
class :: {
}

// class id: 1168, size: 0xc, field offset: 0x8
class gM extends Object
    implements Ha {
}

// class id: 1170, size: 0x18, field offset: 0x8
//   const constructor, 
class WL extends Object {
}

// class id: 1171, size: 0x20, field offset: 0x8
//   const constructor, 
class VL extends Object {
}

// class id: 1204, size: 0xc, field offset: 0x8
//   const constructor, 
abstract class SK<X0> extends Object {

  [closure] Null <anonymous closure>(dynamic, X0) {
    // ** addr: 0x53646c, size: 0xc0
    // 0x53646c: EnterFrame
    //     0x53646c: stp             fp, lr, [SP, #-0x10]!
    //     0x536470: mov             fp, SP
    // 0x536474: AllocStack(0x60)
    //     0x536474: sub             SP, SP, #0x60
    // 0x536478: SetupParameters([dynamic _ /* r0 */])
    //     0x536478: ldr             x0, [fp, #0x18]
    //     0x53647c: ldur            w1, [x0, #0x17]
    //     0x536480: add             x1, x1, HEAP, lsl #32
    //     0x536484: stur            x1, [fp, #-0x48]
    // 0x536488: CheckStackOverflow
    //     0x536488: ldr             x16, [THR, #0x38]  ; THR::stack_limit
    //     0x53648c: cmp             SP, x16
    //     0x536490: b.ls            #0x536524
    // 0x536494: ldr             x0, [fp, #0x10]
    // 0x536498: StoreField: r1->field_1b = r0
    //     0x536498: stur            w0, [x1, #0x1b]
    //     0x53649c: tbz             w0, #0, #0x5364b8
    //     0x5364a0: ldurb           w16, [x1, #-1]
    //     0x5364a4: ldurb           w17, [x0, #-1]
    //     0x5364a8: and             x16, x17, x16, lsr #2
    //     0x5364ac: tst             x16, HEAP, lsr #32
    //     0x5364b0: b.eq            #0x5364b8
    //     0x5364b4: bl              #0x552d4c  ; WriteBarrierWrappersStub
    // 0x5364b8: LoadField: r2 = r1->field_13
    //     0x5364b8: ldur            w2, [x1, #0x13]
    // 0x5364bc: DecompressPointer r2
    //     0x5364bc: add             x2, x2, HEAP, lsl #32
    // 0x5364c0: stur            x2, [fp, #-0x40]
    // 0x5364c4: LoadField: r0 = r1->field_23
    //     0x5364c4: ldur            w0, [x1, #0x23]
    // 0x5364c8: DecompressPointer r0
    //     0x5364c8: add             x0, x0, HEAP, lsl #32
    // 0x5364cc: ldr             x16, [fp, #0x10]
    // 0x5364d0: stp             x16, x2, [SP, #8]
    // 0x5364d4: str             x0, [SP]
    // 0x5364d8: mov             x0, x2
    // 0x5364dc: ClosureCall
    //     0x5364dc: ldr             x4, [PP, #0x270]  ; [pp+0x270] List(5) [0, 0x3, 0x3, 0x3, Null]
    //     0x5364e0: ldur            x2, [x0, #0x1f]
    //     0x5364e4: blr             x2
    // 0x5364e8: b               #0x536514
    // 0x5364ec: sub             SP, fp, #0x60
    // 0x5364f0: ldur            x2, [fp, #-0x10]
    // 0x5364f4: LoadField: r3 = r2->field_23
    //     0x5364f4: ldur            w3, [x2, #0x23]
    // 0x5364f8: DecompressPointer r3
    //     0x5364f8: add             x3, x3, HEAP, lsl #32
    // 0x5364fc: stp             x0, x3, [SP, #8]
    // 0x536500: str             x1, [SP]
    // 0x536504: mov             x0, x3
    // 0x536508: ClosureCall
    //     0x536508: ldr             x4, [PP, #0x270]  ; [pp+0x270] List(5) [0, 0x3, 0x3, 0x3, Null]
    //     0x53650c: ldur            x2, [x0, #0x1f]
    //     0x536510: blr             x2
    // 0x536514: r0 = Null
    //     0x536514: mov             x0, NULL
    // 0x536518: LeaveFrame
    //     0x536518: mov             SP, fp
    //     0x53651c: ldp             fp, lr, [SP], #0x10
    // 0x536520: ret
    //     0x536520: ret             
    // 0x536524: r0 = StackOverflowSharedWithoutFPURegs()
    //     0x536524: bl              #0x554734  ; StackOverflowSharedWithoutFPURegsStub
    // 0x536528: b               #0x536494
  }
  [closure] Future<void> rza(dynamic, Object, ua?) async {
    // ** addr: 0x53652c, size: 0xb4
    // 0x53652c: EnterFrame
    //     0x53652c: stp             fp, lr, [SP, #-0x10]!
    //     0x536530: mov             fp, SP
    // 0x536534: AllocStack(0x40)
    //     0x536534: sub             SP, SP, #0x40
    // 0x536538: SetupParameters(SK<X0> this /* r1 */, dynamic _ /* r2, fp-0x20 */, dynamic _ /* r3, fp-0x18 */)
    //     0x536538: stur            NULL, [fp, #-8]
    //     0x53653c: movz            x0, #0
    //     0x536540: add             x1, fp, w0, sxtw #2
    //     0x536544: ldr             x1, [x1, #0x20]
    //     0x536548: add             x2, fp, w0, sxtw #2
    //     0x53654c: ldr             x2, [x2, #0x18]
    //     0x536550: stur            x2, [fp, #-0x20]
    //     0x536554: add             x3, fp, w0, sxtw #2
    //     0x536558: ldr             x3, [x3, #0x10]
    //     0x53655c: stur            x3, [fp, #-0x18]
    //     0x536560: ldur            w4, [x1, #0x17]
    //     0x536564: add             x4, x4, HEAP, lsl #32
    //     0x536568: stur            x4, [fp, #-0x10]
    // 0x53656c: CheckStackOverflow
    //     0x53656c: ldr             x16, [THR, #0x38]  ; THR::stack_limit
    //     0x536570: cmp             SP, x16
    //     0x536574: b.ls            #0x5365d8
    // 0x536578: InitAsync() -> Future<void?>
    //     0x536578: ldr             x0, [PP, #0x2f8]  ; [pp+0x2f8] TypeArguments: <void?>
    //     0x53657c: bl              #0x519270  ; InitAsyncStub
    // 0x536580: ldur            x0, [fp, #-0x10]
    // 0x536584: LoadField: r1 = r0->field_1f
    //     0x536584: ldur            w1, [x0, #0x1f]
    // 0x536588: DecompressPointer r1
    //     0x536588: add             x1, x1, HEAP, lsl #32
    // 0x53658c: tbnz            w1, #4, #0x536598
    // 0x536590: r0 = Null
    //     0x536590: mov             x0, NULL
    // 0x536594: r0 = ReturnAsyncNotFuture()
    //     0x536594: b               #0x519244  ; ReturnAsyncNotFutureStub
    // 0x536598: r1 = true
    //     0x536598: add             x1, NULL, #0x20  ; true
    // 0x53659c: StoreField: r0->field_1f = r1
    //     0x53659c: stur            w1, [x0, #0x1f]
    // 0x5365a0: ArrayLoad: r1 = r0[0]  ; List_4
    //     0x5365a0: ldur            w1, [x0, #0x17]
    // 0x5365a4: DecompressPointer r1
    //     0x5365a4: add             x1, x1, HEAP, lsl #32
    // 0x5365a8: LoadField: r2 = r0->field_1b
    //     0x5365a8: ldur            w2, [x0, #0x1b]
    // 0x5365ac: DecompressPointer r2
    //     0x5365ac: add             x2, x2, HEAP, lsl #32
    // 0x5365b0: stp             x2, x1, [SP, #0x10]
    // 0x5365b4: ldur            x16, [fp, #-0x20]
    // 0x5365b8: ldur            lr, [fp, #-0x18]
    // 0x5365bc: stp             lr, x16, [SP]
    // 0x5365c0: mov             x0, x1
    // 0x5365c4: ClosureCall
    //     0x5365c4: ldr             x4, [PP, #0x520]  ; [pp+0x520] List(5) [0, 0x4, 0x4, 0x4, Null]
    //     0x5365c8: ldur            x2, [x0, #0x1f]
    //     0x5365cc: blr             x2
    // 0x5365d0: r0 = Null
    //     0x5365d0: mov             x0, NULL
    // 0x5365d4: r0 = ReturnAsyncNotFuture()
    //     0x5365d4: b               #0x519244  ; ReturnAsyncNotFutureStub
    // 0x5365d8: r0 = StackOverflowSharedWithoutFPURegs()
    //     0x5365d8: bl              #0x554734  ; StackOverflowSharedWithoutFPURegsStub
    // 0x5365dc: b               #0x536578
  }
  [closure] Future<void> <anonymous closure>(dynamic, X0?, Object, ua?) async {
    // ** addr: 0x5365ec, size: 0x100
    // 0x5365ec: EnterFrame
    //     0x5365ec: stp             fp, lr, [SP, #-0x10]!
    //     0x5365f0: mov             fp, SP
    // 0x5365f4: AllocStack(0x30)
    //     0x5365f4: sub             SP, SP, #0x30
    // 0x5365f8: SetupParameters(SK<X0> this /* r1 */, dynamic _ /* r2, fp-0x20 */, dynamic _ /* r3, fp-0x18 */)
    //     0x5365f8: stur            NULL, [fp, #-8]
    //     0x5365fc: movz            x0, #0
    //     0x536600: add             x1, fp, w0, sxtw #2
    //     0x536604: ldr             x1, [x1, #0x28]
    //     0x536608: add             x2, fp, w0, sxtw #2
    //     0x53660c: ldr             x2, [x2, #0x18]
    //     0x536610: stur            x2, [fp, #-0x20]
    //     0x536614: add             x3, fp, w0, sxtw #2
    //     0x536618: ldr             x3, [x3, #0x10]
    //     0x53661c: stur            x3, [fp, #-0x18]
    //     0x536620: ldur            w4, [x1, #0x17]
    //     0x536624: add             x4, x4, HEAP, lsl #32
    //     0x536628: stur            x4, [fp, #-0x10]
    // 0x53662c: CheckStackOverflow
    //     0x53662c: ldr             x16, [THR, #0x38]  ; THR::stack_limit
    //     0x536630: cmp             SP, x16
    //     0x536634: b.ls            #0x5366e0
    // 0x536638: InitAsync() -> Future<void?>
    //     0x536638: ldr             x0, [PP, #0x2f8]  ; [pp+0x2f8] TypeArguments: <void?>
    //     0x53663c: bl              #0x519270  ; InitAsyncStub
    // 0x536640: r0 = Null
    //     0x536640: mov             x0, NULL
    // 0x536644: r0 = Await()
    //     0x536644: bl              #0x518e60  ; AwaitStub
    // 0x536648: ldur            x0, [fp, #-0x10]
    // 0x53664c: LoadField: r1 = r0->field_13
    //     0x53664c: ldur            w1, [x0, #0x13]
    // 0x536650: DecompressPointer r1
    //     0x536650: add             x1, x1, HEAP, lsl #32
    // 0x536654: stur            x1, [fp, #-0x28]
    // 0x536658: LoadField: r0 = r1->field_7
    //     0x536658: ldur            w0, [x1, #7]
    // 0x53665c: DecompressPointer r0
    //     0x53665c: add             x0, x0, HEAP, lsl #32
    // 0x536660: cmp             w0, NULL
    // 0x536664: b.ne            #0x536684
    // 0x536668: r0 = _eM()
    //     0x536668: bl              #0x536af4  ; Allocate_eMStub -> _eM (size=0x34)
    // 0x53666c: mov             x1, x0
    // 0x536670: stur            x0, [fp, #-0x10]
    // 0x536674: r0 = call 0x33b300
    //     0x536674: bl              #0x33b300
    // 0x536678: ldur            x1, [fp, #-0x28]
    // 0x53667c: ldur            x2, [fp, #-0x10]
    // 0x536680: r0 = call 0x33b0ec
    //     0x536680: bl              #0x33b0ec
    // 0x536684: ldur            x0, [fp, #-0x28]
    // 0x536688: LoadField: r2 = r0->field_7
    //     0x536688: ldur            w2, [x0, #7]
    // 0x53668c: DecompressPointer r2
    //     0x53668c: add             x2, x2, HEAP, lsl #32
    // 0x536690: stur            x2, [fp, #-0x10]
    // 0x536694: cmp             w2, NULL
    // 0x536698: b.eq            #0x5366e8
    // 0x53669c: r1 = <List<Object>>
    //     0x53669c: ldr             x1, [PP, #0x2290]  ; [pp+0x2290] TypeArguments: <List<Object>>
    // 0x5366a0: r0 = dx()
    //     0x5366a0: bl              #0x5136ac  ; AllocatedxStub -> dx (size=0x2c)
    // 0x5366a4: mov             x1, x0
    // 0x5366a8: r2 = "while resolving an image"
    //     0x5366a8: add             x2, PP, #0x1a, lsl #12  ; [pp+0x1a270] "while resolving an image"
    //     0x5366ac: ldr             x2, [x2, #0x270]
    // 0x5366b0: r3 = Instance_Vw
    //     0x5366b0: ldr             x3, [PP, #0x22a0]  ; [pp+0x22a0] Obj!Vw@36bb31
    // 0x5366b4: r0 = call 0x19ac78
    //     0x5366b4: bl              #0x19ac78
    // 0x5366b8: r16 = true
    //     0x5366b8: add             x16, NULL, #0x20  ; true
    // 0x5366bc: str             x16, [SP]
    // 0x5366c0: ldur            x1, [fp, #-0x10]
    // 0x5366c4: ldur            x2, [fp, #-0x20]
    // 0x5366c8: ldur            x3, [fp, #-0x18]
    // 0x5366cc: r4 = const [0, 0x4, 0x1, 0x3, oDb, 0x3, null]
    //     0x5366cc: add             x4, PP, #0x1a, lsl #12  ; [pp+0x1a278] List(7) [0, 0x4, 0x1, 0x3, "oDb", 0x3, Null]
    //     0x5366d0: ldr             x4, [x4, #0x278]
    // 0x5366d4: r0 = __unknown_function__()
    //     0x5366d4: bl              #0x5366ec  ; [] ::__unknown_function__
    // 0x5366d8: r0 = Null
    //     0x5366d8: mov             x0, NULL
    // 0x5366dc: r0 = ReturnAsyncNotFuture()
    //     0x5366dc: b               #0x519244  ; ReturnAsyncNotFutureStub
    // 0x5366e0: r0 = StackOverflowSharedWithoutFPURegs()
    //     0x5366e0: bl              #0x554734  ; StackOverflowSharedWithoutFPURegsStub
    // 0x5366e4: b               #0x536638
    // 0x5366e8: r0 = NullCastErrorSharedWithoutFPURegs()
    //     0x5366e8: bl              #0x554cdc  ; NullCastErrorSharedWithoutFPURegsStub
  }
  [closure] void <anonymous closure>(dynamic, X0, (dynamic, Object, ua?) => void) {
    // ** addr: 0x33b3dc, size: -0x1
  }
  [closure] fM <anonymous closure>(dynamic) {
    // ** addr: 0x4273c0, size: -0x1
  }
  [closure] fM <anonymous closure>(dynamic) {
    // ** addr: 0x4272a8, size: -0x1
  }
}

// class id: 1206, size: 0x18, field offset: 0xc
//   const constructor, 
class cM extends SK<dynamic> {
}

// class id: 1207, size: 0x18, field offset: 0xc
//   const constructor, 
class bM extends SK<dynamic> {

  [closure] List<Xw> <anonymous closure>(dynamic) {
    // ** addr: 0x45145c, size: -0x1
  }
}

// class id: 1209, size: 0xc, field offset: 0xc
//   const constructor, 
abstract class XL extends SK<dynamic> {
}

// class id: 1213, size: 0xc, field offset: 0xc
abstract class RK extends SK<dynamic> {
}

// class id: 1734, size: 0x34, field offset: 0x34
class _eM extends fM {
}
