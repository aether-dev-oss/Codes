// lib: , url: pZf

// class id: 1048670, size: 0x8
class :: {
}

// class id: 1490, size: 0x8, field offset: 0x8
abstract class _Zx extends Object {
}

// class id: 1491, size: 0x14, field offset: 0x8
class _cy extends _Zx {
}

// class id: 1492, size: 0x14, field offset: 0x8
class _by extends _Zx {

  static late final _by Pi; // offset: 0x5c0
  static late final List<Object?> _zEb; // offset: 0x5c4
}

// class id: 1493, size: 0xc, field offset: 0x8
class _ay extends _Zx {
}

// class id: 1494, size: 0x10, field offset: 0x8
//   const constructor, 
class Yx<X0, X1> extends Object {

  X1? [](Yx<X0, X1>, X0) {
    // ** addr: 0x547cd8, size: 0x4c
    // 0x547cd8: EnterFrame
    //     0x547cd8: stp             fp, lr, [SP, #-0x10]!
    //     0x547cdc: mov             fp, SP
    // 0x547ce0: CheckStackOverflow
    //     0x547ce0: ldr             x16, [THR, #0x38]  ; THR::stack_limit
    //     0x547ce4: cmp             SP, x16
    //     0x547ce8: b.ls            #0x547d04
    // 0x547cec: ldr             x1, [fp, #0x18]
    // 0x547cf0: ldr             x2, [fp, #0x10]
    // 0x547cf4: r0 = call 0x1ab7f4
    //     0x547cf4: bl              #0x1ab7f4
    // 0x547cf8: LeaveFrame
    //     0x547cf8: mov             SP, fp
    //     0x547cfc: ldp             fp, lr, [SP], #0x10
    // 0x547d00: ret
    //     0x547d00: ret             
    // 0x547d04: r0 = StackOverflowSharedWithoutFPURegs()
    //     0x547d04: bl              #0x554734  ; StackOverflowSharedWithoutFPURegsStub
    // 0x547d08: b               #0x547cec
  }
}
