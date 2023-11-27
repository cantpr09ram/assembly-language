<p align="center">
    <div align="center"><img src=https://user-images.githubusercontent.com/53370227/280514688-e1dd14a4-58f6-4222-b14d-4e248a79443f.jpeg width=300/></div>
    <h2 align="center">組語 CookBook</h2>
    <div align="center">看了也許比較放心</div>
</p>

### LSL & LSR

```assembly
LSL 	r1, r0, #1
LSR 	r1, r0, #1
LSL <目的寄存器>, <源寄存器>, 位移數 ;
LSR <目的寄存器>, <源寄存器>, 位移數 ;
```

LSL 指令用於對寄存器中的位執行左邏輯位移操作，即將位向左移動，右側填充零。
LSR 指令用於對寄存器中的位執行右邏輯位移操作，即將位向右移動，左側填充零。

#### 用 `LSL`來做 $x^2$ 及有號數的乘法

###### count $x^8$

```assembly
    LSL r6, r3, #3  ; r6 = 8 * x
```

###### count x\*7

```assembly
    LSL r6, r3, #3  ; r6 = 8 * x
    SUB r6, r6, r3  ; r6 = 7 * x
    ;7x = 8x -x
```

### MOV & LDR & STR

#### 'MOV'

- 在 register 間移動或者是注入 register
- $0<=r2<=255$

```assembly
MOV  r1, r2; r1=r2
```

#### 'LDR'

- 將 momory 的值載入 register

```assembly
LDR    r1, =0xE0000000 ;r1= 0xE00000000
LDR    r1,0xE0000000   ;將momory中位置在0xE0000000的直載入r1
LDR.   r1,[r0].              ;將r0中的數所指定的位置的內容傳送到r1
```

#### 'STR'

- 將 register 的值載入 memory

```assembly
STR.   r1,[r0]             ;將r1中的數所指定的位置的內容傳送到r0中的數所指定的memory中
```

### Frequently Used Directives

| keil directive      | uses                                                    | used |
| ------------------- | ------------------------------------------------------- | ---- |
| AREA                | define a block of code or data                          | ✅   |
| 'RN'                | can be used to associate a register with name           | ❌   |
| 'EQU'               | wquates a synbol to a unmeric constant                  | ✅   |
| 'ENTRY'             | decleares an entry point to your program                | ✅   |
| 'DCB', 'DCW', 'DCD' | allocates memory and specifies initial runtime contents | ✅   |
| 'ALIGN'             | aligns data or code to a particular memory size         | ✅   |
| 'END'               | disgnates the end of source file                        | ✅   |

### 'DCB', 'DCD', 'DCW'

#### 'DCW' vs. 'DCWU'

- DCW 要以 2 的倍數對齊存放
- DCWU 不需要
- w = halfword = 16bit

#### 'DCD' vs. 'DCDU'

- DCD 要以 4 的倍數對齊存放
- DCDU 不需要
- D = double word = 4bit

#### 'DCB'

```assembly
DCB    'T', 0
DCB    "hello world", 0
```

```assembly
DCB    20, 25, 30
```

| 0   | 1   | 2   | 3   | 4   |
| --- | --- | --- | --- | --- |
| 14  | 19  | 1E  | ❌  | ❌  |

```assembly
DCW    20, 25, 30
```

| 0   | 1   | 2   | 3   | 4   | 5   | 6   |
| --- | --- | --- | --- | --- | --- | --- |
| 14  | 00  | 19  | 00  | 1E  | 00  | ❌  |

```assembly
DCD    20, 25, 30
```

| 0   | 1   | 2   | 3   | 4   | 5   | 6   | 7   | 8   | 9   | 10  | 11  |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
| 14  | 00  | 00  | 00  | 19  | 00  | 00  | 00  | 1E  | 00  | 00  | 00  |

### ALIGN directive

```
ALIGN {expr {, offset}}
```

offset: the current location is aligned to the next address of them

```assembly
DCB    1
DCWU  0xEF
ALIGN  4, 2
DCB    1
```

| 4   | 5   | 6   | 7   | 8   | 9   | 10  | 11  |
| --- | --- | --- | --- | --- | --- | --- | --- |
| 01  | EF  | 00  | ❌  | ❌  | ❌  | 01  | ❌  |

