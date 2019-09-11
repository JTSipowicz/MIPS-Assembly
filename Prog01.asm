# Prog01.asm
			.data
name:			.space 21			
howdy:			.asciiz "howdy!"
eyaPrmpt:		.asciiz "Enter age: "
yaiLab:			.asciiz "Your age is "
eygPrmpt:		.asciiz "Enter gender: "
ygiLab:			.asciiz "Your gender is "
eynPrmpt:		.asciiz "Enter name: "
yniLab:			.asciiz "Your name is "

			.text
			.globl main
main:
			li $v0,4
			la $a0, howdy
			syscall
			
			li $v0, 11
			li $a0, '\n'
			syscall
			
			li $v0,4
			la $a0, eyaPrmpt
			syscall
			li $v0,5
			syscall
			move $t0, $v0			# copy integer read (in $v0) to $t0
			li $v0,4
			la $a0, yaiLab
			syscall
			li $v0,1
			move $a0, $t0
			syscall
			
			li $v0, 11
			li $a0, '\n'
			syscall
			
			li $v0,4
			la $a0, eygPrmpt
			syscall
			li $v0,12
			syscall
			move $t0, $v0
			
			li $v0, 11
			li $a0, '\n'
			syscall
			
			li $v0,4
			la $a0, ygiLab
			syscall
			li $v0,11
			move $a0, $t0
			syscall
			
			li $v0, 11
			li $a0, '\n'
			syscall
			
			li $v0,4
			la $a0, eynPrmpt
			syscall
			li $v0, 8
			la $a0, name
			li $a1, 21
			syscall

			li $v0, 11
			li $a0, '\n'
			syscall
			
			li $v0,4
			la $a0, yniLab
			syscall
			#li $v0,4
			la $a0, name
			syscall

			li $v0, 10			# graceful exit
			syscall
			