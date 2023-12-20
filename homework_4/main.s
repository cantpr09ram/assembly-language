        AREA HammingCode, CODE, READONLY
		ENTRY
        ; Define memory address for Hamming code
		LDR R4, =0x40000004
		LDR R1, =0x40000000
        ; Define constants for bit manipulation
		LDR R0, =0x00000BA6 ;101110100110 => 
		MOV R3, #0
		MOV R2, #0

        ; Load the Hamming code from memory
               
		MOV R3, R0 ; make a copy
		
		BIC R3, R3, #0xFF
		MOV R2, R3, ROR #4
		;7654****
		LDR R5, = 0xF8F
		BIC R3, R0, R5
		ORR R2, R2 ,R3, ROR #3
		;7654321*
        ; Store the result in HAMMING_ADDR_2
        LDR R5, = 0xFFB
		BIC R3, R0, R5
		ORR R2, R2 ,R3, ROR #2
		
		;R2 => 8-bit data from 12-bit data
		;R0 => 12-bit data
		
		MOV R3, R2
		MOV R6, #0
		;C0
		EOR R3, R3, R2, ROR #1 ; 1 XOR 0
		EOR R3, R3, R2, ROR #3 ; 3 XOR 1 XOR 0
		EOR R3, R3, R2, ROR #4 ; 4 XOR 3 XOR 1 XOR 0
		EOR R3, R3, R2, ROR #6 ; 6 XOR 4 XOR 3 XOR 1 XOR 0
		AND R6, R3, #1
		;C1
		MOV R3, R2
		EOR R3, R3, R2, ROR #2 ; 2 XOR 0
		EOR R3, R3, R2, ROR #3 ; 3 XOR 2 XOR 0
		EOR R3, R3, R2, ROR #5 ; 5 XOR 3 XOR 2 XOR 0
		EOR R3, R3, R2, ROR #6 ; 6 XOR 4 XOR 3 XOR 2 XOR 0
		AND R3, R3, #1
		ORR R6, R6, R3, LSL #1
		;C2
		ROR R3, R2, #1 ; get bit 1
		EOR R3, R3, R2, ROR #2 ; 2 XOR 1
		EOR R3, R3, R2, ROR #3 ; 3 XOR 2 XOR 1
		EOR R3, R3, R2, ROR #7 ; 7 XOR 3 XOR 2 XOR 1
		AND R3, R3, #1
		ORR R6, R6, R3, LSL #2
		
		ROR R3, R2, #4 ; get bit 4
		EOR R3, R3, R2, ROR #5 ; 5 XOR 4
		EOR R3, R3, R2, ROR #6 ; 6 XOR 5 XOR 4
		EOR R3, R3, R2, ROR #7 ; 7 XOR 6 XOR 5 XOR 4
		AND R3, R3, #1
		ORR R6, R6, R3, LSL #3
        ; End of program
STOP    B   STOP
        END
			
;d7 d6 d5 d4 c3 d3 d2 d1 c2 d0 c1 c0
;12 11 10  9  8  7  6  5  4  3  2  1
;1011 1010 0110 => 1011 0101
;BA6 => B5
;1010 C3 C2 C1 C0