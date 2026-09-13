// lib: , url: rmg

// class id: 1049347, size: 0x8
class :: {
}

// class id: 202, size: 0x1c, field offset: 0x8
class ota<X0, X1> extends Object {

  X1 [](ota<X0, X1>, X0) {
    // ** addr: 0x546804, size: 0x4c
    // 0x546804: EnterFrame
    //     0x546804: stp             fp, lr, [SP, #-0x10]!
    //     0x546808: mov             fp, SP
    // 0x54680c: CheckStackOverflow
    //     0x54680c: ldr             x16, [THR, #0x38]  ; THR::stack_limit
    //     0x546810: cmp             SP, x16
    //     0x546814: b.ls            #0x546830
    // 0x546818: ldr             x1, [fp, #0x18]
    // 0x54681c: ldr             x2, [fp, #0x10]
    // 0x546820: r0 = call 0x3eca68
    //     0x546820: bl              #0x3eca68
    // 0x546824: LeaveFrame
    //     0x546824: mov             SP, fp
    //     0x546828: ldp             fp, lr, [SP], #0x10
    // 0x54682c: ret
    //     0x54682c: ret             
    // 0x546830: r0 = StackOverflowSharedWithoutFPURegs()
    //     0x546830: bl              #0x554734  ; StackOverflowSharedWithoutFPURegsStub
    // 0x546834: b               #0x546818
  }
}
