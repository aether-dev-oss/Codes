// lib: , url: Yhg

// class id: 1049114, size: 0x8
class :: {

  static late final RegExp _XYd; // offset: 0xadc

  [closure] static String <anonymous closure>(dynamic, String) {
    // ** addr: 0x547678, size: 0x54
    // 0x547678: EnterFrame
    //     0x547678: stp             fp, lr, [SP, #-0x10]!
    //     0x54767c: mov             fp, SP
    // 0x547680: AllocStack(0x28)
    //     0x547680: sub             SP, SP, #0x28
    // 0x547684: CheckStackOverflow
    //     0x547684: ldr             x16, [THR, #0x38]  ; THR::stack_limit
    //     0x547688: cmp             SP, x16
    //     0x54768c: b.ls            #0x5476c4
    // 0x547690: ldr             x1, [fp, #0x10]
    // 0x547694: r0 = call 0x40dc60
    //     0x547694: bl              #0x40dc60
    // 0x547698: mov             x1, x0
    // 0x54769c: b               #0x5476ac
    // 0x5476a0: sub             SP, fp, #0x28
    // 0x5476a4: ldr             x0, [fp, #0x10]
    // 0x5476a8: mov             x1, x0
    // 0x5476ac: r0 = call 0x39a4a0
    //     0x5476ac: bl              #0x39a4a0
    // 0x5476b0: mov             x1, x0
    // 0x5476b4: r0 = call 0x34be80
    //     0x5476b4: bl              #0x34be80
    // 0x5476b8: LeaveFrame
    //     0x5476b8: mov             SP, fp
    //     0x5476bc: ldp             fp, lr, [SP], #0x10
    // 0x5476c0: ret
    //     0x5476c0: ret             
    // 0x5476c4: r0 = StackOverflowSharedWithoutFPURegs()
    //     0x5476c4: bl              #0x554734  ; StackOverflowSharedWithoutFPURegsStub
    // 0x5476c8: b               #0x547690
  }
  [closure] static String eZd(dynamic, wa) {
    // ** addr: 0x39a970, size: -0x1
  }
  [closure] static String <anonymous closure>(dynamic, wa) {
    // ** addr: 0x40e238, size: -0x1
  }
}

// class id: 510, size: 0x10, field offset: 0x8
class cla extends Object {
}
