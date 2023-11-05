```assembly
SRAM_BASE		EQU		0x40000000; start of SRAM910FM32
		AREA	StrCopy, CODE
		ENTRY					  ;mark the first instruction
Main
		ADR		r1, srcstr        ;Load the address of the source string into r1
		LDR		r0, =SRAM_BASE    ;Load the base address of SRAM into r0 (destination)
		
strcopy
		LDRB	r2, [r1], #1      ;load byte, update address
		CMP		r2, #0            ;check for zero terminator(分界)
        ; If r2 is not zero (not the null terminator), copy the byte to the destination
		STRBNE	r2, [r0], #1      ;Store the byte at the destination, update destination address
		BNE		strcopy           ;keep going if not

stop	B		stop
srcstr	DCB		"This is my (source) string", 0
		END
```

##### 延伸題目 reverse string
```assembly
SRAM_BASE		EQU		0x40000000; start of SRAM910FM32
		AREA	StrCopy, CODE
		ENTRY					  ;mark the first instruction
Main
		ADR		r1, srcstr 
		LDR		r0, =SRAM_BASE
		ADD		r0, #25
strcopy
		LDRB	r2, [r1], #1
		CMP		r2, #0
		STRBNE	r2, [r0], #-1
		BNE		strcopy

stop	B		stop
srcstr	DCB		"This is my (source) string", 0
		END
```