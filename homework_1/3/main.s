		AREA Prog4, CODE, READONLY
        ENTRY
        
        LDR		r0, =0XF631024C
        LDR		r1, =0X17539ABD
        EOR		r0, r0, r1
        EOR		r1, r0, r1
        EOR		r0, r0, r1
        
stop    B       stop;411440430 bo-chain
        END;