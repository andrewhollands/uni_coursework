# Andrew Hollands -- 09/23/2020
# twofunctions.asm-- A program that
# computes and prints two 
# functions, f and g, which 
# are expressed as follows:
# f = (A * B - 6)
# g = (8 * C - 3)
# Registers used:
# $t0 - used to hold integer i.
# $t1 - used to hold integer A.
# $t2 - used to hold integer B.
# $t3 - used to hold integer C.
# $t4 - used to hold integer r.
# $t5 - used to hold subtraction constant integer 6.
# $s0 - used to hold integer i.
# $s1 - used to hold integer r.
# $s2 - used to hold integer 8 (multiplicant of C).
# $s3 - used to hold subtraction constant integer 3.
# $v0 - syscall parameter and return value.
# $a0 - syscall parameter.

.data
out_string: .asciiz "Enter 3 integers for A, B, C respectively:\n\n" # Read message to user
newline: .asciiz "\n" # Line break
f_dec: .asciiz "\nf_ten = " # Decimal value precedent of function f
f_bin: .asciiz "\nf_two = " # Binary value precedent of function f
g_dec: .asciiz "\ng_ten = " # Decimal value precedent of function g
g_bin: .asciiz "\ng_two = " # Binary value precedent of function g

.text
li $v0, 4 # Print string
la $a0, out_string # Load data address to be printed
syscall

li $v0, 5 # Read integer A
syscall
move $t1, $v0 # Move value in $v0 to $t1

li $v0, 4 # Print string
la $a0, newline # Load data address to be printed
syscall

li $v0, 5 # Read integer B
syscall
move $t2, $v0 # Move value in $v0 to $t2

li $v0, 4 # Print string
la $a0, newline # Load data address to be printed
syscall

li $v0, 5 # Read integer C
syscall
move $t3, $v0 # Move value in $v0 to $t3

li $t0, 0 # Set loop counter i to 0
li $t4, 0 # Set integer r to 0
li $t5, 6 # Set subtraction integer to 6
Loop:
bge $t0, $t2, exit # For loop from 0 to B value
add $t4, $t4, $t1 # r = r + A
addi $t0, $t0, 1 # Increment loop counter i; i = i + 1
j Loop # Jump again to check Loop condition
exit:
li $v0, 4 # Print string
la $a0, f_dec # Load data address to be printed
syscall

li $v0, 1 # Print integer
sub $t4, $t4, $t5  # Subtract 6 from r
move $a0, $t4 # Set $a0 to r (printed vlaue)
syscall

li $v0, 4 # Print string
la $a0, newline # Load data address to be printed
syscall

li $v0, 4 # Print string
la $a0, f_bin # Load data address to be printed
syscall

li $v0, 35 # Print binary representation
move $a0, $t4 # Set $a0 to r (printed value)
syscall

li $v0, 4 # Print string
la $a0, newline # Load data address to be printed
syscall

li $s0, 0 # Set loop counter i to 0
li $s1, 0 # Set integer r to 0
li $s2, 8 # End condition of For loop
li $s3, 3 # Set subtraction integer to 3
Loop1:
bge $s0, $s2, exit1  # For loop from 0 to 8
add $s1, $s1, $t3 # r = r + C
addi $s0, $s0, 1 # Increment loop counter i; i = i + 1
j Loop1 # Jump again to check Loop1 condition
exit1:

li $v0, 4 # Print string
la $a0, g_dec # Load data address to be printed
syscall

li $v0, 1 # Print integer
sub $s1, $s1, $s3 # Subtract 3 from r
move $a0, $s1 # Set $a0 to r (printed value)
syscall

li $v0, 4 # Print string
la $a0, newline # Load data address to be printed
syscall

li $v0, 4 # Print string
la $a0, g_bin # Load data address to be printed
syscall

li $v0, 35 # Print binary representation
move $a0, $s1 # Set $a0 to r (printed value)
syscall

li $v0, 10 # End program
syscall
