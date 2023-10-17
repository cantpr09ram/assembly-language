		AREA Prog1, CODE, READONLY
        ENTRY
    
        MOV   	r0, #0x11
        LSL 	r1, r0, #1
        LSL 	r2, r1, #1
    
stop    B       stop
        END     ;411440430 bo-chain