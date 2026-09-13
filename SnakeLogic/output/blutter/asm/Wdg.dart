// lib: , url: Wdg

// class id: 1048895, size: 0x8
class :: {
}

// class id: 844, size: 0x1c, field offset: 0x8
//   const constructor, 
class CS extends Object {

  bool field_8;
  _OneByteString field_c;
  _ImmutableList<String> field_10;
  yS field_14;

  Map<String, dynamic>? wVa(CS) {
    // ** addr: 0x55044c, size: 0x48
    // 0x55044c: EnterFrame
    //     0x55044c: stp             fp, lr, [SP, #-0x10]!
    //     0x550450: mov             fp, SP
    // 0x550454: CheckStackOverflow
    //     0x550454: ldr             x16, [THR, #0x38]  ; THR::stack_limit
    //     0x550458: cmp             SP, x16
    //     0x55045c: b.ls            #0x550474
    // 0x550460: ldr             x1, [fp, #0x10]
    // 0x550464: r0 = call 0x1f5aa4
    //     0x550464: bl              #0x1f5aa4
    // 0x550468: LeaveFrame
    //     0x550468: mov             SP, fp
    //     0x55046c: ldp             fp, lr, [SP], #0x10
    // 0x550470: ret
    //     0x550470: ret             
    // 0x550474: r0 = StackOverflowSharedWithoutFPURegs()
    //     0x550474: bl              #0x554734  ; StackOverflowSharedWithoutFPURegsStub
    // 0x550478: b               #0x550460
  }
}

// class id: 1220, size: 0x8, field offset: 0x8
abstract class PJ extends Object {
}
