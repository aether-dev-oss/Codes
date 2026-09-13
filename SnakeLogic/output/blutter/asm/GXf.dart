// lib: , url: GXf

// class id: 1048593, size: 0x8
class :: {
}

// class id: 3616, size: 0x14, field offset: 0xc
class rs extends Iterable<dynamic> {

  ss [](rs, int) {
    // ** addr: 0x533fe8, size: 0x60
    // 0x533fe8: EnterFrame
    //     0x533fe8: stp             fp, lr, [SP, #-0x10]!
    //     0x533fec: mov             fp, SP
    // 0x533ff0: ldr             x0, [fp, #0x10]
    // 0x533ff4: r2 = Null
    //     0x533ff4: mov             x2, NULL
    // 0x533ff8: r1 = Null
    //     0x533ff8: mov             x1, NULL
    // 0x533ffc: branchIfSmi(r0, 0x534024)
    //     0x533ffc: tbz             w0, #0, #0x534024
    // 0x534000: r4 = LoadClassIdInstr(r0)
    //     0x534000: ldur            x4, [x0, #-1]
    //     0x534004: ubfx            x4, x4, #0xc, #0x14
    // 0x534008: sub             x4, x4, #0x3b
    // 0x53400c: cmp             x4, #1
    // 0x534010: b.ls            #0x534024
    // 0x534014: r8 = int
    //     0x534014: ldr             x8, [PP, #0xf80]  ; [pp+0xf80] Type: int
    // 0x534018: r3 = Null
    //     0x534018: add             x3, PP, #0x16, lsl #12  ; [pp+0x16eb8] Null
    //     0x53401c: ldr             x3, [x3, #0xeb8]
    // 0x534020: r0 = int()
    //     0x534020: bl              #0x55b758  ; IsType_int_Stub
    // 0x534024: r0 = "Attempt to execute code removed by Dart AOT compiler (TFA)"
    //     0x534024: ldr             x0, [PP, #0x6d0]  ; [pp+0x6d0] "Attempt to execute code removed by Dart AOT compiler (TFA)"
    // 0x534028: r0 = Throw()
    //     0x534028: bl              #0x5527dc  ; ThrowStub
    // 0x53402c: brk             #0
  }
}
