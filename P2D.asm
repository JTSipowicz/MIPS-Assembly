# James Sipowicz, CS 2318-251, Assignment 2 Part 1 Program D.
			.data
promptExam1:		.asciiz "Enter Exam 1 Score: "
promptExam2:		.asciiz "Enter Exam 2 Score: "
promptFinalExam:	.asciiz "Enter Final Exam Score: "
output:			.asciiz "Your Cumulative average is: "
			.text
			.globl main
main:
			li $t4, 0
			
			la $a0, promptExam1
			li $a1, 115
			li $a2, 512
			jal getnum
			
			la $a0, promptExam2
			li $a1, 8
			li $a2, 29
			jal getnum
			
			la $a0, promptFinalExam
			li $a1, 1
			li $a2, 2
			jal getnum 
			
			li $v0, 4
			la $a0, output
			syscall
			
			li      $v0,1
   			move    $a0,$t4
    			syscall
			
			li $v0, 10	# graceful exit
			syscall
			
getnum:
			li      $v0,4   # syscall to print string
    			syscall

    			li      $v0,5   # syscall to read integer
    			syscall

    			mul     $v0,$v0,$a1	# multiply by scale
    			div     $v0,$a2		# divide by scale
    			mflo    $v0		# get quotient

    			add     $t4,$t4,$v0     # add to sum

   			jr      $ra            # return
###############################################################################
# OUTPUT
###############################################################################
# Enter Exam 1 Score: 70
# Enter Exam 2 Score: 90
# Enter Final Exam Score: 100
# Your Cumulative average is: 89
###############################################################################