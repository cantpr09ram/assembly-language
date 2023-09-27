		AREA    Prog2, CODE, READONLY
        ENTRY
        
        MOV     r6, #11
        MOV     r7, #1
loop    CMP     r6, #0
        MULGT    r7, r6, r7
        SUBGT    r6, r6, #1
        BGT        loop
		MOV 	r8,#11
		MUL	    r7, r8, r7
stop    B        stop
        END ;