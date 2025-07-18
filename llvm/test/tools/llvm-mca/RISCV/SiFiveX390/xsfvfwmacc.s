# NOTE: Assertions have been autogenerated by utils/update_mca_test_checks.py
# RUN: llvm-mca -mtriple=riscv64 -mcpu=sifive-x390 -mattr='+xsfvfwmaccqqq' -instruction-tables=full -iterations=1 %s | \
# RUN:   FileCheck %s

vsetvli zero, zero, e16, mf4, ta, ma
sf.vfwmacc.4x4x4 v16, v0, v8
vsetvli zero, zero, e16, mf2, ta, ma
sf.vfwmacc.4x4x4 v16, v0, v8
vsetvli zero, zero, e16, m1, ta, ma
sf.vfwmacc.4x4x4 v16, v0, v8
vsetvli zero, zero, e16, m2, ta, ma
sf.vfwmacc.4x4x4 v16, v0, v8
vsetvli zero, zero, e16, m4, ta, ma
sf.vfwmacc.4x4x4 v16, v0, v8

# CHECK:      Resources:
# CHECK-NEXT: [0]   - VLEN1024X300SiFive7FDiv:1
# CHECK-NEXT: [1]   - VLEN1024X300SiFive7IDiv:1
# CHECK-NEXT: [2]   - VLEN1024X300SiFive7PipeA:1
# CHECK-NEXT: [3]   - VLEN1024X300SiFive7PipeAB:2 VLEN1024X300SiFive7PipeA, VLEN1024X300SiFive7PipeB
# CHECK-NEXT: [4]   - VLEN1024X300SiFive7PipeB:1
# CHECK-NEXT: [5]   - VLEN1024X300SiFive7VA1:1
# CHECK-NEXT: [6]   - VLEN1024X300SiFive7VA1OrVA2:2 VLEN1024X300SiFive7VA1, VLEN1024X300SiFive7VA2
# CHECK-NEXT: [7]   - VLEN1024X300SiFive7VA2:1
# CHECK-NEXT: [8]   - VLEN1024X300SiFive7VCQ:1
# CHECK-NEXT: [9]   - VLEN1024X300SiFive7VL:1
# CHECK-NEXT: [10]  - VLEN1024X300SiFive7VS:1

# CHECK:      Instruction Info:
# CHECK-NEXT: [1]: #uOps
# CHECK-NEXT: [2]: Latency
# CHECK-NEXT: [3]: RThroughput
# CHECK-NEXT: [4]: MayLoad
# CHECK-NEXT: [5]: MayStore
# CHECK-NEXT: [6]: HasSideEffects (U)
# CHECK-NEXT: [7]: Bypass Latency
# CHECK-NEXT: [8]: Resources (<Name> | <Name>[<ReleaseAtCycle>] | <Name>[<AcquireAtCycle>,<ReleaseAtCycle])
# CHECK-NEXT: [9]: LLVM Opcode Name

