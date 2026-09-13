// lib: , url: ncg

// class id: 1048815, size: 0x8
class :: {
}

// class id: 1264, size: 0x8, field offset: 0x8
//   const constructor, 
abstract class GF extends Object {

  GF +(GF, GF) {
    // ** addr: 0x526e98, size: 0x68
    // 0x526e98: EnterFrame
    //     0x526e98: stp             fp, lr, [SP, #-0x10]!
    //     0x526e9c: mov             fp, SP
    // 0x526ea0: ldr             x0, [fp, #0x10]
    // 0x526ea4: r2 = Null
    //     0x526ea4: mov             x2, NULL
    // 0x526ea8: r1 = Null
    //     0x526ea8: mov             x1, NULL
    // 0x526eac: r4 = 59
    //     0x526eac: movz            x4, #0x3b
    // 0x526eb0: branchIfSmi(r0, 0x526ebc)
    //     0x526eb0: tbz             w0, #0, #0x526ebc
    // 0x526eb4: r4 = LoadClassIdInstr(r0)
    //     0x526eb4: ldur            x4, [x0, #-1]
    //     0x526eb8: ubfx            x4, x4, #0xc, #0x14
    // 0x526ebc: sub             x4, x4, #0x4f2
    // 0x526ec0: cmp             x4, #0xc
    // 0x526ec4: b.ls            #0x526edc
    // 0x526ec8: r8 = GF
    //     0x526ec8: add             x8, PP, #0x18, lsl #12  ; [pp+0x18d80] Type: GF
    //     0x526ecc: ldr             x8, [x8, #0xd80]
    // 0x526ed0: r3 = Null
    //     0x526ed0: add             x3, PP, #0x18, lsl #12  ; [pp+0x18ec0] Null
    //     0x526ed4: ldr             x3, [x3, #0xec0]
    // 0x526ed8: r0 = DefaultTypeTest()
    //     0x526ed8: bl              #0x5523c0  ; DefaultTypeTestStub
    // 0x526edc: r0 = "Attempt to execute code removed by Dart AOT compiler (TFA)"
    //     0x526edc: ldr             x0, [PP, #0x6d0]  ; [pp+0x6d0] "Attempt to execute code removed by Dart AOT compiler (TFA)"
    // 0x526ee0: r0 = Throw()
    //     0x526ee0: bl              #0x5527dc  ; ThrowStub
    // 0x526ee4: brk             #0
  }
}

// class id: 1269, size: 0xc, field offset: 0x8
//   const constructor, 
abstract class oL extends GF {

  [closure] static oL? qkb(dynamic, oL?, oL?, double) {
    // ** addr: 0x3ffd9c, size: -0x1
  }
}

// class id: 1735, size: 0x20, field offset: 0x8
//   const constructor, 
class nL extends _au {

  jq field_8;
  _Mint field_c;
  mL field_14;
  _Double field_18;
}

// class id: 3490, size: 0x14, field offset: 0x14
enum mL extends _Enum {

  _Mint field_8;
  _OneByteString field_10;
}
