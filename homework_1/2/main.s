		AREA    Prog2, CODE, READONLY
        ENTRY
        
        MOV     r6, #10
        MOV     r7, #1
loop    CMP     r6, #0
        MULGT    r7, r6, r7
        SUBGT    r6, r6, #1
        BGT        loop
stop    B        stop
        END ;411440430 bo-chain