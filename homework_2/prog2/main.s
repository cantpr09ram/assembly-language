		AREA Prog3, CODE, READONLY
		ENTRY
		
		LDR r0, =0x95 ;149
		LDR r1, =0x10E1; 4321
		
		;two's complement
		NEG r0, r0
		NEG r1, r1
		ADD r7, r0, r1
stop B stop ; 411440430 bo-chain
		END