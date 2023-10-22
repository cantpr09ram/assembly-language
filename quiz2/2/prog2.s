		; 4xy - 7x +19
        AREA pretest2, CODE,READONLY
        ENTRY
        
        ; Load the value of x (in 2's complement) from r3
        MOV r3, #66     ;0x00000042
        NEG r3, r3        ;0xFFFFFFBE
        MOV r4, #44        ;0x0000002C

        ; Calculate 6x^2 and store it in r2
        MUL r5, r3, r4  ; r5 = xy            ;0xFFFFF4A8
        LSL r2, r5, #2  ; r2 = 4 * xy        ;0xFFFFD2A0

        ; Calculate 9x and subtract it from r2
        LSL r6, r3, #3  ; r6 = 8 * x            ;0xFFFFFDF0
        SUB r6, r6, r3    ; r6 = 7 * x            ;0xFFFFFE32
        SUB r2, r2, r6  ; r2 = 4 * xy - 7 * x    ;0xFFFFD46E

        ; Add 2 to r2
        ADD r2, r2, #19  ; r2 = 4 * xy - 9 * x + 19        ;0xFFFFD481
        ; The result is in r2
stop    B            stop
        END