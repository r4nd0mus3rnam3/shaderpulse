void main() {
    int x = 1;
    int y = 0;

    // CHECK: spirv.mlir.selection {
    // CHECK-NEXT:  spirv.Switch %2 : si32, [
    // CHECK-NEXT:    default: ^bb3,
    // CHECK-NEXT:    1: ^bb1,
    // CHECK-NEXT:    2: ^bb2
    // CHECK-NEXT:  ]
    // CHECK-NEXT: ^bb1:  // pred: ^bb0
    switch (x) {
        case 1:
            y = 10;
            // CHECK: spirv.Branch ^bb4
            break;
    // CHECK-NEXT: ^bb2:  // pred: ^bb0
        case 2:
            y = 20;
            // CHECK: spirv.Branch ^bb4
            break;
    // CHECK-NEXT: ^bb3:  // pred: ^bb0
        default:
            y = 30;
            // CHECK: spirv.Branch ^bb4
            break;
    }

    // CHECK-NEXT: ^bb4:  // 3 preds: ^bb1, ^bb2, ^bb3
    // CHECK-NEXT:  spirv.mlir.merge
    // CHECK-NEXT: }
}
