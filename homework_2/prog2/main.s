		AREA Prog3, CODE, READONLY
		ENTRY
		
		LDR r0, =0xFF6B ;-149   in 2's complement
		LDR r1, =0xEF1F ; -4321 in 2's complement
		ADD r7, r0, r1
stop B stop ; stop program
		END