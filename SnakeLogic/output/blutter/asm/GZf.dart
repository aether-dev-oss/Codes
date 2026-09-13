// lib: , url: GZf

// class id: 1048687, size: 0x8
class :: {
}

// class id: 1391, size: 0x14, field offset: 0x8
class IA extends Object {
}

// class id: 1392, size: 0x10, field offset: 0x8
class HA extends Object {

  late double jid; // offset: 0xc
}

// class id: 1393, size: 0x14, field offset: 0x8
class _GA extends Object {
}

// class id: 1394, size: 0x1c, field offset: 0x8
class _FA extends Object {

  double [](_FA, int) {
    // ** addr: 0x54fbcc, size: 0xdc
    // 0x54fbcc: EnterFrame
    //     0x54fbcc: stp             fp, lr, [SP, #-0x10]!
    //     0x54fbd0: mov             fp, SP
    // 0x54fbd4: ldr             x0, [fp, #0x10]
    // 0x54fbd8: r2 = Null
    //     0x54fbd8: mov             x2, NULL
    // 0x54fbdc: r1 = Null
    //     0x54fbdc: mov             x1, NULL
    // 0x54fbe0: branchIfSmi(r0, 0x54fc08)
    //     0x54fbe0: tbz             w0, #0, #0x54fc08
    // 0x54fbe4: r4 = LoadClassIdInstr(r0)
    //     0x54fbe4: ldur            x4, [x0, #-1]
    //     0x54fbe8: ubfx            x4, x4, #0xc, #0x14
    // 0x54fbec: sub             x4, x4, #0x3b
    // 0x54fbf0: cmp             x4, #1
    // 0x54fbf4: b.ls            #0x54fc08
    // 0x54fbf8: r8 = int
    //     0x54fbf8: ldr             x8, [PP, #0xf80]  ; [pp+0xf80] Type: int
    // 0x54fbfc: r3 = Null
    //     0x54fbfc: add             x3, PP, #0x15, lsl #12  ; [pp+0x15d38] Null
    //     0x54fc00: ldr             x3, [x3, #0xd38]
    // 0x54fc04: r0 = int()
    //     0x54fc04: bl              #0x55b758  ; IsType_int_Stub
    // 0x54fc08: ldr             x2, [fp, #0x18]
    // 0x54fc0c: ArrayLoad: r3 = r2[0]  ; List_4
    //     0x54fc0c: ldur            w3, [x2, #0x17]
    // 0x54fc10: DecompressPointer r3
    //     0x54fc10: add             x3, x3, HEAP, lsl #32
    // 0x54fc14: LoadField: r4 = r2->field_7
    //     0x54fc14: ldur            x4, [x2, #7]
    // 0x54fc18: ldr             x2, [fp, #0x10]
    // 0x54fc1c: r5 = LoadInt32Instr(r2)
    //     0x54fc1c: sbfx            x5, x2, #1, #0x1f
    //     0x54fc20: tbz             w2, #0, #0x54fc28
    //     0x54fc24: ldur            x5, [x2, #7]
    // 0x54fc28: add             x2, x5, x4
    // 0x54fc2c: LoadField: r4 = r3->field_13
    //     0x54fc2c: ldur            w4, [x3, #0x13]
    // 0x54fc30: r0 = LoadInt32Instr(r4)
    //     0x54fc30: sbfx            x0, x4, #1, #0x1f
    // 0x54fc34: mov             x1, x2
    // 0x54fc38: cmp             x1, x0
    // 0x54fc3c: b.hs            #0x54fc7c
    // 0x54fc40: ArrayLoad: d0 = r3[r2]  ; List_8
    //     0x54fc40: add             x16, x3, x2, lsl #3
    //     0x54fc44: ldur            d0, [x16, #0x17]
    // 0x54fc48: r0 = inline_Allocate_Double()
    //     0x54fc48: ldp             x0, x1, [THR, #0x50]  ; THR::top
    //     0x54fc4c: add             x0, x0, #0x10
    //     0x54fc50: cmp             x1, x0
    //     0x54fc54: b.ls            #0x54fc80
    //     0x54fc58: str             x0, [THR, #0x50]  ; THR::top
    //     0x54fc5c: sub             x0, x0, #0xf
    //     0x54fc60: movz            x1, #0xd15c
    //     0x54fc64: movk            x1, #0x3, lsl #16
    //     0x54fc68: stur            x1, [x0, #-1]
    // 0x54fc6c: StoreField: r0->field_7 = d0
    //     0x54fc6c: stur            d0, [x0, #7]
    // 0x54fc70: LeaveFrame
    //     0x54fc70: mov             SP, fp
    //     0x54fc74: ldp             fp, lr, [SP], #0x10
    // 0x54fc78: ret
    //     0x54fc78: ret             
    // 0x54fc7c: r0 = RangeErrorSharedWithoutFPURegs()
    //     0x54fc7c: bl              #0x554b7c  ; RangeErrorSharedWithoutFPURegsStub
    // 0x54fc80: SaveReg d0
    //     0x54fc80: str             q0, [SP, #-0x10]!
    // 0x54fc84: r0 = AllocateDouble()
    //     0x54fc84: bl              #0x554584  ; AllocateDoubleStub
    // 0x54fc88: RestoreReg d0
    //     0x54fc88: ldr             q0, [SP], #0x10
    // 0x54fc8c: b               #0x54fc6c
  }
}
