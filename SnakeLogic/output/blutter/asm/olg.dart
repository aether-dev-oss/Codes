// lib: , url: olg

// class id: 1049302, size: 0x8
class :: {

  static late final Map<sja, p<void>> _zte; // offset: 0xe94

  [closure] static Future<Lqa> process(dynamic) {
    // ** addr: 0x370504, size: -0x1
  }
  [closure] static Lqa <anonymous closure>(dynamic, void) {
    // ** addr: 0x370460, size: -0x1
  }
}

// class id: 321, size: 0x10, field offset: 0x8
//   const constructor, 
class Uqa extends Object
    implements Ha {
}

// class id: 322, size: 0x30, field offset: 0x8
//   const constructor, 
class _Tqa extends Object {
}

// class id: 323, size: 0x20, field offset: 0x8
//   const constructor, 
class _Sqa extends Object {
}

// class id: 325, size: 0x64, field offset: 0x8
class Qqa extends Rqa {

  static late final Paint _Ese; // offset: 0xe90
  static late final Paint _Dse; // offset: 0xe8c

  [closure] Future<iM> <anonymous closure>(dynamic, Tq) async {
    // ** addr: 0x5397b0, size: 0x234
    // 0x5397b0: EnterFrame
    //     0x5397b0: stp             fp, lr, [SP, #-0x10]!
    //     0x5397b4: mov             fp, SP
    // 0x5397b8: AllocStack(0x98)
    //     0x5397b8: sub             SP, SP, #0x98
    // 0x5397bc: SetupParameters(Qqa this /* r1, fp-0x80 */, dynamic _ /* r2, fp-0x78 */)
    //     0x5397bc: stur            NULL, [fp, #-8]
    //     0x5397c0: movz            x0, #0
    //     0x5397c4: add             x1, fp, w0, sxtw #2
    //     0x5397c8: ldr             x1, [x1, #0x18]
    //     0x5397cc: stur            x1, [fp, #-0x80]
    //     0x5397d0: add             x2, fp, w0, sxtw #2
    //     0x5397d4: ldr             x2, [x2, #0x10]
    //     0x5397d8: stur            x2, [fp, #-0x78]
    //     0x5397dc: ldur            w3, [x1, #0x17]
    //     0x5397e0: add             x3, x3, HEAP, lsl #32
    //     0x5397e4: stur            x3, [fp, #-0x70]
    // 0x5397e8: CheckStackOverflow
    //     0x5397e8: ldr             x16, [THR, #0x38]  ; THR::stack_limit
    //     0x5397ec: cmp             SP, x16
    //     0x5397f0: b.ls            #0x5399cc
    // 0x5397f4: InitAsync() -> Future<iM>
    //     0x5397f4: add             x0, PP, #0x1f, lsl #12  ; [pp+0x1ffa8] TypeArguments: <iM>
    //     0x5397f8: ldr             x0, [x0, #0xfa8]
    //     0x5397fc: bl              #0x519270  ; InitAsyncStub
    // 0x539800: ldur            x1, [fp, #-0x78]
    // 0x539804: r0 = call 0x36c0b0
    //     0x539804: bl              #0x36c0b0
    // 0x539808: mov             x1, x0
    // 0x53980c: stur            x1, [fp, #-0x70]
    // 0x539810: r0 = Await()
    //     0x539810: bl              #0x518e60  ; AwaitStub
    // 0x539814: mov             x1, x0
    // 0x539818: stur            x0, [fp, #-0x70]
    // 0x53981c: r4 = const [0, 0x1, 0, 0x1, null]
    //     0x53981c: ldr             x4, [PP, #0x430]  ; [pp+0x430] List(5) [0, 0x1, 0, 0x1, Null]
    // 0x539820: r0 = __unknown_function__()
    //     0x539820: bl              #0x539cf8  ; [] ::__unknown_function__
    // 0x539824: mov             x1, x0
    // 0x539828: stur            x1, [fp, #-0x80]
    // 0x53982c: r0 = Await()
    //     0x53982c: bl              #0x518e60  ; AwaitStub
    // 0x539830: mov             x1, x0
    // 0x539834: stur            x0, [fp, #-0x80]
    // 0x539838: r0 = __unknown_function__()
    //     0x539838: bl              #0x5399e4  ; [] ::__unknown_function__
    // 0x53983c: mov             x1, x0
    // 0x539840: stur            x1, [fp, #-0x88]
    // 0x539844: r0 = Await()
    //     0x539844: bl              #0x518e60  ; AwaitStub
    // 0x539848: LoadField: r1 = r0->field_b
    //     0x539848: ldur            w1, [x0, #0xb]
    // 0x53984c: DecompressPointer r1
    //     0x53984c: add             x1, x1, HEAP, lsl #32
    // 0x539850: ldur            x0, [fp, #-0x70]
    // 0x539854: stur            x1, [fp, #-0x88]
    // 0x539858: LoadField: r2 = r0->field_7
    //     0x539858: ldur            w2, [x0, #7]
    // 0x53985c: DecompressPointer r2
    //     0x53985c: add             x2, x2, HEAP, lsl #32
    // 0x539860: cmp             w2, NULL
    // 0x539864: b.eq            #0x5399d4
    // 0x539868: LoadField: r3 = r2->field_7
    //     0x539868: ldur            x3, [x2, #7]
    // 0x53986c: ldr             x2, [x3]
    // 0x539870: stur            x2, [fp, #-0x90]
    // 0x539874: cbnz            x2, #0x539884
    // 0x539878: r16 = "A Dart object attempted to access a native peer, but the native peer has been collected (nullptr). This is usually the result of calling methods on a native-backed object when the native resources have already been disposed."
    //     0x539878: ldr             x16, [PP, #0x68]  ; [pp+0x68] "A Dart object attempted to access a native peer, but the native peer has been collected (nullptr). This is usually the result of calling methods on a native-backed object when the native resources have already been disposed."
    // 0x53987c: str             x16, [SP]
    // 0x539880: r0 = _throwNew()
    //     0x539880: bl              #0x177354  ; [dart:core] StateError::_throwNew
    // 0x539884: ldur            x0, [fp, #-0x80]
    // 0x539888: r1 = <Never>
    //     0x539888: ldr             x1, [PP, #0x70]  ; [pp+0x70] TypeArguments: <Never>
    // 0x53988c: r0 = Pointer()
    //     0x53988c: bl              #0x515150  ; AllocatePointerStub -> Pointer<X0 bound NativeType> (size=-0x8)
    // 0x539890: ldur            x1, [fp, #-0x90]
    // 0x539894: StoreField: r0->field_7 = r1
    //     0x539894: stur            x1, [x0, #7]
    // 0x539898: mov             x1, x0
    // 0x53989c: r0 = call 0x36bb30
    //     0x53989c: bl              #0x36bb30
    // 0x5398a0: ldur            x0, [fp, #-0x80]
    // 0x5398a4: LoadField: r1 = r0->field_7
    //     0x5398a4: ldur            w1, [x0, #7]
    // 0x5398a8: DecompressPointer r1
    //     0x5398a8: add             x1, x1, HEAP, lsl #32
    // 0x5398ac: cmp             w1, NULL
    // 0x5398b0: b.eq            #0x5399d8
    // 0x5398b4: LoadField: r2 = r1->field_7
    //     0x5398b4: ldur            x2, [x1, #7]
    // 0x5398b8: ldr             x1, [x2]
    // 0x5398bc: stur            x1, [fp, #-0x90]
    // 0x5398c0: cbnz            x1, #0x5398d0
    // 0x5398c4: r16 = "A Dart object attempted to access a native peer, but the native peer has been collected (nullptr). This is usually the result of calling methods on a native-backed object when the native resources have already been disposed."
    //     0x5398c4: ldr             x16, [PP, #0x68]  ; [pp+0x68] "A Dart object attempted to access a native peer, but the native peer has been collected (nullptr). This is usually the result of calling methods on a native-backed object when the native resources have already been disposed."
    // 0x5398c8: str             x16, [SP]
    // 0x5398cc: r0 = _throwNew()
    //     0x5398cc: bl              #0x177354  ; [dart:core] StateError::_throwNew
    // 0x5398d0: ldur            x0, [fp, #-0x88]
    // 0x5398d4: r1 = <Never>
    //     0x5398d4: ldr             x1, [PP, #0x70]  ; [pp+0x70] TypeArguments: <Never>
    // 0x5398d8: r0 = Pointer()
    //     0x5398d8: bl              #0x515150  ; AllocatePointerStub -> Pointer<X0 bound NativeType> (size=-0x8)
    // 0x5398dc: ldur            x1, [fp, #-0x90]
    // 0x5398e0: StoreField: r0->field_7 = r1
    //     0x5398e0: stur            x1, [x0, #7]
    // 0x5398e4: mov             x1, x0
    // 0x5398e8: r0 = call 0x36ba6c
    //     0x5398e8: bl              #0x36ba6c
    // 0x5398ec: r0 = iM()
    //     0x5398ec: bl              #0x5395b4  ; AllocateiMStub -> iM (size=0x18)
    // 0x5398f0: mov             x1, x0
    // 0x5398f4: ldur            x0, [fp, #-0x88]
    // 0x5398f8: stur            x1, [fp, #-0x70]
    // 0x5398fc: StoreField: r1->field_7 = r0
    //     0x5398fc: stur            w0, [x1, #7]
    // 0x539900: d0 = 1.000000
    //     0x539900: fmov            d0, #1.00000000
    // 0x539904: StoreField: r1->field_b = d0
    //     0x539904: stur            d0, [x1, #0xb]
    // 0x539908: ldur            x0, [fp, #-0x78]
    // 0x53990c: LoadField: r2 = r0->field_7
    //     0x53990c: ldur            w2, [x0, #7]
    // 0x539910: DecompressPointer r2
    //     0x539910: add             x2, x2, HEAP, lsl #32
    // 0x539914: cmp             w2, NULL
    // 0x539918: b.eq            #0x5399dc
    // 0x53991c: LoadField: r3 = r2->field_7
    //     0x53991c: ldur            x3, [x2, #7]
    // 0x539920: ldr             x2, [x3]
    // 0x539924: stur            x2, [fp, #-0x90]
    // 0x539928: cbnz            x2, #0x539938
    // 0x53992c: r16 = "A Dart object attempted to access a native peer, but the native peer has been collected (nullptr). This is usually the result of calling methods on a native-backed object when the native resources have already been disposed."
    //     0x53992c: ldr             x16, [PP, #0x68]  ; [pp+0x68] "A Dart object attempted to access a native peer, but the native peer has been collected (nullptr). This is usually the result of calling methods on a native-backed object when the native resources have already been disposed."
    // 0x539930: str             x16, [SP]
    // 0x539934: r0 = _throwNew()
    //     0x539934: bl              #0x177354  ; [dart:core] StateError::_throwNew
    // 0x539938: ldur            x0, [fp, #-0x90]
    // 0x53993c: stur            x0, [fp, #-0x90]
    // 0x539940: r1 = <Never>
    //     0x539940: ldr             x1, [PP, #0x70]  ; [pp+0x70] TypeArguments: <Never>
    // 0x539944: r0 = Pointer()
    //     0x539944: bl              #0x515150  ; AllocatePointerStub -> Pointer<X0 bound NativeType> (size=-0x8)
    // 0x539948: mov             x1, x0
    // 0x53994c: ldur            x0, [fp, #-0x90]
    // 0x539950: StoreField: r1->field_7 = r0
    //     0x539950: stur            x0, [x1, #7]
    // 0x539954: r0 = call 0x36b9a8
    //     0x539954: bl              #0x36b9a8
    // 0x539958: ldur            x0, [fp, #-0x70]
    // 0x53995c: r0 = ReturnAsyncNotFuture()
    //     0x53995c: b               #0x519244  ; ReturnAsyncNotFutureStub
    // 0x539960: sub             SP, fp, #0x98
    // 0x539964: ldur            x2, [fp, #-0x18]
    // 0x539968: stur            x0, [fp, #-0x70]
    // 0x53996c: stur            x1, [fp, #-0x78]
    // 0x539970: LoadField: r3 = r2->field_7
    //     0x539970: ldur            w3, [x2, #7]
    // 0x539974: DecompressPointer r3
    //     0x539974: add             x3, x3, HEAP, lsl #32
    // 0x539978: cmp             w3, NULL
    // 0x53997c: b.eq            #0x5399e0
    // 0x539980: LoadField: r4 = r3->field_7
    //     0x539980: ldur            x4, [x3, #7]
    // 0x539984: ldr             x3, [x4]
    // 0x539988: stur            x3, [fp, #-0x90]
    // 0x53998c: cbnz            x3, #0x53999c
    // 0x539990: r16 = "A Dart object attempted to access a native peer, but the native peer has been collected (nullptr). This is usually the result of calling methods on a native-backed object when the native resources have already been disposed."
    //     0x539990: ldr             x16, [PP, #0x68]  ; [pp+0x68] "A Dart object attempted to access a native peer, but the native peer has been collected (nullptr). This is usually the result of calling methods on a native-backed object when the native resources have already been disposed."
    // 0x539994: str             x16, [SP]
    // 0x539998: r0 = _throwNew()
    //     0x539998: bl              #0x177354  ; [dart:core] StateError::_throwNew
    // 0x53999c: ldur            x0, [fp, #-0x90]
    // 0x5399a0: stur            x0, [fp, #-0x90]
    // 0x5399a4: r1 = <Never>
    //     0x5399a4: ldr             x1, [PP, #0x70]  ; [pp+0x70] TypeArguments: <Never>
    // 0x5399a8: r0 = Pointer()
    //     0x5399a8: bl              #0x515150  ; AllocatePointerStub -> Pointer<X0 bound NativeType> (size=-0x8)
    // 0x5399ac: mov             x1, x0
    // 0x5399b0: ldur            x0, [fp, #-0x90]
    // 0x5399b4: StoreField: r1->field_7 = r0
    //     0x5399b4: stur            x0, [x1, #7]
    // 0x5399b8: r0 = call 0x36b9a8
    //     0x5399b8: bl              #0x36b9a8
    // 0x5399bc: ldur            x0, [fp, #-0x70]
    // 0x5399c0: ldur            x1, [fp, #-0x78]
    // 0x5399c4: r0 = ReThrow()
    //     0x5399c4: bl              #0x5527b0  ; ReThrowStub
    // 0x5399c8: brk             #0
    // 0x5399cc: r0 = StackOverflowSharedWithoutFPURegs()
    //     0x5399cc: bl              #0x554734  ; StackOverflowSharedWithoutFPURegsStub
    // 0x5399d0: b               #0x5397f4
    // 0x5399d4: r0 = NullErrorSharedWithoutFPURegs()
    //     0x5399d4: bl              #0x554e8c  ; NullErrorSharedWithoutFPURegsStub
    // 0x5399d8: r0 = NullErrorSharedWithoutFPURegs()
    //     0x5399d8: bl              #0x554e8c  ; NullErrorSharedWithoutFPURegsStub
    // 0x5399dc: r0 = NullErrorSharedWithoutFPURegs()
    //     0x5399dc: bl              #0x554e8c  ; NullErrorSharedWithoutFPURegsStub
    // 0x5399e0: r0 = NullErrorSharedWithoutFPURegs()
    //     0x5399e0: bl              #0x554e8c  ; NullErrorSharedWithoutFPURegsStub
  }
  [closure] nM <anonymous closure>(dynamic) {
    // ** addr: 0x36b470, size: -0x1
  }
  [closure] void <anonymous closure>(dynamic, iM, bool) {
    // ** addr: 0x36b388, size: -0x1
  }
  [closure] void <anonymous closure>(dynamic, Object, ua?) {
    // ** addr: 0x36b284, size: -0x1
  }
  [closure] void Ive(dynamic, int) {
    // ** addr: 0x36c8e4, size: -0x1
  }
}

// class id: 326, size: 0x8, field offset: 0x8
//   const constructor, 
class _Pqa extends Object
    implements Oqa {
}

// class id: 327, size: 0x8, field offset: 0x8
//   const constructor, 
abstract class Oqa extends Object {
}

// class id: 328, size: 0x14, field offset: 0x8
class _Nqa extends Object {
}

// class id: 329, size: 0x24, field offset: 0x8
class _Mqa extends Object {
}

// class id: 330, size: 0x10, field offset: 0x8
class Lqa extends Object {
}
