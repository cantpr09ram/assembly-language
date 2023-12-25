		AREA EXAMPLE, CODE
		ENTRY

		; Define memory addresses
		LDR R0, =0x40000000
		LDR R1, =0x8765ABCD
		LDR	R2, =0xCDEF6543
		LDR	R3, =0xFACEBEEF
		LDR	R4, =0x87654321
		STR	R1, [R0]
		STR R2, [R0, #0x04]
		STR	R3, [R0, #0x08]
		STR R4, [R0, #0x0C]
		
		; Call subroutine sub1
		;BL sub1

		; Call subroutine sub2
		BL sub2

		; Infinite loop to halt the program
STOP	B	STOP

sub1
		LDR	R4, =0x00000A28
		LDR R2, [R0]         ; Load the word from memory address 0x40000000
		TST R2, R4  ; Test bits 3, 4, 5, 9, and 11
		BICNE R3, #8         ; Set R3 to 1 if the result is not zero (odd parity)
		ORREQ R3, #8         ; Set R3 to 0 if the result is zero (even parity)
		;LSL R3, R3, #8       ; Shift the result to the position of bit 8
		STR R3, [R0, #0x08]         ; Store the result in the word at memory address 0x40000008
		BX LR

sub2
		LDR R2, [R0]         ; Load the word from memory address 0x40000000
		LSR R3, R2, #6       ; Shift right to get bit 6 to bit 0
		AND R3, R3, #1        ; Extract bit 6
		LDR R4, [R0]         ; Load the word again
		LSR R5, R4, #9       ; Shift right to get bit 9 to bit 0
		AND R5, R5, #1        ; Extract bit 9
		LDR R6, [R0]         ; Load the word again
		LSR R7, R6, #13      ; Shift right to get bit 13 to bit 0
		AND R7, R7, #1        ; Extract bit 13
		LDR R8, [R0]         ; Load the word again
		LSR R9, R8, #16      ; Shift right to get bit 16 to bit 0
		AND R9, R9, #1        ; Extract bit 16
		LDR R10, [R0]        ; Load the word again
		LSR R11, R10, #19    ; Shift right to get bit 19 to bit 0
		AND R11, R11, #1      ; Extract bit 19
		ORR R12, R3, R5      ; Combine the extracted bits
		ORR R12, R12, R7
		ORR R12, R12, R9
		ORR R12, R12, R11
		LSL R12, R12, #20     ; Shift the result to the position of bit 20
		LDR	R3, [R0, #0x08]	
		ORR	R12, R3, R12
		STR R12, [R0, #0x08]         ; Store the result in the word at memory address 0x40000008
		BX LR

		END
;11111010110011101011111011101111
;11111010110011101011111011101111
;11111010110111101011111011101111