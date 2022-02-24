# Andrew Hollands
# characterinstancecounter.asm--A program that determines the number of times 
# in which characters (upper- or lowercase) C, H, A, R, G,
# E, O, N are presented in a stored string of text and 
# displays the results in integer and histogram forms  
#
# Registers used:
# $t0 - Used to hold the stored string
# $t1 - Used to point to address, or index, of stored string
# $a0 - Used to hold the address of string or integer to be printed
# $v0 - Syscall parameter and return value
# $t2 - Used to hold the histogram counter of 'C' frequencies
# $t3 - Used to hold the histogram counter of 'H' frequencies
# $t4 - Used to hold the histogram counter of 'A' frequencies
# $t5 - Used to hold the histogram counter of 'R' frequencies
# $t6 - Used to hold the histogram counter of 'G' frequencies
# $t7 - Used to hold the histogram counter of 'E' frequencies
# $t8 - Used to hold the histogram counter of 'O' frequencies
# $t9 - Used to hold the histogram counter of 'N' frequencies
# $s0 - Used to hold the integer counter of 'C' frequencies
# $s1 - Used to hold the integer counter of 'H' frequencies
# $s2 - Used to hold the integer counter of 'A' frequencies
# $s3 - Used to hold the integer counter of 'R' frequencies
# $s4 - Used to hold the integer counter of 'G' frequencies
# $s5 - Used to hold the integer counter of 'E' frequencies
# $s6 - Used to hold the integer counter of 'O' frequencies
# $s7 - Used to hold the integer counter of 'N' frequencies
.data
string: .asciiz "The Knights field 16 varsity teams (6 men's, 9 women's and one co-ed sport) that have  won  numerous  national  and  conference  titles.  The  UCF  Knights  Football team won conference championships in 2007 and 2010, and the Knights women's basketball team won conference titles the 2009 and 2010."
newline: .asciiz "\n"
C: .asciiz "C: " # Text precedent of 'C' frequencies
H: .asciiz "H: " # Text precedent of 'H' frequencies
A: .asciiz "A: " # Text precedent of 'A' frequencies
R: .asciiz "R: " # Text precedent of 'R' frequencies
G: .asciiz "G: " # Text precedent of 'G' frequencies
E: .asciiz "E: " # Text precedent of 'E' frequencies
O: .asciiz "O: " # Text precedent of 'O' frequencies
N: .asciiz "N: " # Text precedent of 'N' frequencies
hash: .asciiz "#" # Histogram object
.text
li $s0, 0 # Initialize counter of 'C' frequencies
li $s1, 0 # Initialize counter of 'H' frequencies
li $s2, 0 # Initialize counter of 'A' frequencies
li $s3, 0 # Initialize counter of 'R' frequencies
li $s4, 0 # Initialize counter of 'G' frequencies
li $s5, 0 # Initialize counter of 'E' frequencies
li $s6, 0 # Initialize counter of 'O' frequencies
li $s7, 0 # Initialize counter of 'N' frequencies
la $t0, string # Load the stored string
countCharacters: # Begin loop
lb $t1, 0($t0) # We do as always, get the first byte pointed by the address
beqz $t1, end # Terminate loop once end of string, or null terminator, is reached
beq $t1, 67, label1 # If address is 67 (ASCII value of 'C') go to label1
beq $t1, 99, label1 # If address is 99 (ASCII value of 'c') go to label1
beq $t1, 72, label2 # If address is 72 (ASCII value of 'H') go to label2
beq $t1, 104, label2 # If address is 104 (ASCII value of 'h') go to label2
beq $t1, 65, label3 # If address is 65 (ASCII value of 'A') go to label3
beq $t1, 97, label3 # If address is 97 (ASCII value of 'a') go to label3
beq $t1, 82, label4 # If address is 82 (ASCII value of 'R') go to label4
beq $t1, 114, label4 # If address is 114 (ASCII value of 'r') go to label4
beq $t1, 71, label5 # If address is 71 (ASCII value of 'G') go to label5
beq $t1, 103, label5 # If address is 103 (ASCII value of 'g') go to label5
beq $t1, 69, label6 # If address is 69 (ASCII value of 'E') go to label6
beq $t1, 101, label6 # If address is 101 (ASCII value of 'e') go to label6
beq $t1, 79, label7 # If address is 79 (ASCII value of 'O') go to label7
beq $t1, 111, label7 # If address is 111 (ASCII value of 'o') go to label7
beq $t1, 78, label8 # If address is 78 (ASCII value of 'N') go to label8
beq $t1, 110, label8 # If address is 110 (ASCII value of 'n') go to label8
countCharacters1:
addi $t0, $t0, 1 # Increment the address
j countCharacters # Go back to beginning of loop

