// lib: , url: ucg

// class id: 1048822, size: 0x8
class :: {
}

// class id: 1190, size: 0x28, field offset: 0x8
//   const constructor, 
class BL extends Object {
}

// class id: 2805, size: 0x18, field offset: 0x10
//   const constructor, 
abstract class OC<X0> extends jq {

  jq? [](OC<X0>, X0) {
    // ** addr: 0x537218, size: 0x8c
    // 0x537218: EnterFrame
    //     0x537218: stp             fp, lr, [SP, #-0x10]!
    //     0x53721c: mov             fp, SP
    // 0x537220: CheckStackOverflow
    //     0x537220: ldr             x16, [THR, #0x38]  ; THR::stack_limit
    //     0x537224: cmp             SP, x16
    //     0x537228: b.ls            #0x537284
    // 0x53722c: ldr             x3, [fp, #0x18]
    // 0x537230: LoadField: r2 = r3->field_f
    //     0x537230: ldur            w2, [x3, #0xf]
    // 0x537234: DecompressPointer r2
    //     0x537234: add             x2, x2, HEAP, lsl #32
    // 0x537238: ldr             x0, [fp, #0x10]
    // 0x53723c: r1 = Null
    //     0x53723c: mov             x1, NULL
    // 0x537240: cmp             w2, NULL
    // 0x537244: b.eq            #0x537264
    // 0x537248: ArrayLoad: r4 = r2[0]  ; List_4
    //     0x537248: ldur            w4, [x2, #0x17]
    // 0x53724c: DecompressPointer r4
    //     0x53724c: add             x4, x4, HEAP, lsl #32
    // 0x537250: r8 = X0
    //     0x537250: ldr             x8, [PP, #0x78]  ; [pp+0x78] TypeParameter: X0
    // 0x537254: LoadField: r9 = r4->field_7
    //     0x537254: ldur            x9, [x4, #7]
    // 0x537258: r3 = Null
    //     0x537258: add             x3, PP, #0x1b, lsl #12  ; [pp+0x1b3b0] Null
    //     0x53725c: ldr             x3, [x3, #0x3b0]
    // 0x537260: blr             x9
    // 0x537264: ldr             x0, [fp, #0x18]
    // 0x537268: LoadField: r1 = r0->field_13
    //     0x537268: ldur            w1, [x0, #0x13]
    // 0x53726c: DecompressPointer r1
    //     0x53726c: add             x1, x1, HEAP, lsl #32
    // 0x537270: ldr             x2, [fp, #0x10]
    // 0x537274: r0 = call 0x4f74a8
    //     0x537274: bl              #0x4f74a8
    // 0x537278: LeaveFrame
    //     0x537278: mov             SP, fp
    //     0x53727c: ldp             fp, lr, [SP], #0x10
    // 0x537280: ret
    //     0x537280: ret             
    // 0x537284: r0 = StackOverflowSharedWithoutFPURegs()
    //     0x537284: bl              #0x554734  ; StackOverflowSharedWithoutFPURegsStub
    // 0x537288: b               #0x53722c
  }
}
