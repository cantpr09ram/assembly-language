		AREA	prog3,	CODE,	READONLY
		ENTRY
		;1
		;411440430 \u8b19
		ADR		r1, data1
		ADR		r2, data2
		ADR		r3, data3
		ADR		r4, data4
		ADR		r5, data5
		;2
		;411440430 \u8b19
		ADR		r1, data1
		LDR		r0, =0x40000000
LOOPA	
		LDRB	r6,[r1], #1
		STRB	r6,[r0], #1
		CMP		r6, #0
		BNE		LOOPA
		;3
		;411440430 \u8b19
		ADR		r1, data1
		LDR		r0, =0x40000030
		ADD		r0, #25
LOOPB
		LDRB	r6,[r1], #1
		CMP		r6, #0
		STRBNE	r6, [r0], #-1
		BNE		LOOPB
		;4
		;411440430 \u8b19
		ADR		r1, data3
		LDR		r0, =0x40000060
		LDR		r3, =4
LOOPC	
		LDRH	r6, [r2], #2
		STRH	r6, [r0], #2
		SUB		r3, #1
		CMP		r3, #0
		BNE		LOOPC
		;5
		;411440430 \u8b19
		ADR		r1, data3
		LDR		r0, =0x40000070
		LDR		r3, =6
LOOPD
		LDR		r6, [r1], #4
		STR		r6, [r0], #4
		SUB		r3, #1
		CMP		r3, #0
		BNE		LOOPD
		;6
		;411440430 \u8b19
		ADR		r1, data3
		LDR		r0, =0x40000090
		ADD		r0, #20
		LDR		r3, =6
LOOPE
		LDR		r6, [r1], #4
		STR		r6, [r0], #-4
		SUB		r3, #1
		CMP		r3, #0
		BNE		LOOPE
		;7
		;411440430 \u8b19
		ADR		r1, data4
		LDR		r0, =0x400000B0
		LDR		r3, =7
LOOPF	
		LDRB	r6, [r1], #1
		STRB	r6, [r0], #1
		SUB		r3, #1
		CMP		r3, #0
		BNE		LOOPF
		;8
		;411440430 \u8b19
		ADR		r1, data5
		LDR		r0, =0x400000C0
		LDR		r3, =6
LOOPG
		LDR		r6, [r1], #4
		STR		r6, [r0], #4
		SUB		r3, #1
		CMP		r3, #0
		BNE		LOOPG
		;9
		;411440430 \u8b19
		ADR		r1, data5
		LDR		r0, =0x400000E0
		LDR		r3, =6
		LDR		r7, =0
LOOPH
		LDR		r6, [r1], #4
		ADD		r7, r6
		SUB		r3, #1
		CMP		r3, #0
		BNE		LOOPH
		STR		r7, [r0]		
STOP	B		STOP

data1   DCB "Midterm Exam in Fall 2023!", 0
data2   DCW 0x1234, 0x5678, 0xBEEF, 0xFACE
data3   DCD 0x8ECC, 0xFE37, 0xABCD, 1, 5, 0x1234FACE
data4   DCB 0xCF, 23, 39, 0x54, 250, 0xFF, 0xAD
data5   DCD 0xFE37, 1, 5, 20, 0xABCDFACE, 0x12345678 
		END