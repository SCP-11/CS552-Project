lbi r1, 12
lbi r2, 21

j .start
lbi r2, -1

.start:
sub r1, r1, r2
bltz r1, .success
halt

.success:
lbi r3, 1
halt