		AREA Prog1, CODE, READONLY
        ENTRY
    
        MOV     r3, #0x02D   ;
		LSL     r3, r3, #4     ;

		ADD     r3, r3, #0x000B ;
		MOV		r2, #6
		
		MUL		r2, r3, r2;6x 
		MUL		r2, r3, r2;6x^2
		
		MOV     r1, #9 ;-9x
		MUL     r1, r3, r1
		
		SUB     r2, r2, r1
		
		ADD     r2, r2, #2 ;+2
		
    
stop    B       stop
        END     ;411440430 bo-chain