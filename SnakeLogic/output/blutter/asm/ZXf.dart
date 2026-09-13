// lib: , url: ZXf

// class id: 1048612, size: 0x8
class :: {
}

// class id: 2708, size: 0xc, field offset: 0x8
abstract class bt extends Object {

  [closure] String Eif(dynamic, List<int>) {
    // ** addr: 0x53403c, size: 0x88
    // 0x53403c: EnterFrame
    //     0x53403c: stp             fp, lr, [SP, #-0x10]!
    //     0x534040: mov             fp, SP
    // 0x534044: AllocStack(0x38)
    //     0x534044: sub             SP, SP, #0x38
    // 0x534048: SetupParameters([dynamic _ /* r0 */])
    //     0x534048: ldr             x0, [fp, #0x18]
    //     0x53404c: ldur            w1, [x0, #0x17]
    //     0x534050: add             x1, x1, HEAP, lsl #32
    // 0x534054: CheckStackOverflow
    //     0x534054: ldr             x16, [THR, #0x38]  ; THR::stack_limit
    //     0x534058: cmp             SP, x16
    //     0x53405c: b.ls            #0x5340bc
    // 0x534060: LoadField: r0 = r1->field_f
    //     0x534060: ldur            w0, [x1, #0xf]
    // 0x534064: DecompressPointer r0
    //     0x534064: add             x0, x0, HEAP, lsl #32
    // 0x534068: tbnz            w0, #4, #0x534080
    // 0x53406c: ldr             x2, [fp, #0x10]
    // 0x534070: r1 = Instance_Jf
    //     0x534070: ldr             x1, [PP, #0x770]  ; [pp+0x770] Obj!Jf@368191
    // 0x534074: r4 = const [0, 0x2, 0, 0x2, null]
    //     0x534074: ldr             x4, [PP, #0x168]  ; [pp+0x168] List(5) [0, 0x2, 0, 0x2, Null]
    // 0x534078: r0 = call 0x431504
    //     0x534078: bl              #0x431504
    // 0x53407c: b               #0x534090
    // 0x534080: ldr             x1, [fp, #0x10]
    // 0x534084: r2 = 0
    //     0x534084: movz            x2, #0
    // 0x534088: r3 = Null
    //     0x534088: mov             x3, NULL
    // 0x53408c: r0 = call 0x182650
    //     0x53408c: bl              #0x182650
    // 0x534090: LeaveFrame
    //     0x534090: mov             SP, fp
    //     0x534094: ldp             fp, lr, [SP], #0x10
    // 0x534098: ret
    //     0x534098: ret             
    // 0x53409c: sub             SP, fp, #0x38
    // 0x5340a0: ldr             x1, [fp, #0x10]
    // 0x5340a4: r2 = 0
    //     0x5340a4: movz            x2, #0
    // 0x5340a8: r3 = Null
    //     0x5340a8: mov             x3, NULL
    // 0x5340ac: r0 = call 0x182650
    //     0x5340ac: bl              #0x182650
    // 0x5340b0: LeaveFrame
    //     0x5340b0: mov             SP, fp
    //     0x5340b4: ldp             fp, lr, [SP], #0x10
    // 0x5340b8: ret
    //     0x5340b8: ret             
    // 0x5340bc: r0 = StackOverflowSharedWithoutFPURegs()
    //     0x5340bc: bl              #0x554734  ; StackOverflowSharedWithoutFPURegsStub
    // 0x5340c0: b               #0x534060
  }
}
