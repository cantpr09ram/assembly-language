		AREA	FINAL, CODE, READONLY
		ENTRY
		;1-2
		LDR	R0, = 0xBBBBBBBB
		LDR R1, = 0xFFFFFFFF
		LDR R2, = 0xEEEEEEEE
		LDR	R3, = 0xDDDDDDDD
		
		MOV	R4, #0
		MOV	R5, #0
		MOV	R6, #0
		MOV	R7, #0
		
		LDR	R8, = 0x40000030
		STMDB R8! ,{R0, R1, R2, R3}
		
		LDMIA R8! ,{R4, R5, R6, R7}
STOP	B	STOP
		END