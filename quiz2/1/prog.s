		; Compute j = (2^n + 4^m + 8^p) - 17 and put j in r5
        ;j = (2^n + 4^m + 8^p) - 17 = (2^n + 2^2m + 2^3p) - 17
        AREA pretest2, CODE,READONLY                        
        ENTRY

        MOV r2, #25  ; Initialize r2 with the value 25 (n)
        MOV r3, #22  ; Initialize r3 with the value 11 * 2 (2m)
        MOV r4, #18   ; Initialize r4 with the value 6 * 3 (3p)
        
        MOV r5, #1          ; Initialize r5 to 1 (for the final subtraction)
        MOV r6, #1
        MOV r7, #1
        LSL r5, r2         ; r5 = 2^n                    ;0x02000000
        LSL r6, r3         ; r6 = 2^2m                    ;0x00400000
        ADD r5, r5, r6     ; r5 = 2^n + 2^m                ;0x02400000
        LSL r7, r4         ; r7 = 2^3p                    ;0x00040000
        ADD r5, r5, r7     ; r5 = 2^n + 2^2m + 2^3p        ;0x02440000
        SUB r5, r5, #17    ; r5 = 2^n + 2^2m + 2^3p - 17    ;0x0243FFEF

stop    B            stop
        END