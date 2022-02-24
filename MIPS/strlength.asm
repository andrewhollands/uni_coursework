# Andrew Hollands
# strlength.asm-- A program that determines the length
# of a null terminated string
# Registers used:
# $t0 - used to hold the loop counter
# $a0 - used to hold the address of string
# $v0 - syscall parameter and return value
.data
str: .asciiz "abcde"
.text
la $a0, str # load address of string into a0
strlen:
li $t0, 0 # initialize the counter to zero
loop:
lb $t1, 0($a0) # load the next character into t1
beqz $t1, exit # check for the null character
addi $a0, $a0, 1 # Increment string index
addi $t0, $t0, 1 # Increment loop counter
j loop
exit:
li $v0, 1 # print integer to user
move $a0, $t0 # set $a0 = $t0's contents (loop counter, or string length)
syscall
li $v0, 10 # exit program
syscall
