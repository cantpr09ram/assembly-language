def twos_complement(binary_num, num_bits=16):
    # Determine the number of bits in the binary number
    binary_num = bin(abs(decimal_num))[2:].zfill(num_bits)
    num_bits = len(binary_num)
    #print(num_bits % 4 )
   
    # Find the one's complement of the binary number
    ones_complement = ''
    for bit in binary_num:
        ones_complement += '0' if bit == '1' else '1'

    # Add 1 to the one's complement to get the two's complement
    carry = 1
    twos_complement = ''
    for bit in ones_complement[::-1]:
        if bit == '0' and carry == 1:
            twos_complement = '1' + twos_complement
            carry = 0
        elif bit == '1' and carry == 1:
            twos_complement = '0' + twos_complement
        else:
            twos_complement = bit + twos_complement

    # Pad the two's complement with leading zeros if necessary
    while len(twos_complement) < num_bits:
        twos_complement = '0' + twos_complement

    return twos_complement

def from_twos_complement(twos_complement):
    # Determine the number of bits in the two's complement
    num_bits = len(twos_complement)
    #print(num_bits % 4 )
    
    # Find the one's complement of the two's complement
    ones_complement = ''
    for bit in twos_complement:
        ones_complement += '0' if bit == '1' else '1'

    # Add 1 to the one's complement to get the original binary number
    carry = 1
    binary_num = ''
    for bit in ones_complement[::-1]:
        if bit == '0' and carry == 1:
            binary_num = '1' + binary_num
            carry = 0
        elif bit == '1' and carry == 1:
            binary_num = '0' + binary_num
        else:
            binary_num = bit + binary_num

    # Pad the binary number with leading zeros if necessary
    while len(binary_num) < num_bits:
        binary_num = '0' + binary_num

    return binary_num

decimal_num = int(input("input decimal number: "))

binary_num = bin(abs(decimal_num))[2:]

if decimal_num > 0:
    print(binary_num)
    print(hex(binary_num, 2))
else:
    twos_complement = twos_complement(binary_num)
    print(twos_complement)  
    print(hex(int(twos_complement, 2)).upper())
    #1000011100001
    #0111100011111


bits = 16
# Read the binary number from the user
hex_num = input("Enter a hexadecimal number: ")

# Convert the hexadecimal number to binary and pad it with leading zeros if necessary
binary_num = bin(int(hex_num, 16))[2:].zfill(bits)

# Convert the binary number to its decimal value
if binary_num[0] == '1':
    # Negative number
    binary_num = binary_num[1:]
    decimal_num =int(from_twos_complement(binary_num),2)
else:
    # Positive number
    decimal_num = int(binary_num, 2)

# Print the decimal value
print("The decimal value is:", decimal_num)
#0111100011111
#0111100011111

#0x00000F8A

"""
hex_num = input("input hex number: ")

binary_num = bin(int(hex_num.upper(), 16))[2:]
#print(binary_num)
print(from_twos_complement(binary_num))
print(int(from_twos_complement(binary_num), 2))
#0001000101111010
#0001000101111010
"""
