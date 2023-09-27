# NOTE
## systax
### MOV
```assembly
MOV 	r0, #0x11

mov <目的>, <來源>；
```
將來源值移入目的暫存器

### LSL & LSR
```assembly
LSL 	r1, r0, #1
LSR 	r1, r0, #1
LSL <目的寄存器>, <源寄存器>, 位移數 ; 
LSR <目的寄存器>, <源寄存器>, 位移數 ;
```
LSL指令用於對寄存器中的位執行左邏輯位移操作，即將位向左移動，右側填充零。
LSR指令用於對寄存器中的位執行右邏輯位移操作，即將位向右移動，左側填充零。

### Lable
```assembly
loop:
    MOV 	r0, #0x11
    LSL 	r1, r0, #1
    LSR 	r1, r0, #1
    B loop

```
在範例中我們可以看到 loop 這個 label，loop 標記的位置是一個無條件的分支（Branch），並使用指令 B 來實現，當程式執行到 loop 的所在位置時，會立即跳到 label loop 的位置，因此會造成無限迴圈。

### CMP
> 比較操作數並決定當前狀態為何。
- 若 `操作數A` > `操作數B` 則當前條件狀態為 `GT` （Great Than）
- 若 `操作數A` >= `操作數B` 則當前條件狀態為 `GE` （Great Equal）
- 若 `操作數A` < `操作數B` 則當前條件狀態為 `LT` （Less Than）
- 若 `操作數A` <= `操作數B` 則當前條件狀態為 `LE` （Less Equal）



### MUL & SUB
- MUL -> Multiply
  - 對於操作數進行乘法運算
- SUB -> Subtract
  - 對於操作數進行減法運算

預設 `r6` 為 2 而 `r7` 為 3 則執行以下指令 `r6` 將會變成 6
```assembly
MUL r6, r6, r7 ; r6 = r6 * r7 
MUL <目的>, <操作數A>, <操作數B> ; 將 操作數A * 操作數B 並存放置目標寄存器
```

預設 `r6` 為 3 則執行以下指令 `r6` 將會變成 2
```assembly
SUB r6, r6, #1 ; r6 = r6 - 1
SUB <目的>, <操作數A>, <操作數B> ; 將 操作數A - 操作數B 並存放置目標寄存器
```

