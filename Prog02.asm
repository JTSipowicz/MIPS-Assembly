			.data
intArr:			.word 2, 3, 1, 8	# global int array of size 4 initialized
			 			#   to 2, 3, 1 & 8 (from 1st to 4th)

			.text
			.globl main
main:
					
 			# BEGIN_(swapping intArr[0] & intArr[2] in memory)
			la $t0, intArr		# $t0 has address of intArr
			lw $t1, 0($t0)		# $t1 has oneInt[0] (should be 2)
			#lw $t3, 2($t0)		# caveat aside: ¡load address not aligned!
			lw $t3, 8($t0)		# $t3 has oneInt[2] (should be 1)
			
			## BEGIN_(print extra to show intArr[0] & intArr[2] just loaded)
			li $v0, 1
			move $a0, $t1		# should print 2
			syscall
			move $a0, $t3		# should print 1
			syscall
			## END_(print extra to show intArr[0] & intArr[2] just loaded)
			
			sw $t3, 0($t0)		# put "int in $t3" to intArr[0] in memory
			sw $t1, 8($t0)		# put "int in $t1" to intArr[2] in memory
 			# END_(swapping intArr[0] & intArr[2] in memory)

			li $v0, 11
			li $a0, '\n'
			syscall

			li $v0, 1
			lw $a0, 0($t0)		# reload content of intArr[0] in memory into $a0
			syscall			# should print 1
			lw $a0, 8($t0)		# reload content of intArr[2] in memory into $a0
			syscall			# should print 2
			
			li $v0, 10		# graceful exit
			syscall
#################################################
						
			
