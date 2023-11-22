		AREA	prog2_2, CODE,	READONLY
		ENTRY
		;2
		;411440430 \u8b19 
		LDR		r0, =0xDEADABCE
		LDR		r1, =0xABCD8765 
		LDR		r2, =0xBEEFFACE
		LDR		r3, =0x40000000
		STR		r0, [r3, #0x10]
		STR		r1, [r3, #0x20]
		STR		r2, [r3, #0x30]

		;a
		;411440430 \u8b19
		LDR		r4, =1
		LDR		r5, =0
		LDR		r6, =32
		LDR		r7, [r3, #0x10]
LOOPA
		TST		r7, r4
		ADDNE	r5, #1
		LSL		r4,	#1
		SUB		r6, #1
		CMP		r6, #0
		BNE		LOOPA
		STR		r5, [r3, #0x40]
		;b
		;411440430 \u8b19
		LDR		r4, =1
		LDR		r5, =0
		LDR		r6, =32
		LDR		r7, [r3, #0x20]
LOOPB
		AND		r8, r7, r4
		CMP		r8, #1
		ADDEQ	r5, #1
		LSR		r7, #1
		SUB		r6,	#1
		CMP		r6, #0
		BNE		LOOPB
		STR		r5, [r3, #0x44]
		;c
		;411440430 \u8b19
		LDR		r4, =1
		LDR		r5, =0
		LDR		r6, =0
		LDR		r7, [r3, #0x30]
LOOPC
		TST		r7, r4
		ADDEQ	r5, #1
		LSL		r4, #1
		ADD		r6, #1
		CMP		r6, #32
		BNE		LOOPC
		STR		r5, [r3, #0x48]
		;d
		;411440430 \u8b19
		LDR		r4, =1
		LDR		r5, =0
		LDR		r6, =32
		LDR		r7, [r3, #0x20]
		LDR		r8, [r3, #0x30]
		EOR		r9, r7, r8
LOOPD
		TST		r9, r4
		ADDNE	r5, #1
		LSL		r4, #1
		SUB		r6, #1
		CMP		r6, #0
		BNE		LOOPD
		STR		r5, [r3, #0x4C]
STOP	b		STOP
		END