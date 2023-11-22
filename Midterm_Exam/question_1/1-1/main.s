		AREA	prog, CODE, READONLY
		ENTRY
		
		;initializing
		;411440430 \u8b19
		LDR		r0, =0x40000000
		LDR		r1,	=0xBEEFFACE
		STR		r1, [r0]
		
		;1
		LDR		r1, [r0]
		LDR		r2, =0x8756
		LDR		r3, =0x0FFFF000
		BIC		r1,	r3
		ORR		r1, r2, LSL #12
		STR		r1, [r0]
		
		;2
		;411440430 \u8b19
		LDR		r0,	=0x40000000
		LDR		r1, =0xBEEFFACE
		STR		r1, [r0]
		LDR		r9, [r0]
		LDR		r4, =0x22220 ;0b0010 0010 0010 0010 0000
		ORR		r9, r4
		STR     r9, [r0]
		;3
		LDR		r0, =0x40000000
		LDR		r1, =0xBEEFFACE
		STR		r1, [r0]
		LDR		r9, [r0]
		LDR		r5, =0x10480 ;0b0001 0000  0100 1000 0000
		BIC		r9, r5
		STR		r9, [r0]
		;4
		;411440430 \u8b19
		LDR		r0, =0x40000000
		LDR		r1, =0xBEEFFACE
		STR		r1, [r0]
		LDR		r9, [r0]
		LDR		r5, =0x10480 ;0b0001 0000 0100 1000 0000
		LDR		r7, =0xFFFFFFFF
		EOR		r5, r7
		AND		r9, r5 ;I not sure
		STR		r9, [r0]
		;5
		LDR		r0, =0x40000000
		LDR		r1, =0xBEEFFACE
		STR		r1,	[r0]
		LDR		r9, [r0]
		LDR		r6, =0x6040000 ;0b0110 0000 0100 0000 0000 0000 0000
		EOR		r9, r6
		STR		r9, [r0]
		
stop	B		stop
		END
		