# CHECK:      [1]    [2]    [3]    [4]    [5]    [6]    [7]    [8]                                        [9]                        Instructions:
# CHECK-NEXT:  1      3     1.00                  U      1     VLEN1024X300SiFive7PipeA,VLEN1024X300SiFive7PipeAB VSETVLI            vsetvli	zero, zero, e16, mf4, ta, ma
# CHECK-NEXT:  1      8     1.00                         8     VLEN1024X300SiFive7VA1[1,2],VLEN1024X300SiFive7VA1OrVA2[1,2],VLEN1024X300SiFive7VCQ SF_VFWMACC_4x4x4 sf.vfwmacc.4x4x4	v16, v0, v8
# CHECK-NEXT:  1      3     1.00                  U      1     VLEN1024X300SiFive7PipeA,VLEN1024X300SiFive7PipeAB VSETVLI            vsetvli	zero, zero, e16, mf2, ta, ma
# CHECK-NEXT:  1      8     1.00                         8     VLEN1024X300SiFive7VA1[1,2],VLEN1024X300SiFive7VA1OrVA2[1,2],VLEN1024X300SiFive7VCQ SF_VFWMACC_4x4x4 sf.vfwmacc.4x4x4	v16, v0, v8
# CHECK-NEXT:  1      3     1.00                  U      1     VLEN1024X300SiFive7PipeA,VLEN1024X300SiFive7PipeAB VSETVLI            vsetvli	zero, zero, e16, m1, ta, ma
# CHECK-NEXT:  1      8     2.00                         8     VLEN1024X300SiFive7VA1[1,3],VLEN1024X300SiFive7VA1OrVA2[1,3],VLEN1024X300SiFive7VCQ SF_VFWMACC_4x4x4 sf.vfwmacc.4x4x4	v16, v0, v8
# CHECK-NEXT:  1      3     1.00                  U      1     VLEN1024X300SiFive7PipeA,VLEN1024X300SiFive7PipeAB VSETVLI            vsetvli	zero, zero, e16, m2, ta, ma
# CHECK-NEXT:  1      8     4.00                         8     VLEN1024X300SiFive7VA1[1,5],VLEN1024X300SiFive7VA1OrVA2[1,5],VLEN1024X300SiFive7VCQ SF_VFWMACC_4x4x4 sf.vfwmacc.4x4x4	v16, v0, v8
# CHECK-NEXT:  1      3     1.00                  U      1     VLEN1024X300SiFive7PipeA,VLEN1024X300SiFive7PipeAB VSETVLI            vsetvli	zero, zero, e16, m4, ta, ma
# CHECK-NEXT:  1      8     8.00                         8     VLEN1024X300SiFive7VA1[1,9],VLEN1024X300SiFive7VA1OrVA2[1,9],VLEN1024X300SiFive7VCQ SF_VFWMACC_4x4x4 sf.vfwmacc.4x4x4	v16, v0, v8

# CHECK:      Resources:
# CHECK-NEXT: [0]   - VLEN1024X300SiFive7FDiv
# CHECK-NEXT: [1]   - VLEN1024X300SiFive7IDiv
# CHECK-NEXT: [2]   - VLEN1024X300SiFive7PipeA
# CHECK-NEXT: [3]   - VLEN1024X300SiFive7PipeB
# CHECK-NEXT: [4]   - VLEN1024X300SiFive7VA1
# CHECK-NEXT: [5]   - VLEN1024X300SiFive7VA2
# CHECK-NEXT: [6]   - VLEN1024X300SiFive7VCQ
# CHECK-NEXT: [7]   - VLEN1024X300SiFive7VL
# CHECK-NEXT: [8]   - VLEN1024X300SiFive7VS

# CHECK:      Resource pressure per iteration:
# CHECK-NEXT: [0]    [1]    [2]    [3]    [4]    [5]    [6]    [7]    [8]
# CHECK-NEXT:  -      -     5.00    -     21.00   -     5.00    -      -

# CHECK:      Resource pressure by instruction:
# CHECK-NEXT: [0]    [1]    [2]    [3]    [4]    [5]    [6]    [7]    [8]    Instructions:
# CHECK-NEXT:  -      -     1.00    -      -      -      -      -      -     vsetvli	zero, zero, e16, mf4, ta, ma
# CHECK-NEXT:  -      -      -      -     2.00    -     1.00    -      -     sf.vfwmacc.4x4x4	v16, v0, v8
# CHECK-NEXT:  -      -     1.00    -      -      -      -      -      -     vsetvli	zero, zero, e16, mf2, ta, ma
# CHECK-NEXT:  -      -      -      -     2.00    -     1.00    -      -     sf.vfwmacc.4x4x4	v16, v0, v8
# CHECK-NEXT:  -      -     1.00    -      -      -      -      -      -     vsetvli	zero, zero, e16, m1, ta, ma
# CHECK-NEXT:  -      -      -      -     3.00    -     1.00    -      -     sf.vfwmacc.4x4x4	v16, v0, v8
# CHECK-NEXT:  -      -     1.00    -      -      -      -      -      -     vsetvli	zero, zero, e16, m2, ta, ma
# CHECK-NEXT:  -      -      -      -     5.00    -     1.00    -      -     sf.vfwmacc.4x4x4	v16, v0, v8
# CHECK-NEXT:  -      -     1.00    -      -      -      -      -      -     vsetvli	zero, zero, e16, m4, ta, ma
# CHECK-NEXT:  -      -      -      -     9.00    -     1.00    -      -     sf.vfwmacc.4x4x4	v16, v0, v8
