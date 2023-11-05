SRAM_BASE		EQU		0x40000000; start of SRAM910FM32
		AREA	StrCopy, CODE
		ENTRY					  ;mark the first instruction
Main
		ADR		r1, data3
		ADR		r2,	data5
		LDR		r0, =SRAM_BASE
		MOV		r7, #7
strcopy
		LDR		r3, [r1], #4
		LDR		r4, [r2], #4
		ADD		r5, r3, r4
		STR		r5, [r0], #4
		SUB		r7, #1
		CMP		r7, #0
		BNE		strcopy

stop	B		stop
data3	DCD		0x8ECC, 0xFE3, 0xABCD, 1, 5, -20, 0x1234FACE
data5	DCD		0xFE37, 1, 5, 20, 0xABCDFACE, -50,0x45671234
		END
;Add the corresponding words between data3 and data5 and put the sums one by one in memory started from address 0x400000E0.