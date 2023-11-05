    AREA    prog5, CODE, READONLY
    ENTRY

    ; Initial register values
    LDR     r6, =0xABCD8765  

    ; (1) Calculate the 2's complement of r6 and put the result in r7.
    ;NEG     r7, r6           
    ; (2) Set bits 1, 5, and 13 in register r6 and leave the remaining bits unchanged
	;LDR		r3, =0x00002022 
				;0010 0000 0010 0010
    ;ORR     r6, r6, r3;

    ; (3) Clear bits 0, 4, and 12 in register r6 and leave the remaining bits unchanged.
	LDR		r4, =0x00001011
				;0001 0000 0001 0001
	LDR     r6, =0xABCD8765 
    BIC     r6, r6, r4

    ; (4) Change bits 4, 8, and 11 of r6.
	;LDR     r6, =0xABCD8765 
    ;EOR     r6, r6, #0x00000910  ; Bitwise XOR to change specified 
					;0000 1001 0001 0000

    ; (5) Insert the value 0x5555 into the lower half of register r0.
	LDR		r0, =0xBEEFABCD  ; Load the initial value into r0
	LDR 	r1, =0x00005555  ; Load the value 0x5555 into r1
	;LSL 	r1, r1, #16      ; Shift left by 16 bits to place 0x5555 in the lower half
	LDR		r2, =0xFFFF
	BIC 	r0, r0, r2		 ; Clear the lower half of r0
	ORR 	r0, r0, r1       ; Bitwise OR to insert 0x5555 in the lower half
	;411440430 bo-chain

stop
    B    stop

    END

