// lib: , url: Ydg

// class id: 1048897, size: 0x8
class :: {
}

// class id: 837, size: 0x8, field offset: 0x8
abstract class OS extends Object {
}

// class id: 838, size: 0x8, field offset: 0x8
abstract class _LS extends Object
    implements tx, LR {
}

// class id: 839, size: 0x8, field offset: 0x8
abstract class MS extends _LS {

  [closure] static List<Tx> _wld(dynamic, String) {
    // ** addr: 0x4fd810, size: -0x1
  }
}

// class id: 841, size: 0x8, field offset: 0x8
//   const constructor, 
class _NS extends GS {

  [closure] void <anonymous closure>(dynamic, ByteData?) {
    // ** addr: 0x5169a8, size: 0xac
    // 0x5169a8: EnterFrame
    //     0x5169a8: stp             fp, lr, [SP, #-0x10]!
    //     0x5169ac: mov             fp, SP
    // 0x5169b0: AllocStack(0x58)
    //     0x5169b0: sub             SP, SP, #0x58
    // 0x5169b4: SetupParameters([dynamic _ /* r0 */])
    //     0x5169b4: ldr             x0, [fp, #0x18]
    //     0x5169b8: ldur            w1, [x0, #0x17]
    //     0x5169bc: add             x1, x1, HEAP, lsl #32
    // 0x5169c0: CheckStackOverflow
    //     0x5169c0: ldr             x16, [THR, #0x38]  ; THR::stack_limit
    //     0x5169c4: cmp             SP, x16
    //     0x5169c8: b.ls            #0x516a4c
    // 0x5169cc: LoadField: r0 = r1->field_f
    //     0x5169cc: ldur            w0, [x1, #0xf]
    // 0x5169d0: DecompressPointer r0
    //     0x5169d0: add             x0, x0, HEAP, lsl #32
    // 0x5169d4: ldr             x16, [fp, #0x10]
    // 0x5169d8: str             x16, [SP]
    // 0x5169dc: mov             x1, x0
    // 0x5169e0: r4 = const [0, 0x2, 0x1, 0x2, null]
    //     0x5169e0: ldr             x4, [PP, #0x440]  ; [pp+0x440] List(5) [0, 0x2, 0x1, 0x2, Null]
    // 0x5169e4: r0 = call 0x497fac
    //     0x5169e4: bl              #0x497fac
    // 0x5169e8: b               #0x516a3c
    // 0x5169ec: sub             SP, fp, #0x58
    // 0x5169f0: mov             x2, x0
    // 0x5169f4: stur            x0, [fp, #-0x48]
    // 0x5169f8: mov             x0, x1
    // 0x5169fc: stur            x1, [fp, #-0x50]
    // 0x516a00: r1 = <List<Object>>
    //     0x516a00: ldr             x1, [PP, #0x2290]  ; [pp+0x2290] TypeArguments: <List<Object>>
    // 0x516a04: r0 = dx()
    //     0x516a04: bl              #0x5136ac  ; AllocatedxStub -> dx (size=0x2c)
    // 0x516a08: mov             x1, x0
    // 0x516a0c: r2 = "during a platform message response callback"
    //     0x516a0c: ldr             x2, [PP, #0x28e0]  ; [pp+0x28e0] "during a platform message response callback"
    // 0x516a10: r3 = Instance_Vw
    //     0x516a10: ldr             x3, [PP, #0x22a0]  ; [pp+0x22a0] Obj!Vw@36bb31
    // 0x516a14: r0 = call 0x19ac78
    //     0x516a14: bl              #0x19ac78
    // 0x516a18: r0 = hx()
    //     0x516a18: bl              #0x513784  ; AllocatehxStub -> hx (size=0x14)
    // 0x516a1c: mov             x1, x0
    // 0x516a20: ldur            x0, [fp, #-0x48]
    // 0x516a24: StoreField: r1->field_7 = r0
    //     0x516a24: stur            w0, [x1, #7]
    // 0x516a28: ldur            x0, [fp, #-0x50]
    // 0x516a2c: StoreField: r1->field_b = r0
    //     0x516a2c: stur            w0, [x1, #0xb]
    // 0x516a30: r0 = false
    //     0x516a30: add             x0, NULL, #0x30  ; false
    // 0x516a34: StoreField: r1->field_f = r0
    //     0x516a34: stur            w0, [x1, #0xf]
    // 0x516a38: r0 = call 0x17d558
    //     0x516a38: bl              #0x17d558
    // 0x516a3c: r0 = Null
    //     0x516a3c: mov             x0, NULL
    // 0x516a40: LeaveFrame
    //     0x516a40: mov             SP, fp
    //     0x516a44: ldp             fp, lr, [SP], #0x10
    // 0x516a48: ret
    //     0x516a48: ret             
    // 0x516a4c: r0 = StackOverflowSharedWithoutFPURegs()
    //     0x516a4c: bl              #0x554734  ; StackOverflowSharedWithoutFPURegsStub
    // 0x516a50: b               #0x5169cc
  }
  [closure] Future<void> <anonymous closure>(dynamic, ByteData?, (dynamic, ByteData?) => void) async {
    // ** addr: 0x51c000, size: 0x168
    // 0x51c000: EnterFrame
    //     0x51c000: stp             fp, lr, [SP, #-0x10]!
    //     0x51c004: mov             fp, SP
    // 0x51c008: AllocStack(0xa0)
    //     0x51c008: sub             SP, SP, #0xa0
    // 0x51c00c: SetupParameters(_NS this /* r1, fp-0x90 */, dynamic _ /* r2, fp-0x88 */, dynamic _ /* r3, fp-0x80 */)
    //     0x51c00c: stur            NULL, [fp, #-8]
    //     0x51c010: movz            x0, #0
    //     0x51c014: add             x1, fp, w0, sxtw #2
    //     0x51c018: ldr             x1, [x1, #0x20]
    //     0x51c01c: stur            x1, [fp, #-0x90]
    //     0x51c020: add             x2, fp, w0, sxtw #2
    //     0x51c024: ldr             x2, [x2, #0x18]
    //     0x51c028: stur            x2, [fp, #-0x88]
    //     0x51c02c: add             x3, fp, w0, sxtw #2
    //     0x51c030: ldr             x3, [x3, #0x10]
    //     0x51c034: stur            x3, [fp, #-0x80]
    //     0x51c038: ldur            w4, [x1, #0x17]
    //     0x51c03c: add             x4, x4, HEAP, lsl #32
    //     0x51c040: stur            x4, [fp, #-0x78]
    // 0x51c044: CheckStackOverflow
    //     0x51c044: ldr             x16, [THR, #0x38]  ; THR::stack_limit
    //     0x51c048: cmp             SP, x16
    //     0x51c04c: b.ls            #0x51c158
    // 0x51c050: InitAsync() -> Future<void?>
    //     0x51c050: ldr             x0, [PP, #0x2f8]  ; [pp+0x2f8] TypeArguments: <void?>
    //     0x51c054: bl              #0x519270  ; InitAsyncStub
    // 0x51c058: ldur            x0, [fp, #-0x78]
    // 0x51c05c: LoadField: r1 = r0->field_f
    //     0x51c05c: ldur            w1, [x0, #0xf]
    // 0x51c060: DecompressPointer r1
    //     0x51c060: add             x1, x1, HEAP, lsl #32
    // 0x51c064: stur            x1, [fp, #-0x90]
    // 0x51c068: ldur            x16, [fp, #-0x88]
    // 0x51c06c: stp             x16, x1, [SP]
    // 0x51c070: mov             x0, x1
    // 0x51c074: ClosureCall
    //     0x51c074: ldr             x4, [PP, #0x298]  ; [pp+0x298] List(5) [0, 0x2, 0x2, 0x2, Null]
    //     0x51c078: ldur            x2, [x0, #0x1f]
    //     0x51c07c: blr             x2
    // 0x51c080: mov             x2, x0
    // 0x51c084: r1 = <ByteData?>
    //     0x51c084: ldr             x1, [PP, #0x470]  ; [pp+0x470] TypeArguments: <ByteData?>
    // 0x51c088: stur            x2, [fp, #-0x78]
    // 0x51c08c: r0 = AwaitWithTypeCheck()
    //     0x51c08c: bl              #0x514480  ; AwaitWithTypeCheckStub
    // 0x51c090: ldur            x1, [fp, #-0x80]
    // 0x51c094: b               #0x51c0f8
    // 0x51c098: sub             SP, fp, #0xa0
    // 0x51c09c: mov             x2, x0
    // 0x51c0a0: stur            x0, [fp, #-0x78]
    // 0x51c0a4: mov             x0, x1
    // 0x51c0a8: stur            x1, [fp, #-0x80]
    // 0x51c0ac: r1 = <List<Object>>
    //     0x51c0ac: ldr             x1, [PP, #0x2290]  ; [pp+0x2290] TypeArguments: <List<Object>>
    // 0x51c0b0: r0 = dx()
    //     0x51c0b0: bl              #0x5136ac  ; AllocatedxStub -> dx (size=0x2c)
    // 0x51c0b4: mov             x1, x0
    // 0x51c0b8: r2 = "during a platform message callback"
    //     0x51c0b8: ldr             x2, [PP, #0x2ee0]  ; [pp+0x2ee0] "during a platform message callback"
    // 0x51c0bc: r3 = Instance_Vw
    //     0x51c0bc: ldr             x3, [PP, #0x22a0]  ; [pp+0x22a0] Obj!Vw@36bb31
    // 0x51c0c0: stur            x0, [fp, #-0x88]
    // 0x51c0c4: r0 = call 0x19ac78
    //     0x51c0c4: bl              #0x19ac78
    // 0x51c0c8: r0 = hx()
    //     0x51c0c8: bl              #0x513784  ; AllocatehxStub -> hx (size=0x14)
    // 0x51c0cc: mov             x1, x0
    // 0x51c0d0: ldur            x0, [fp, #-0x78]
    // 0x51c0d4: StoreField: r1->field_7 = r0
    //     0x51c0d4: stur            w0, [x1, #7]
    // 0x51c0d8: ldur            x2, [fp, #-0x80]
    // 0x51c0dc: StoreField: r1->field_b = r2
    //     0x51c0dc: stur            w2, [x1, #0xb]
    // 0x51c0e0: r3 = false
    //     0x51c0e0: add             x3, NULL, #0x30  ; false
    // 0x51c0e4: StoreField: r1->field_f = r3
    //     0x51c0e4: stur            w3, [x1, #0xf]
    // 0x51c0e8: r0 = call 0x17d558
    //     0x51c0e8: bl              #0x17d558
    // 0x51c0ec: ldur            x0, [fp, #-0x20]
    // 0x51c0f0: mov             x1, x0
    // 0x51c0f4: r0 = Null
    //     0x51c0f4: mov             x0, NULL
    // 0x51c0f8: cmp             w1, NULL
    // 0x51c0fc: b.eq            #0x51c160
    // 0x51c100: stp             x0, x1, [SP]
    // 0x51c104: mov             x0, x1
    // 0x51c108: ClosureCall
    //     0x51c108: ldr             x4, [PP, #0x298]  ; [pp+0x298] List(5) [0, 0x2, 0x2, 0x2, Null]
    //     0x51c10c: ldur            x2, [x0, #0x1f]
    //     0x51c110: blr             x2
    // 0x51c114: r0 = Null
    //     0x51c114: mov             x0, NULL
    // 0x51c118: r0 = ReturnAsyncNotFuture()
    //     0x51c118: b               #0x519244  ; ReturnAsyncNotFutureStub
    // 0x51c11c: sub             SP, fp, #0xa0
    // 0x51c120: mov             x2, x0
    // 0x51c124: stur            x0, [fp, #-0x78]
    // 0x51c128: ldur            x0, [fp, #-0x20]
    // 0x51c12c: stur            x1, [fp, #-0x80]
    // 0x51c130: cmp             w0, NULL
    // 0x51c134: b.eq            #0x51c164
    // 0x51c138: stp             NULL, x0, [SP]
    // 0x51c13c: ClosureCall
    //     0x51c13c: ldr             x4, [PP, #0x298]  ; [pp+0x298] List(5) [0, 0x2, 0x2, 0x2, Null]
    //     0x51c140: ldur            x2, [x0, #0x1f]
    //     0x51c144: blr             x2
    // 0x51c148: ldur            x0, [fp, #-0x78]
    // 0x51c14c: ldur            x1, [fp, #-0x80]
    // 0x51c150: r0 = ReThrow()
    //     0x51c150: bl              #0x5527b0  ; ReThrowStub
    // 0x51c154: brk             #0
    // 0x51c158: r0 = StackOverflowSharedWithoutFPURegs()
    //     0x51c158: bl              #0x554734  ; StackOverflowSharedWithoutFPURegsStub
    // 0x51c15c: b               #0x51c050
    // 0x51c160: r0 = NullErrorSharedWithoutFPURegs()
    //     0x51c160: bl              #0x554e8c  ; NullErrorSharedWithoutFPURegsStub
    // 0x51c164: r0 = NullErrorSharedWithoutFPURegs()
    //     0x51c164: bl              #0x554e8c  ; NullErrorSharedWithoutFPURegsStub
  }
}
