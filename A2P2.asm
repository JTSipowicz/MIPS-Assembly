# James Sipowicz, CS 2318-251, Assignment 2 Part 2
			.data			.
intArr1:		.space 50
intArr2:		.space 50
intArr3:		.space 50
			
einPrompt:		.asciiz "\nEnter integer #"
colSpace:		.asciiz ": "
eaPrompt:		.asciiz "Enter more ints? (n or N = no, others = yes)"
maxPrompt:		.asciiz "Max of 12 ints entered.."
newLine:		.asciiz "\n"
begPrompt:		.asciiz "beginning a1: "
pro1Prompt:		.asciiz "processed a1: "
pro2Prompt:		.asciiz "	   a2: "
pro3Prompt:		.asciiz "	   a3: "
repPrompt:		.asciiz "Do another case? (n or N = no, others = yes) "
equalsPrint:		.asciiz "================================"
exitPrint:		.asciiz "bye…"

			.text
			.globl main
main:
########################################
# Register Usage
########################################
# $t0: used1
# $t1: used2
# $t2: used3
# $t3: remCount
# $t4: anchor
# $t5: hopPtr1
# $t6: hopPtr11
# $t7: hopPtr2
# $t8: endPtr1
# $t9: endPtr2
# $t4: oneInt
# $t5: short-lived temporary
# $v1: reply
# $a2: minInt
# $a3: maxInt

########################################
