### NOTE

1. 用 `LSL`來做 $x^2$ 及有號數的乘法也是
##### count 8^x
```assembly
    LSL r6, r3, #3  ; r6 = 8 * x 
    
```
##### count x*7
```assembly
    
    LSL r6, r3, #3  ; r6 = 8 * x 
    SUB r6, r6, r3  ; r6 = 7 * x          
```

2.  `MUL` 用在無號數上。有號數必須考慮正負號。

3. `NEG` 將數字轉換成 `2's complement`
```assembly
NEG r3, r3        
```