label1:
addi $s0, $s0, 1 # Increment 'C' instance counter
j countCharacters1
label2:
addi $s1, $s1, 1 # Increment 'H' instance counter
j countCharacters1
label3:
addi $s2, $s2, 1 # Increment 'A' instance counter
j countCharacters1
label4:
addi $s3, $s3, 1 # Increment 'R' instance counter
j countCharacters1
label5:
addi $s4, $s4, 1 # Increment 'G' instance counter
j countCharacters1
label6:
addi $s5, $s5, 1 # Increment 'E' instance counter
j countCharacters1
label7:
addi $s6, $s6, 1 # Increment 'O' instance counter
j countCharacters1
label8:
addi $s7, $s7, 1 # Increment 'N' instance counter
j countCharacters1

end:
li $v0, 4 # Print string
la $a0, C # Load data address to be printed
syscall

li $v0, 1 # Print integer
move $a0, $s0 # Set $a0 to 'C' counter (printed value)
syscall

li $v0, 4 # Print string
la $a0, newline # Load data address to be printed
syscall

li $v0, 4 # Print string
la $a0, H # Load data address to be printed
syscall

li $v0, 1 # Print integer
move $a0, $s1 # Set $a0 to 'H' counter (printed value)
syscall

li $v0, 4 # Print string
la $a0, newline # Load data address to be printed
syscall

li $v0, 4 # Print string
la $a0, A # Load data address to be printed
syscall

li $v0, 1 # Print integer
move $a0, $s2 # Set $a0 to 'A' counter (printed value)
syscall

li $v0, 4 # Print string
la $a0, newline # Load data address to be printed
syscall

li $v0, 4 # Print string
la $a0, R # Load data address to be printed
syscall

li $v0, 1 # Print integer
move $a0, $s3 # Set $a0 to 'R' counter (printed value)
syscall

li $v0, 4 # Print string
la $a0, newline # Load data address to be printed
syscall

li $v0, 4 # Print string
la $a0, G # Load data address to be printed
syscall

li $v0, 1 # Print integer
move $a0, $s4 # Set $a0 to 'G' counter (printed value)
syscall

li $v0, 4 # Print string
la $a0, newline # Load data address to be printed
syscall

li $v0, 4 # Print string
la $a0, E # Load data address to be printed
syscall

li $v0, 1 # Print integer
move $a0, $s5 # Set $a0 to 'E' counter (printed value)
syscall

li $v0, 4 # Print string
la $a0, newline # Load data address to be printed
syscall

li $v0, 4 # Print string
la $a0, O # Load data address to be printed
syscall

li $v0, 1 # Print integer
move $a0, $s6 # Set $a0 to 'O' counter (printed value)
syscall

li $v0, 4 # Print string
la $a0, newline # Load data address to be printed
syscall

li $v0, 4 # Print string
la $a0, N # Load data address to be printed
syscall

li $v0, 1 # Print integer
move $a0, $s7 # Set $a0 to 'N' counter (printed value)
syscall

li $v0, 4 # Print string
la $a0, newline # Load data address to be printed
syscall

li $v0, 4 # Print string
la $a0, newline # Load data address to be printed
syscall

li $t2, 0 # Initialize loop counter for 'C' frequency histogram
li $t3, 0 # Initialize loop counter for 'H' frequency histogram
li $t4, 0 # Initialize loop counter for 'A' frequency histogram
li $t5, 0 # Initialize loop counter for 'R' frequency histogram
li $t6, 0 # Initialize loop counter for 'G' frequency histogram
li $t7, 0 # Initialize loop counter for 'E' frequency histogram
li $t8, 0 # Initialize loop counter for 'O' frequency histogram
li $t9, 0 # Initialize loop counter for 'N' frequency histogram

