#####################################################################				
# CS-2318 demo program 3:
# Compute/display volume of sphere of specified radius r
# Formula: volume = (4/3)*(201/64)*r*r*r
#####################################################################				
				.data
prompt:				.asciiz "Enter radius: "	
outLab1:			.asciiz "Volume is "
				.text
				.globl main
main:
				li $v0, 4
				la $a0, prompt
				syscall

				li $v0, 5
				syscall				# $v0 has specified r
				
				move $t0, $v0			# $t0 has copy of r
				mult $t0, $t0			# Lo has r*r
				mflo $t9			# $t9 has r*r
				mult $t9, $t0			# Lo has r*r*r
				mflo $t9			# $t9 has r*r*r
				sll $t9, $t9, 2			# $t9 has 4*r*r*r
				li $t3, 3			# $t3 has 3
				div $t9, $t3			# Lo has 4*r*r*r/3
				mflo $t9			# $t9 has 4*r*r*r/3
				li $t3, 201			# $t3 has 201
				mul $t9, $t9, $t3		# $t9 has 4*r*r*r/3*201				
				sra $t9, $t9, 6			# $t9 has 4*r*r*r/3*201/64
				
				li $v0, 4
				la $a0, outLab1
				syscall
				li $v0, 1
				move $a0, $t9
				syscall
				
				li $v0, 10
				syscall				
#####################################################################				
# test runs
#####################################################################				
# Enter radius: 1
# Volume is 3
# -- program is finished running --
# 
# 
# Reset: reset completed.
# 
# Enter radius: 5
# Volume is 521
# -- program is finished running --
# 
# 
# Reset: reset completed.
# 
# Enter radius: 10
# Volume is 4186
# -- program is finished running --
# 
# 
# Reset: reset completed.
# 
# Enter radius: 50
# Volume is 523435
# -- program is finished running --
# 
# 
# Reset: reset completed.
# 
# Enter radius: 100
# Volume is 4187498
# -- program is finished running --
#####################################################################				
