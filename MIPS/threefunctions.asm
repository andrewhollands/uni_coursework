# Andrew Hollands -- 09/30/2020
# threefunctions.asm-- A program that
# computes and prints three 
# functions, f, g, and h, which 
# are expressed as follows:
# h = (f + 3) / (g + 6)
# Registers used:
# $t0 - used to hold integer i, loop counter.
# $t1 - used to hold integer f.
# $t2 - used to hold integer g.
# $t3 - used to hold integer 3, added to f.
# $t4 - used to hold integer 6, added to g.
# $v0 - syscall parameter and return value.
# $a0 - syscall parameter.

.data
newline: .asciiz "\n" # Line break
f_dec: .asciiz "\nf_ten = " # Decimal value precedent of function f
g_dec: .asciiz "\ng_ten = " # Decimal value precedent of function g
h_quo: .asciiz "\nh_quotient = " # Decimal value precedent of function h's quotient
h_rem: .asciiz "\nh_remainder = " # Decimal value precent of function h's remainder

.text
li $v0, 4 # Print string
la $a0, f_dec # Load data address to be printed
syscall

li $v0, 5 # Read integer f_dec
syscall
move $t1, $v0 # Move value in $v0 to $t1

li $v0, 4 # Print string
la $a0, g_dec # Load data address to be printed
syscall

li $v0, 5 # Read integer g_dec
syscall
move $t2, $v0 # Move value in $v0 to $t2

li $t3, 3 # Set $t3 equal to 3 (added to f_ten)
add $t1, $t1, $t3 # Add 3 to f_ten
li $t4, 6 # Set $t4 equal to 6 (added to g_ten
add $t2, $t2, $t4 # Add 6 to g_ten
li $t0, 0 # Intialize loop counter i, or quotient Q

Loop:
blt $t1, $t2, exit # Exit loop when dividend is less than divisor (If $t1 < $t2, exit loop)
addi $t0, $t0, 1 # Increment loop counter, or quotient Q
sub $t1, $t1, $t2 # Update dividend by subtracting divisor from dividend, $t1 is remainder, $t0 is quotient
j Loop # Loop back through loop when dividend is greater than divisor
exit:

li $v0, 4 # Print string
la $a0, h_quo # Load data address (a string) to be printed
syscall

li $v0, 1 # Print integer
move $a0, $t0 # Move quotient to print register
syscall

li $v0, 4 # Print string
la $a0, newline # Load data address (a newline character) to be printed
syscall

li $v0, 4 # Print string
la $a0, h_rem # Load data address (a string) to be printed
syscall

li $v0, 1 # Print integer
move $a0, $t1 # Move remainder to print register
syscall

li $v0, 10 # End program
syscall