li $v0, 4 # Print string
la $a0, C # Load data address to be printed
syscall

C1: # Begin loop for 'C' frequency histogram
beq $t2, $s0, exit1 # Branch to exit1 label if $t2 is equal to $s0
li $v0, 4 # Print string
la $a0, hash # Load data address to be printed
syscall
addi $t2, $t2, 1 # Increment loop counter
j C1 # Jump back to beginning of 'C' frequency loop

exit1:
li $v0, 4 # Print string
la $a0, newline # Load data address to be printed
syscall
li $v0, 4 # Print string
la $a0, H # Load data address to be printed
syscall

C2: # Begin loop for 'H' frequency histogram
beq $t3, $s1, exit2 # Branch to exit2 label if $t3 is equal to $s1
li $v0, 4 # Print string
la $a0, hash # Load data address to be printed
syscall
addi $t3, $t3, 1 # Increment loop counter
j C2 # Jump back to beginning of 'H' frequency loop

exit2:
li $v0, 4 # Print string
la $a0, newline # Load data address to be printed
syscall
li $v0, 4 # Print string
la $a0, A # Load data address to be printed
syscall

C3: # Begin loop for 'A' frequency histogram
beq $t4, $s2, exit3 # Branch to exit3 label if $t4 is equal to $s2
li $v0, 4 # Print string
la $a0, hash # Load data address to be printed
syscall
addi $t4, $t4, 1 # Increment loop counter
j C3 # Jump back to beginning of 'A' frequency loop

exit3:
li $v0, 4 # Print string
la $a0, newline # Load data address to be printed
syscall
li $v0, 4 # Print string
la $a0, R # Load data address to be printed
syscall

C4: # Begin loop for 'R' frequency histogram
beq $t5, $s3, exit4 # Branch to exit4 label if $t5 is equal to $s3
li $v0, 4 # Print string
la $a0, hash # Load data address to be printed
syscall
addi $t5, $t5, 1 # Increment loop counter
j C4 # Jump back to beginning of 'R' frequency loop

exit4:
li $v0, 4 # Print string
la $a0, newline # Load data address to be printed
syscall
li $v0, 4 # Print string
la $a0, G # Load data address to be printed
syscall

C5: # Begin loop for 'G' frequency histogram
beq $t6, $s4, exit5 # Branch to exit5 label if $t6 is equal to $s4
li $v0, 4 # Print string
la $a0, hash # Load data address to be printed
syscall
addi $t6, $t6, 1 # Increment loop counter
j C5 # Jump back to beginning of 'G' frequency loop

exit5:
li $v0, 4 # Print string
la $a0, newline # Load data address to be printed
syscall
li $v0, 4 # Print string
la $a0, E # Load data address to be printed
syscall

C6: # Begin loop for 'E' frequency histogram
beq $t7, $s5, exit6 # Branch to exit6 label if $t7 is equal to $s5
li $v0, 4 # Print string
la $a0, hash # Load data address to be printed
syscall
addi $t7, $t7, 1 # Increment loop counter
j C6 # Jump back to beginning of 'E' frequency loop

exit6:
li $v0, 4 # Print string
la $a0, newline # Load data address to be printed
syscall
li $v0, 4 # Print string
la $a0, O # Load data address to be printed
syscall

C7: # Begin loop for 'O' frequency histogram
beq $t8, $s6, exit7 # Branch to exit7 label if $t8 is equal to $s6
li $v0, 4 # Print string
la $a0, hash # Load data address to be printed
syscall
addi $t8, $t8, 1 # Increment loop counter
j C7 # Jump back to beginning of 'O' frequency loop

exit7:
li $v0, 4 # Print string
la $a0, newline # Load data address to be printed
syscall
li $v0, 4 # Print string
la $a0, N # Load data address to be printed
syscall

C8: # Begin loop for 'N' frequency histogram
beq $t9, $s7, exit # Branch to exit label if $t9 is equal to $s7
li $v0, 4 # Print string
la $a0, hash # Load data address to be printed
syscall
addi $t9, $t9, 1 # Increment loop counter
j C8 # Jump back to beginning of 'N' frequency loop

exit:
li $v0, 10 # End program
syscall
