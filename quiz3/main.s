		AREA	QUIZ, CODE, READONLY
		ENTRY
		
		LDR	R0, = 100
		LDR R1, = 401
		LDR R2, = 0X40000000
		LDR R3, = 0
		LDR R4, = 0XFFFFFFFF
		
LOOPA
		ADD	R3, R0
		ADD R0, #1
		EOR	R0, R4
		TST R0, R1
		EOR	R0, R4
		BNE LOOPA
		STR	R3, [R2, #0x20]

		LDR	R0, = 100
		LDR R1, = 404
		LDR R2, = 0X40000000
		LDR R3, = 0
		LDR R4, = 0XFFFFFFFF
LOOPB
		ADD	R3, R0
		ADD R0, #4
		EOR	R0, R4
		TST R0, R1
		EOR	R0, R4
		BNE LOOPB
		STR	R3, [R2, #0x30]
		
		LDR	R0, = 104
		LDR R1, = 408
		LDR R2, = 0X40000000
		LDR R3, = 0
		LDR R4, = 0XFFFFFFFF
LOOPC
		ADD	R3, R0
		ADD R0, #8
		EOR	R0, R4
		TST R0, R1
		EOR	R0, R4
		BNE LOOPC
		STR	R3, [R2, #0x40]
		
STOP	B	STOP
		END