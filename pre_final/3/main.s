		AREA EXAMPLE, CODE
		ENTRY

		; Define memory addresses
		LDR R0, =0x40000000
		LDR	R5, =0x40000030
		
		LDR	R1, =0xCDEF5678
		LDR	R2, =0x5678CDEF
		LDR	R3, =0xBEEFFACE
		LDR	R4, =0xFACEBEEF
		STR	R1, [R0]
		STR	R2, [R0, #0x04]
		STR	R3, [R0, #0x08]
		STR	R4, [R0, #0x0C]

		LDR	R6, =0xFACEFACE ;ODD
		LDR R7, =0xFACEFACE ;EVEN
		; Call CheckParity subroutine for each word
		LDR R10, [R0]
		BL CheckParity
		STR R11, [R5]

		LDR R10, [R0, #0x04]
		BL CheckParity
		STR R11, [R5, #0x04]

		LDR R10, [R0, #0x08]
		BL CheckParity
		STR R11, [R5, #0x08]

		LDR R10, [R0, #0x0C]
		BL CheckParity
		STR R11, [R5, #0x0C]

		; Infinite loop to halt the program
STOP	B	STOP

CheckParity
		STMFD SP!, {R10, R6, R7, LR}  ; Save registers to the stack
		MOV	R8, #1
		MOV	R9, R10
		EOR	R9, R9, R10, ROR R8
		MOV	R11, R6
LOOP	
		EOR	R9, R9, R10, ROR R8
		ADD	R8, R8, #1
		CMP	R8, #32
		BNE	LOOP
		TST	R9, #1
		MOVEQ R11, R7
		
		LDMFD SP!, {R10, R6, R7, LR}  ; Restore registers from the stack
		BX LR
		
		END
