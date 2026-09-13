// lib: , url: aZf

// class id: 1048660, size: 0x8
class :: {
}

// class id: 1592, size: 0x10, field offset: 0x8
abstract class tx extends Object {

  [closure] Null <anonymous closure>(dynamic) {
    // ** addr: 0x53bce8, size: 0xb4
    // 0x53bce8: EnterFrame
    //     0x53bce8: stp             fp, lr, [SP, #-0x10]!
    //     0x53bcec: mov             fp, SP
    // 0x53bcf0: AllocStack(0x50)
    //     0x53bcf0: sub             SP, SP, #0x50
    // 0x53bcf4: SetupParameters([dynamic _ /* r0 */])
    //     0x53bcf4: ldr             x0, [fp, #0x10]
    //     0x53bcf8: ldur            w1, [x0, #0x17]
    //     0x53bcfc: add             x1, x1, HEAP, lsl #32
    // 0x53bd00: CheckStackOverflow
    //     0x53bd00: ldr             x16, [THR, #0x38]  ; THR::stack_limit
    //     0x53bd04: cmp             SP, x16
    //     0x53bd08: b.ls            #0x53bd94
    // 0x53bd0c: LoadField: r0 = r1->field_f
    //     0x53bd0c: ldur            w0, [x1, #0xf]
    // 0x53bd10: DecompressPointer r0
    //     0x53bd10: add             x0, x0, HEAP, lsl #32
    // 0x53bd14: LoadField: r1 = r0->field_7
    //     0x53bd14: ldur            x1, [x0, #7]
    // 0x53bd18: sub             x2, x1, #1
    // 0x53bd1c: StoreField: r0->field_7 = r2
    //     0x53bd1c: stur            x2, [x0, #7]
    // 0x53bd20: cmp             x2, #0
    // 0x53bd24: b.gt            #0x53bd84
    // 0x53bd28: mov             x1, x0
    // 0x53bd2c: r0 = call 0x37be40
    //     0x53bd2c: bl              #0x37be40
    // 0x53bd30: b               #0x53bd84
    // 0x53bd34: sub             SP, fp, #0x50
    // 0x53bd38: mov             x2, x0
    // 0x53bd3c: stur            x0, [fp, #-0x48]
    // 0x53bd40: mov             x0, x1
    // 0x53bd44: stur            x1, [fp, #-0x50]
    // 0x53bd48: r1 = <List<Object>>
    //     0x53bd48: ldr             x1, [PP, #0x2290]  ; [pp+0x2290] TypeArguments: <List<Object>>
    // 0x53bd4c: r0 = dx()
    //     0x53bd4c: bl              #0x5136ac  ; AllocatedxStub -> dx (size=0x2c)
    // 0x53bd50: mov             x1, x0
    // 0x53bd54: r2 = "while handling pending events"
    //     0x53bd54: ldr             x2, [PP, #0x27a0]  ; [pp+0x27a0] "while handling pending events"
    // 0x53bd58: r3 = Instance_Vw
    //     0x53bd58: ldr             x3, [PP, #0x22a0]  ; [pp+0x22a0] Obj!Vw@36bb31
    // 0x53bd5c: r0 = call 0x19ac78
    //     0x53bd5c: bl              #0x19ac78
    // 0x53bd60: r0 = hx()
    //     0x53bd60: bl              #0x513784  ; AllocatehxStub -> hx (size=0x14)
    // 0x53bd64: mov             x1, x0
    // 0x53bd68: ldur            x0, [fp, #-0x48]
    // 0x53bd6c: StoreField: r1->field_7 = r0
    //     0x53bd6c: stur            w0, [x1, #7]
    // 0x53bd70: ldur            x0, [fp, #-0x50]
    // 0x53bd74: StoreField: r1->field_b = r0
    //     0x53bd74: stur            w0, [x1, #0xb]
    // 0x53bd78: r0 = false
    //     0x53bd78: add             x0, NULL, #0x30  ; false
    // 0x53bd7c: StoreField: r1->field_f = r0
    //     0x53bd7c: stur            w0, [x1, #0xf]
    // 0x53bd80: r0 = call 0x17d558
    //     0x53bd80: bl              #0x17d558
    // 0x53bd84: r0 = Null
    //     0x53bd84: mov             x0, NULL
    // 0x53bd88: LeaveFrame
    //     0x53bd88: mov             SP, fp
    //     0x53bd8c: ldp             fp, lr, [SP], #0x10
    // 0x53bd90: ret
    //     0x53bd90: ret             
    // 0x53bd94: r0 = StackOverflowSharedWithoutFPURegs()
    //     0x53bd94: bl              #0x554734  ; StackOverflowSharedWithoutFPURegsStub
    // 0x53bd98: b               #0x53bd0c
  }
}
