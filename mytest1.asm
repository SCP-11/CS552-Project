// seed 1
lbi r0, 10 
slbi r0, 116 
lbi r1, 213 
slbi r1, 86 
lbi r2, 144
slbi r2, 0 
lbi r3, 48
slbi r3, 253 
lbi r4, 192
slbi r4, 93 
lbi r5, 89 
slbi r5, 146
slbi r4, 220
lbi r5, 48 
slbi r5, 96 
lbi r6, 221
slbi r6, 131 
lbi r7, 59
slbi r7, 77 
lbi r2, 0 
lbi r0, 0 
nop 
beqz r1, 0 
nop 
beqz r6, 28
nop 
nop
nop 
nop 
add r7, r0, r4 
add r4, r2, r7 
add r5, r3, r7
add r0, r1, r7
add r0, r0, r7 
add r5, r6, r2
add r2, r3, r4 
add r5, r3, r5 
nop 
nop 
nop 
nop 
nop 
nop
nop 
nop 
nop 
nop 
nop 
beqz r5, 8
nop 
nop 
nop 
add r2, r6, r6 
add r1, r7, r5 
add r3, r7, r5 
add r2, r4, r3 
add r4, r7, r2 
add r4, r5, r4 
halt 
