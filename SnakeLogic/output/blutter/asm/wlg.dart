// lib: , url: wlg

// class id: 1049310, size: 0x8
class :: {
}

// class id: 310, size: 0x28, field offset: 0x8
//   const constructor, 
class cq extends Object {

  _Mint field_8;
  _Mint field_10;
  _Mint field_18;
  _Mint field_20;
}

// class id: 311, size: 0x18, field offset: 0x8
//   const constructor, 
class ora extends Object {

  _Mint field_8;
  _Mint field_10;

  ora +(ora, ora) {
    // ** addr: 0x537e44, size: 0x64
    // 0x537e44: EnterFrame
    //     0x537e44: stp             fp, lr, [SP, #-0x10]!
    //     0x537e48: mov             fp, SP
    // 0x537e4c: ldr             x0, [fp, #0x10]
    // 0x537e50: r2 = Null
    //     0x537e50: mov             x2, NULL
    // 0x537e54: r1 = Null
    //     0x537e54: mov             x1, NULL
    // 0x537e58: r4 = 59
    //     0x537e58: movz            x4, #0x3b
    // 0x537e5c: branchIfSmi(r0, 0x537e68)
    //     0x537e5c: tbz             w0, #0, #0x537e68
    // 0x537e60: r4 = LoadClassIdInstr(r0)
    //     0x537e60: ldur            x4, [x0, #-1]
    //     0x537e64: ubfx            x4, x4, #0xc, #0x14
    // 0x537e68: cmp             x4, #0x137
    // 0x537e6c: b.eq            #0x537e84
    // 0x537e70: r8 = ora
    //     0x537e70: add             x8, PP, #0x23, lsl #12  ; [pp+0x23080] Type: ora
    //     0x537e74: ldr             x8, [x8, #0x80]
    // 0x537e78: r3 = Null
    //     0x537e78: add             x3, PP, #0x23, lsl #12  ; [pp+0x23088] Null
    //     0x537e7c: ldr             x3, [x3, #0x88]
    // 0x537e80: r0 = ora()
    //     0x537e80: bl              #0x537e90  ; IsType_ora_Stub
    // 0x537e84: r0 = "Attempt to execute code removed by Dart AOT compiler (TFA)"
    //     0x537e84: ldr             x0, [PP, #0x6d0]  ; [pp+0x6d0] "Attempt to execute code removed by Dart AOT compiler (TFA)"
    // 0x537e88: r0 = Throw()
    //     0x537e88: bl              #0x5527dc  ; ThrowStub
    // 0x537e8c: brk             #0
  }
}
