		AREA	QUIZ, CODE, READONLY
		ENTRY

;put odd pariy for bit 2, 4, 6 and 8 of address 0x40000000
;into bit 7 of address 0x40000008
;Assume
;address 0x40000000 = 0x5678ABCD
;address 0x40000004 = 0xABCD8765
;address 0x40000008 = 0xFACEBEEF
;address 0x4000000C = 0xDEADBEEF

		LDR		R0, = 0x8765ABCD
		LDR		R2, = 0xFACEBEEF
		LDR		R4, = 0x40000000
		LDR		R5, = 0x80 ;0b10000000
		STR		R0, [R4]
		STR		R2,	[R4, #8]
		
		LDR		R6, [R4]
		LDR		R7, [R4, #8]
		MOV		R8, R6 ;make a copy
		ROR		R8, R6, #2		;BIT-2
		EOR		R8, R6, ROR	#4	;2 XOR 4
		EOR		R8, R6, ROR #6	;2 XOR 4 XOR 6
		EOR		R8, R6, ROR #8	;2 XOR 4 XOR 6 XOR 8
		
		TST		R8, #1
		ORREQ	R7, R5 ;if even parity = 0(odd parity = 1), put 1 into bit 7 of 0x40000008
		BICNE	R7, R5 ;if even parity = 1(odd parity = 1), put 0 into bit 7 of 0x40000008
		STR		R7, [R4, #8]
;put even pariy for bit 1, 3, 5, 7 and 9 of address 0x40000004
;into bit 9 of address 0x4000000C
;Assume
;address 0x40000000 = 0x5678ABCD
;address 0x40000004 = 0xABCD8765
;address 0x40000008 = 0xFACEBEEF
;address 0x4000000C = 0xDEADBEEF
		LDR		R1, = 0xABCD8765
		LDR		R3, = 0xDEADBEEF
		LDR		R4, = 0x40000000
		LDR		R5, = 0x200
		STR		R1, [R4, #4]
		STR		R3, [R4, #0xC]
		
		LDR		R6, [R4, #4]
		LDR		R7, [R4, #0xC]
		MOV		R8, R6
		ROR		R8, R6, #1
		EOR		R8, R6, ROR #3
		EOR		R8, R6, ROR #5
		EOR		R8, R6, ROR #7
		EOR		R8, R6, ROR #9
		
		TST		R8, #1
		BICEQ	R7, R5
		ORRNE	R7, R5
		
		STR		R7, [R4, #0xC]
		
STOP	B	STOP
		END