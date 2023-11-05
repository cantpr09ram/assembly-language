;Put the number of different bits between r0 and r1 into r3.
;(r0 = 0x1010, r1 = 0101)
;ANS:4
		AREA	TEST, CODE, READONLY
		ENTRY
		
		LDR		r0, =0x1010
		LDR		r1, =0x0101
		LDR		r2, =0x1
		LDR		r3, =0
		LDR		r4, =32
		EOR		r5, r0, r1
		
loop
		TST		r5, r2
		ADDNE	r3, r3, #1
		LSL		r2, r2, #1
		SUB		r4, #1
		CMP		r4, #0
		BNE		loop
		
STOP	B 		STOP
		END