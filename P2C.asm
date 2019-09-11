# James Sipowicz, CS 2318-251, Assignment 2 Part 1 Program C.
		.data
intArr:		.word 44, 99, 33, 11, 55 # global int array of size 5 initialized
		 			 # to 44, 99, 33, 11, 55 (from 1st to 5th)
		.text
		.globl main
main:
		# Load values into $t0-$t5 registers
		la $t0, intArr
		lw $t1, 0($t0)		# $t1 has intArr[0] (should be 44)
		lw $t2, 4($t0)		# $t2 has intArr[1] (should be 99)
		lw $t3, 8($t0)		# $t3 has intArr[2] (should be 33)
		lw $t4, 12($t0)		# $t4 has intArr[3] (should be 11)
		lw $t5, 16($t0)		# $t5 has intArr[4] (should be 55)
		# Print values from $t0-$t5 registers
		li $v0, 1
		move $a0, $t1		# Print $t1
		syscall
        	move $a0, $t2		# Print $t2
        	syscall
        	move $a0, $t3		# Print $t3
        	syscall
        	move $a0, $t4		# Print $t4
        	syscall
        	move $a0, $t5		# Print $t5
        	syscall
        	# Swap values for intArr[0]->intArr[3] (11 & 44)
        	sw $t4, 0($t0)		# put "11" to intArr[0] in memory
        	sw $t1, 12($t0) 	# put "44" to intArr[3] in memory
        	# Swap values for intArr[1]->intArr[4] (99 & 55)
        	sw $t5, 4($t0)		# put "55" to intArr[1] in memory
        	sw $t2, 16($t0)		# put "99" to intArr[4] in memory
        	# Print a new line
        	li $v0, 11
		li $a0, '\n'
		syscall
		li $v0, 1
		lw $a0, 16($t0)	# reload content of intArr[4] in memory to $a0
		syscall	
		lw $a0, 12($t0)	# reload content of intArr[3] in memory to $a0
		syscall	
		lw $a0, 8($t0)	# reload content of intArr[3] in memory to $a0
		syscall	
		lw $a0, 4($t0)	# reload content of intArr[1] in memory to $a0
		syscall
		lw $a0, 0($t0)	# reload content of intArr[0] in memory to $a0
		syscall
		
		li $v0, 10	# graceful exit
		syscall
###############################################################################
# OUTPUT
###############################################################################
#4499331155
#9944335511
#-- program is finished running --
###############################################################################