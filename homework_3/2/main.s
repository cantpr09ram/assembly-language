		AREA	HAMMING,	CODE
		ENTRY
;registers used
;R0 - temp
;R1 - used to hold address of data
;R2 - holds value to be transmitted
;R4 - temp
;R5 - temp
;R6 - counter
;R7 - address
main

		MOV r2, #0 ; clear out transmitting reg
		ADR r1, arraya ; start of constants
		MOV	r5, #0
		MOV r6, #0
		LDR r7, =0x40000000
LOOP
		LDRB r0, [r1], #1
		CMP	r0, #0
		BEQ	done	;If zero, exit the loop
		;
		; calculate c0 using bits 76543210
		;                          * ** ** 
		; even parity, so result of XORs is the value of c0
		;411440430 bo-chain
		MOV r4, r0 ; make a copy
		EOR r4, r4, r0, ROR #1 ; 1 XOR 0
		EOR r4, r4, r0, ROR #3 ; 3 XOR 1 XOR 0
		EOR r4, r4, r0, ROR #4 ; 4 XOR 3 XOR 1 XOR 0
		EOR r4, r4, r0, ROR #6 ; 6 XOR 4 XOR 3 XOR 1 XOR 0
		AND r2, r4, #1 ; create c0 -> R2
		;
		; calculate c1 using bits 76543210
		;                          ** ** *
		;411440430 bo-chain
		MOV r4, r0
		EOR r4, r4, r0, ROR #2 ; 2 XOR 0
		EOR r4, r4, r0, ROR #3 ; 3 XOR 2 XOR 0
		EOR r4, r4, r0, ROR #5 ; 5 XOR 3 XOR 2 XOR 0
		EOR r4, r4, r0, ROR #6 ; 6 XOR 5 XOR 3 XOR 2 XOR 0
		AND r4, r4, #1 ; isolate bit
		ORR r2, r2, r4, LSL #1 ; 7 6 5 4 3 2 c1 c0
		;
		; calculate c2 using bits 76543210
		;                         *   ***
		;411440430 bo-chain
		ROR r4, r0, #1 ; get bit 1
		EOR r4, r4, r0, ROR #2 ; 2 XOR 1
		EOR r4, r4, r0, ROR #3 ; 3 XOR 2 XOR 1
		EOR r4, r4, r0, ROR #7 ; 7 XOR 3 XOR 2 XOR 1
		AND r4, r4, #1 ; isolate bit
		ORR r2, r2, r4, ROR #29 ; 7 6 5 4 c2 2 c1 c0
		;
		; calculate c3 using bits 76543210
		;                         ****
		;411440430 bo-chain
		ROR r4, r0, #4 ; get bit 4
		EOR r4, r4, r0, ROR #5 ; 5 XOR 4
		EOR r4, r4, r0, ROR #6 ; 6 XOR 5 XOR 4
		EOR r4, r4, r0, ROR #7 ; 7 XOR 6 XOR 5 XOR 4
		AND r4, r4, #1
		;
		; build the final 12-bit result
		;
		ORR r2, r2, r4, ROR #25 ; rotate left 7 bits
		AND r4, r0, #1 ; get bit 0 from original
		ORR r2, r2, r4, LSL #2 ; add bit 0 into final
		BIC r4, r0, #0xF1 ; get bits 3,2,1
		ORR r2, r2, r4, LSL #3 ; add bits 3,2,1 to final
		BIC r4, r0, #0x0F ; get upper nibble
		ORR r2, r2, r4, LSL #4 ; r2 now contains 12 bits
		
		
		; Concatenate the calculated Hamming Code to the result register (r5)
		
		STR	r2, [r7], #4
		; Increment the counter
		ADD r6, r6, #1
		 ; Continue the loop
		CMP r6, #4  ; Check if four bytes have been processed
		BLT LOOP
		
		
		 ; with checksums
done 	B 	done
		ALIGN
arraya
		DCB 0xB5
		DCB 0xAA
		DCB 0x55
		DCB 0xAA
		END
