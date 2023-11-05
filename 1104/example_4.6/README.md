##### Put the number of 1's of r0 into r1. (r0 = 0b11110000110011110011000100001111)
ANS:r1 = 17
```assembly
AREA	TEST, CODE, READONLY
		ENTRY
		
		LDR		r0, =0xF0CF310F
		LDR		r1, =0
		LDR		r2, =0X1
		LDR		r3, =32
		
loop
		TST		r0, r2
		ADDNE	r1, r1, #1
		LSL		r2, r2, #1
		SUB		r3, #1
		CMP		r3, #0
		BNE		loop
STOP	B 		STOP
		END
```