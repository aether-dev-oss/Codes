// lib: , url: dYf

// class id: 1048616, size: 0x8
class :: {
}

// class id: 2703, size: 0x20, field offset: 0x8
class ht extends Object
    implements ft {
}

// class id: 3615, size: 0x10, field offset: 0xc
//   const constructor, 
class gt extends Iterable<dynamic>
    implements et {

  _OneByteString field_c;

  et +(gt, et) {
    // ** addr: 0x51e08c, size: 0x64
    // 0x51e08c: EnterFrame
    //     0x51e08c: stp             fp, lr, [SP, #-0x10]!
    //     0x51e090: mov             fp, SP
    // 0x51e094: ldr             x0, [fp, #0x10]
    // 0x51e098: r2 = Null
    //     0x51e098: mov             x2, NULL
    // 0x51e09c: r1 = Null
    //     0x51e09c: mov             x1, NULL
    // 0x51e0a0: r4 = 59
    //     0x51e0a0: movz            x4, #0x3b
    // 0x51e0a4: branchIfSmi(r0, 0x51e0b0)
    //     0x51e0a4: tbz             w0, #0, #0x51e0b0
    // 0x51e0a8: r4 = LoadClassIdInstr(r0)
    //     0x51e0a8: ldur            x4, [x0, #-1]
    //     0x51e0ac: ubfx            x4, x4, #0xc, #0x14
    // 0x51e0b0: cmp             x4, #0xe1f
    // 0x51e0b4: b.eq            #0x51e0cc
    // 0x51e0b8: r8 = et
    //     0x51e0b8: add             x8, PP, #0x1a, lsl #12  ; [pp+0x1a730] Type: et
    //     0x51e0bc: ldr             x8, [x8, #0x730]
    // 0x51e0c0: r3 = Null
    //     0x51e0c0: add             x3, PP, #0x1a, lsl #12  ; [pp+0x1a738] Null
    //     0x51e0c4: ldr             x3, [x3, #0x738]
    // 0x51e0c8: r0 = DefaultTypeTest()
    //     0x51e0c8: bl              #0x5523c0  ; DefaultTypeTestStub
    // 0x51e0cc: r0 = "Attempt to execute code removed by Dart AOT compiler (TFA)"
    //     0x51e0cc: ldr             x0, [PP, #0x6d0]  ; [pp+0x6d0] "Attempt to execute code removed by Dart AOT compiler (TFA)"
    // 0x51e0d0: r0 = Throw()
    //     0x51e0d0: bl              #0x5527dc  ; ThrowStub
    // 0x51e0d4: brk             #0
  }
  [closure] bool zj(dynamic, Object?) {
    // ** addr: 0x22a760, size: -0x1
  }
}
