    AREA    prog5, CODE, READONLY
    ENTRY

    ; Initial register values
    LDR     r6, =0xABCD8765  ; r6 = 0xABCD8765

    ; (1) Calculate the 2's complement of r6 and put the result in r7.
    NEG     r7, r6           
    ; (2) Set bits 1, 5, and 13 in register r6 and leave the remaining bits unchanged.
    ORR     r6, r6, #0x00000022  ; Set bit 1, 9
	ORR     r6, r6, #0x00000020
    ORR     r6, r6, #0x00002000  ; Set bit 13

    ; (3) Clear bits 0, 4, and 12 in register r6 and leave the remaining bits unchanged.
    BIC     r6, r6, #0x00000019  ; Clear bit 0
    BIC     r6, r6, #0x00000010  ; Clear bit 4
    BIC     r6, r6, #0x00001000  ; Clear bit 12

    ; (4) Change bits 4, 8, and 11 of r6.
    EOR     r6, r6, #0x00000A00  ; Bitwise XOR to change specified bits

    ; (5) Insert the value 0x5555 into the lower half of register r0.
	LDR		r0, =0xBEEFABCD  ; Load the initial value into r0
	LDR 	r1, =0x5555      ; Load the value 0x5555 into r1
	LSL 	r1, r1, #16      ; Shift left by 16 bits to place 0x5555 in the lower half
	BIC 	r0, r0, #0xFF0000   ; Clear the lower half of r0
	ORR 	r0, r0, r1       ; Bitwise OR to insert 0x5555 in the lower half


stop
    B    stop

    END

