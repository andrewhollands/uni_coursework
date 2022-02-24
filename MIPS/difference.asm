# Andrew Hollands -- 09/16/2020
# difference.asm-- A program that
# computes and prints the
# difference of two numbers
# specified at runtime by 
# the user. 
# Registers used:
# $t0 - used to hold the first larger number.
# $t1 - used to hold the second smaller number.
# $t2 - used to hold the difference of the $t0 and $t1.
# $v0 - syscall parameter and return value.
# $a0 - syscall parameter.

.data
out_string: .asciiz "\nPlease enter first larger integer: "
out_string1: .asciiz "\nPlease enter second smaller integer: "
out_string2: .asciiz "\nDifference between the two integers: "

.text
li $v0, 4
la $a0, out_string
syscall

li $v0, 5
syscall
move $t0, $v0

li $v0, 4
la $a0, out_string1
syscall

li $v0, 5
syscall
move $t1, $v0

li $v0, 4
la $a0, out_string2
syscall

li $v0, 34
sub $t2, $t0, $t1
move $a0, $t2
syscall

li $v0, 10
syscall
