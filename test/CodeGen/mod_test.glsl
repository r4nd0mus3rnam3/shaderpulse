void main() {
    // MOD

    float x = 5.0;
    float y = 2.0;

    // CHECK: %0 = spirv.FMod %cst1_f32, %cst2_f32 : f32
    float z = mod(x, y);
}
