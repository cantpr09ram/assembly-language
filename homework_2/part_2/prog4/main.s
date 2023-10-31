    AREA    prog4, CODE, READONLY
    ENTRY

    ; Initial register values
    LDR     r2, =0x12345678
    LDR     r3, =0x87654321
    LDR     r4, =0x00000012

    ; (1) BIC r2, r2, #0xFF000000
    BIC     r2, r2, #0xFF000000  ; Clear the upper 8 bits

    ; (2) LSL r2, r3, #4
    LSL     r2, r3, #4          ; Logical left shift r3 by 4 bits and store in r2

    ; (3) LSL r2, r2, r4
    LSL     r2, r2, r4          ; Logical left shift r2 by r4

    ; (4) ROR r2, r2, #12
    ROR     r2, r2, #12         ; Rotate r2 right by 12 bits

    ; (5) AND r2, r2, r3
    AND     r2, r2, r3          ; Bitwise AND with r3

    ; (6) ORR r2, r2, r4
    ORR     r2, r2, r4          ; Bitwise OR with r4

    ; (7) EOR r2, r2, r4
    EOR     r2, r2, r4          ; Bitwise XOR with r4

    ; (8) BIC r2, r2, r4
    BIC     r2, r2, r4          ; Clear bits set in r4

    ; (9) EOR r2, r2, r3, ROR #7
    EOR     r2, r2, r3, ROR #7  ; Bitwise XOR with r3 rotated right by 7 bits

stop
    B    stop

    END
