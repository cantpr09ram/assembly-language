		AREA    prog3, CODE, READONLY
		ENTRY
		 
		LDR	 r3, =0x40000000
		LDR	 r6, =0xDEADBEEF
		
		STR  r6, [r3]
		LDRB r4, [r3]
stop    B    stop

        END