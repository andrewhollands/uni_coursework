# Andrew Hollands
# caseconverter.asm-- A program that convert uppercase to lowercase
# Registers used:
# $t0 - used to store string
# t2 - used to store each character of string
.data
newline: .asciiz "\n"
string: .asciiz "The Knights field 16 varsity teams (6 men's, 9 women's and one co-ed sport) that have  won  numerous  national  and  conference  titles.  The  UCF  Knights  Football team won conference championships in 2007 and 2010, and the Knights women's basketball team won conference titles the 2009 and 2010."
.text main:
la $t0, string         # Load here the string
toLowerCase:
lb $t2, 0($t0) # We do as always, get the first byte pointed by the address
beqz $t2, end # if is equal to zero, the string is terminated
bgt $t2, 'A', upperCaseTest2
j continue
upperCaseTest2:
blt $t2, 'Z', isUpperCase
continue:
addi $t0, $t0, 1        # Increment the address
j toLowerCase
isUpperCase:
add $t2, $t2, 32
sb $t2, 0($t0)          # store it in the string always
j continue # continue iteration as
end:
li $v0, 4                # Print the string
la $a0, string
syscall
li $v0, 10 # exit the program
syscall
