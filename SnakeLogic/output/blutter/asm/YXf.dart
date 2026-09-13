// lib: , url: YXf

// class id: 1048611, size: 0x8
class :: {
}

// class id: 2709, size: 0x1c, field offset: 0xc
class at extends bt {

  late int _fGa; // offset: 0x18

  int [](at, int) {
    // ** addr: 0x533ba0, size: 0x78
    // 0x533ba0: EnterFrame
    //     0x533ba0: stp             fp, lr, [SP, #-0x10]!
    //     0x533ba4: mov             fp, SP
    // 0x533ba8: ldr             x0, [fp, #0x10]
    // 0x533bac: r2 = Null
    //     0x533bac: mov             x2, NULL
    // 0x533bb0: r1 = Null
    //     0x533bb0: mov             x1, NULL
    // 0x533bb4: branchIfSmi(r0, 0x533bdc)
    //     0x533bb4: tbz             w0, #0, #0x533bdc
    // 0x533bb8: r4 = LoadClassIdInstr(r0)
    //     0x533bb8: ldur            x4, [x0, #-1]
    //     0x533bbc: ubfx            x4, x4, #0xc, #0x14
    // 0x533bc0: sub             x4, x4, #0x3b
    // 0x533bc4: cmp             x4, #1
    // 0x533bc8: b.ls            #0x533bdc
    // 0x533bcc: r8 = int
    //     0x533bcc: ldr             x8, [PP, #0xf80]  ; [pp+0xf80] Type: int
    // 0x533bd0: r3 = Null
    //     0x533bd0: add             x3, PP, #0x16, lsl #12  ; [pp+0x16ea8] Null
    //     0x533bd4: ldr             x3, [x3, #0xea8]
    // 0x533bd8: r0 = int()
    //     0x533bd8: bl              #0x55b758  ; IsType_int_Stub
    // 0x533bdc: ldr             x0, [fp, #0x18]
    // 0x533be0: LoadField: r1 = r0->field_b
    //     0x533be0: ldur            w1, [x0, #0xb]
    // 0x533be4: DecompressPointer r1
    //     0x533be4: add             x1, x1, HEAP, lsl #32
    // 0x533be8: cmp             w1, NULL
    // 0x533bec: b.eq            #0x533bfc
    // 0x533bf0: r0 = "Attempt to execute code removed by Dart AOT compiler (TFA)"
    //     0x533bf0: ldr             x0, [PP, #0x6d0]  ; [pp+0x6d0] "Attempt to execute code removed by Dart AOT compiler (TFA)"
    // 0x533bf4: r0 = Throw()
    //     0x533bf4: bl              #0x5527dc  ; ThrowStub
    // 0x533bf8: brk             #0
    // 0x533bfc: r0 = NullCastErrorSharedWithoutFPURegs()
    //     0x533bfc: bl              #0x554cdc  ; NullCastErrorSharedWithoutFPURegsStub
  }
}