```assembly
coeff    DCW    0xFE37, 0xBECC
data1   DCD    1, 5, 20
data2   DCB     255
data3   DCDU   1, 5, 20
```

| 0   | 1   | 2   | 3   | 4   | 5   | 6   | 7   | 8   | 9   | 10  | 11  | 12  | 13  | 14  | 15  | 16  | 17  | 18  | 19  | 20  | 21  | 22  | 23  | 24  | 25  | 26  | 27  | 28  |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
| 37  | FE  | CC  | BE  | 01  | 00  | 00  | 00  | 05  | 00  | 00  | 00  | 14  | 00  | 00  | 00  | FF  | 01  | 00  | 00  | 00  | 05  | 00  | 00  | 00  | 14  | 00  | 00  | 00  |

```assembly
coeff    DCW    0xFE37, 0xBECC
data1   DCD    1, 5, 20
data2   DCB     255
data3   DCD   1, 5, 20
```

| 0   | 1   | 2   | 3   | 4   | 5   | 6   | 7   | 8   | 9   | 10  | 11  | 12  | 13  | 14  | 15  | 16  | 17  | 18  | 19  | 20  | 21  | 22  | 23  | 24  | 25  | 26  | 27  | 28  |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
| 37  | FE  | CC  | BE  | 01  | 00  | 00  | 00  | 05  | 00  | 00  | 00  | 14  | 00  | 00  | 00  | FF  | ❌  | ❌  | ❌  | 01  | 00  | 00  | 00  | 05  | 00  | 00  | 00  | 14  |

### loads, stores and addressing

#### Most ofent used load/store instructions

| Loads | Stores | size and type    |
| ----- | ------ | ---------------- |
| LDR   | STR    | word(32bit)      |
| LDRB  | STRB   | byte (8bit)      |
| LDRH  | STRH   | halfword (16bit) |
| LDRSB |        | signed byte      |
| LDRSH |        | signed halfword  |
| LDM   | STM    | multiple word    |
#### effective address (EA)
```
LDR|STR{<size>}{<cond>} <Rd>, <addressing mode>
```
```
LDR|STR{<size>}{<cond>} <Rd>, [<Rn>, <offset>]{!}
```
```assembly
LDR		r0, =0x40000000
LDR		r1, =0x1234ABCD
STR		r1,[r0]
		
LDRH	r1, [r0]
```
|00|01|02|03|
|--|--|--|--|
|CD|AB|34|12|
```assembly
LDR		r0, =0x40000000
LDR		r1, =0x1234ABCD
STR		r1,[r0,#4]
LDRH	r1, [r0]
```
|00|01|02|03|04|05|06|07|
|--|--|--|--|--|--|--|--|
|❌|❌|❌|❌|CD|AB|34|12|

### BIC & ORR
##### BIC
```assembly
BIC{cond}{S} Rd, Rn, Operand2
BIc     r0, r1, #0x000000FF
```
用1指定哪些位元要清為0
##### ORR
```assembly
ORR{cond}{S} Rd, Rn, Operand2

```
```assembly
LDR		r0, =0x000000002
LDR		r1, =1
ROR		r0, r0, r1
```
右移後依序存回高位元
|0|1|2|3|4|5|6|7|8|9|10|11|12|13|14|15|
|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|
|0|0|0|0|0|0|0|0|0|0|0 |0 |0 |0 |1 |0 |

|0|1|2|3|4|5|6|7|8|9|10|11|12|13|14|15|
|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|
|0|0|0|1|1|0|1|0|0|0|0 |0 |0 |0 |0 |1 |

```assembly
AREA    Prog1, CODE, READONLY
        ENTRY

        ldr        r0, =0xabdecdad
        ldr        r1, =0xcd65ab87
        ldr        r2,    =0x40000020
        ldr        r3, =0x40000030

        str        r0, [r2]
        str        r1, [r3]

        ldr        r5, =1
        ldr        r6, =0
        ldr        r8, =0x40000040
        eor        r7,    r0,    r1    ;66bb662a=0110 0110 1011 1011 0110 0110 0010 1010
        ;1,3,5,9,10,13,14,16,17,19,20,21,23,25,26,29,30 bits are different
loop
        tst        r7,    r5
        strbne    r6, [r8], #1
        lsl        r5, r5, #1
        add     r6, r6, #1
        cmp        r6, #32
        bne        loop
stop    b          stop
        end
```
