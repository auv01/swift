// RUN: %target-swift-ide-test -print-module -module-to-print=CustomSequence -source-filename=x -I %S/Inputs -enable-experimental-cxx-interop -module-cache-path %t | %FileCheck %s

// CHECK: struct SimpleSequence {
// CHECK:   typealias Element = ConstIterator.Pointee
// CHECK:   typealias Iterator = CxxIterator<SimpleSequence>
// CHECK:   typealias RawIterator = ConstIterator
// CHECK: }

// CHECK: struct SimpleSequenceWithOutOfLineEqualEqual {
// CHECK:   typealias Element = ConstIteratorOutOfLineEq.Pointee
// CHECK:   typealias Iterator = CxxIterator<SimpleSequenceWithOutOfLineEqualEqual>
// CHECK:   typealias RawIterator = ConstIteratorOutOfLineEq
// CHECK: }

// CHECK: struct SimpleArrayWrapperNullableIterators {
// CHECK:   typealias Element = Optional<UnsafePointer<Int32>>.Pointee
// CHECK:   typealias Iterator = CxxIterator<SimpleArrayWrapperNullableIterators>
// CHECK:   typealias RawIterator = UnsafePointer<Int32>?
// CHECK: }

// CHECK: struct SimpleEmptySequence {
// CHECK:   typealias Element = Optional<UnsafePointer<Int32>>.Pointee
// CHECK:   typealias Iterator = CxxIterator<SimpleEmptySequence>
// CHECK:   typealias RawIterator = UnsafePointer<Int32>?
// CHECK: }

// CHECK: struct HasMutatingBeginEnd {
// CHECK:   typealias Element = ConstIterator.Pointee
// CHECK:   typealias Iterator = CxxIterator<HasMutatingBeginEnd>
// CHECK:   typealias RawIterator = ConstIterator
// CHECK: }

// CHECK: struct HasNoBeginMethod {
// CHECK-NOT:   typealias Element
// CHECK-NOT:   typealias Iterator
// CHECK-NOT:   typealias RawIterator
// CHECK: }
// CHECK: struct HasNoEndMethod {
// CHECK-NOT:   typealias Element
// CHECK-NOT:   typealias Iterator
// CHECK-NOT:   typealias RawIterator
// CHECK: }
// CHECK: struct HasBeginEndTypeMismatch {
// CHECK-NOT:   typealias Element
// CHECK-NOT:   typealias Iterator
// CHECK-NOT:   typealias RawIterator
// CHECK: }
// CHECK: struct HasBeginEndReturnNonIterators {
// CHECK-NOT:   typealias Element
// CHECK-NOT:   typealias Iterator
// CHECK-NOT:   typealias RawIterator
// CHECK: }
// CHECK: struct __CxxTemplateInst20HasTemplatedIteratorIi12NoDefinitionIiEE {
// CHECK-NOT:   typealias Element
// CHECK-NOT:   typealias Iterator
// CHECK-NOT:   typealias RawIterator
// CHECK: }
// CHECK: typealias HasUninstantiatableIterator = __CxxTemplateInst20HasTemplatedIteratorIi12NoDefinitionIiEE
