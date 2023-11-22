		AREA	prog2, CODE, READONLY
		ENTRY
		;1
		;411440430 \u8b19
		MOV		r2, #7
		MOV		r3,	#6
		MOV		r4, #5
		LDR		r0, =1
		ADD		r5,	r0,	LSL	r2
		ADD		r5, r0, LSL	r3
		SUB		r5, r0, LSL r4
		SUB		r5, #48

STOP 	B		STOP
		END