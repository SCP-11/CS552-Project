lbi r1, 10
lbi r2, -5
slbi r2, 120
add r3, r1, r2
slli r3, r3, 11
rol r3, r3, 1
sco r3, r3, r3
st r3, r1, 0
ld r4, r1, 0
seq r5, r3, r4
halt