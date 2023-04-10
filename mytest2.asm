LBI	r5, 0
LBI	r6, 0
LBI	r7, 0	
NOP
NOP
NOP

ADDI	r1, r1, 31		 
SUBI	r2, r1, 3		 
XORI	r3, r1, 15		 
ANDNI	r4, r1, 10		 
ROLI	r4, r4, 1		 
SLLI	r3, r3, 11		 
RORI	r2, r2, 14		 
SRLI	r1, r1, 5		 

ST	r1, r2, 0		 
LD	r5, r2, 0		 
STU	r4, r2, 2		 
				 
LBI	r0, 0		 
LBI	r1, 0		 
LBI	r2, 0		 

BTR	r6, r1			 
BTR	r2, r2			 
ADD	r1, r2, r3		 
SUB	r1, r1, r1		 
halt
