###############################################################################
# Title: Assign02P3                   Author: James Sipowicz
# Class: CS 2318-251, Spring 2019     Submitted: <4/08/19>
###############################################################################
# Program: MIPS tranlation of a given C++ program
###############################################################################
# Pseudocode description: supplied a2p2_SampSoln.cpp
###############################################################################
#include <iostream>
#using namespace std;
#int  a1[12],
#     a2[12],
#     a3[12];
#char reply;
#int  used1,
#     used2,
#     used3,
#     remCount,
#     anchor;
#int* hopPtr1;
#int* hopPtr11;
#int* hopPtr2;
#int* hopPtr22;
#int* hopPtr222;
#int* hopPtr3;
#int* endPtr1;
#int* endPtr2;
#int* endPtr3;
#char begA1Str[] = "\nbeginning a1: ";
#char proA1Str[] = "processed a1: ";
#char comA2Str[] = "          a2: ";
#char comA3Str[] = "          a3: ";
#char einStr[]   = "Enter integer #";
#char moStr[]    = "Max of ";
#char ieStr[]    = " ints entered...";
#char emiStr[]   = "Enter more ints? (n or N = no, others = yes) ";
#char dacStr[]   = "Do another case? (n or N = no, others = yes) ";
#char dlStr[]    = "================================";
#char byeStr[]   = "bye...";
			.data
array1:			.space 50
array2:			.space 50
array3:			.space 50
begA1Str:		.asciiz "\nbeginning a1: "
proA1Str:		.asciiz "processed a1: "
comA2Str:		.asciiz "          a2: "
comA3Str:		.asciiz "          a3: "
einStr:			.asciiz "Enter integer #"
moStr:			.asciiz "Max of "
ieStr:			.asciiz " ints entered..."
emiStr:			.asciiz "Enter more ints? (n or N = no, others = yes) "
dacStr:			.asciiz "Do another case? (n or N = no, others = yes) "
dlStr:			.asciiz "================================"
byeStr:			.asciiz "bye..."
colSpace:		.asciiz ": "
newLine:		.asciiz "\n"
#int main(){
			.text
			.globl main
main:
################################################ 
# Register usage: 
################# 
# $a1: endPtr1 
# $a2: endPtr2 
# $a3: endPtr3 
# $t0: temp holder 
# $t1: used1 
# $t2: used2 
# $t3: used3 
# $t4: hopPtr1 
# $t5: hopPtr2 or remCount (non-overlappingly) 
# $t6: hopPtr11 or hopPtr22 (non-overlappingly) 
# $t7: hopPtr3 or hopPtr222 (non-overlappingly) 
# $t8: reply or anchor (non-overlappingly) 
# $t9: temp holder 
# $v1: temp holder  
################################################
#//        //do
begDW1:
#               used1 = 0;
		li $t1, 0
#               hopPtr1 = a1;
		la $t4, array1 
#            //do
begDW2:
#               cout << einStr;
		li $v0, 4
		la $a0, einStr
		syscall
#               cout << (used1 + 1);
		li $v0, 1
		addi $a0, $t0, 1
		syscall
#               cout << ':' << ' ';
		li $v0, 4
		la $a0, colSpace
		syscall
#               cin >> *hopPtr1;
		li $v0, 5
		syscall
		move $t4, $v0
#		++used1;
		addi $t1, $t1, 1
#		++hopPtr1;
		addi $t4, $t4, 1		
#               //if (used1 == 12)
#               if (used1 != 12) goto else1;
		li $t0, 12
		bne $t1, $t0, else1	
begI1:
#               cout << moStr;
		li $v0, 4
		la $a0, moStr
		syscall
#               cout << 12;
		li $v0, 1
		li $a0, 12
		syscall		 
#               cout << ieStr;
		li $v0, 4
		la $a0, einStr
		syscall
#               cout << endl;
		li $v0, 4
		la $a0, newLine
		syscall
#               reply = 'n';
		li $t8, 'n'
#               goto endI1;
		j endI1
else1:
#             //else
#		cout << emiStr;
		li $v0, 4
		la $a0, emiStr
		syscall
#              	cin >> reply;
		li $v0, 12
		syscall
		move $t8, $v0
endI1:	
DWTest2:
#             //while (reply != 'n' && reply != 'N');
#             //if (reply != 'n' && reply != 'N')goto begDW2;
#               if (reply == 'n') goto xitDW2;
                li $t5, 'n'
                beq $v1, $t5, xitDW2
#               if (reply != 'N')goto begDW2;
		li $t5, 'N'
		beq $v1, $t5, begDW2
xitDW2:
#               cout << begA1Str;
		li $v0, 4
		la $a0, begA1Str
		syscall
#               hopPtr1 = a1;
		la $t4, array1
#               endPtr1 = a1 + used1;
		la $t9, array1
		sll $a1, $t1, 2
		add $a1, $a1, $t9 
#//             while (hopPtr1 < endPtr1)
#               goto WTest1;
		j WTest1
begW1:
#             //if (hopPtr1 == endPtr1 - 1)
#               if (hopPtr1 != endPtr1 - 1) goto else2;
		addi $t9, $a2, -4
		bne $t4, $t9, else2
begI2:
#               cout << *hopPtr1 << endl;
		li $v0, 1
		lw $a0, 0($t4)
		syscall
		li $v0, 4
		la $a0, newLine
		syscall
#               goto endI2;
		j endI2
else2:
#//           	else
#               cout << *hopPtr1 << ' ';
		li $v0, 1
		lw $a0, 0($t4)
		syscall
		li $v0, 4
		la $a0, colSpace
		syscall
		
endI2:
#               ++hopPtr1;
                addi $t5, $t5, 4
WTest1:
#               if (hopPtr1 < endPtr1) goto begW1;
		ble $t5, $a2, begF6
#//             for (hopPtr1 = a1, hopPtr2 = a2, used2 = 0; // multiple initializations
#//             hopPtr1 < endPtr1;                     // loop test
#//             	++hopPtr1, ++hopPtr2, ++used2)         // multiple updates
#               hopPtr1 = a1;
                la $t4, array1
#               hopPtr2 = a2;
		la $t5, array2
#               used2 = 0; // multiple initializations
		li $t2, 0
#               goto FTest1;
		j FTest1
begF1:
#               *hopPtr2 = *hopPtr1;
                lw $t0, 0($t5)
                sw $t0, 0($t4) 
#               ++hopPtr1
                addi $t4, $t4, 4
#               ++hopPtr2;
		addi $t5, $t5, 4
#               ++used2;         // multiple updates
		addi $t1, $t1, 4
FTest1:
#               if (hopPtr1 < endPtr1) goto begF1;                     // loop test
		ble $t4, $a2, begF6
#               hopPtr2 = a2;
                la $t5, array2
#               endPtr2 = a2 + used2;
		la $a2, array2
		sll $t9, $t2, 2
		add $a2, $a2, $t9
#             //while (hopPtr2 < endPtr2)
#               goto WTest2;
		j WTest2
begW2:
#               anchor = *hopPtr2;
		lw $t8, 0($t5) 
#             //for (hopPtr22 = hopPtr2 + 1; hopPtr22 < endPtr2; ++hopPtr22)
#               hopPtr22 = hopPtr2 + 1;
		addi $t6, $t5, 4
#               goto FTest2;
                j FTest2
begF2:
#             //if (*hopPtr22 == anchor)
#               if (*hopPtr22 != anchor) goto endI3;
		lw $t9, 0($t6)
		bne $t9, $t8, endI3
befI3:
#             //for (hopPtr222 = hopPtr22 + 1; hopPtr222 < endPtr2; ++hopPtr222)
#               hopPtr222 = hopPtr22 + 1
                addi $t7, $t6, 4
#               goto FTest3;
                j FTest3
begF3:
#               *(hopPtr222 - 1) = *hopPtr222;
		lw $t0, 0($t7)
		sw $t0, -4($t7)
#               ++hopPtr222;
                addi $t7, $t7, 4
FTest3:
#               if (hopPtr222 < endPtr2) goto begF3;
		blt $t7, $a2, begF3              
#               --used2;
		addi $t2, $t2, -4
#               --endPtr2;
		addi $a2, $a2, -4
#               --hopPtr22;
		addi $t6, $t6, -4
endI3:
#               ++hopPtr22;
                addi $t6, $t6, 4
FTest2:
#               if (hopPtr22 < endPtr2) goto begF2;
		blt $t6, $a2, begF2 
#               ++hopPtr2;
		addi $t5, $t5, 4
WTest2:
#               if (hopPtr2 < endPtr2) goto begW2;
		blt $t5, $a2, begW2
#               used3 = 0;
		li $t3, 0
#               hopPtr3 = a3;
		la $t7, array3
#               hopPtr1 = a1;
                la $t4, array1
#             //while (hopPtr1 < endPtr1)
#               goto WTest3;
		j WTest3
begW3:
#               *hopPtr3 = *hopPtr1;
		lw $t9, 0($t7)
		sw $t9, 0($t4)
#               ++used3;
		addi $t2, $t2, 4
#               ++hopPtr3;
		addi $t7, $t7, 4
#               anchor = *hopPtr1;
		lw $t8, 0($t4)
#               remCount = 0;
		li $t5, 0
#             //for (hopPtr11 = hopPtr1 + 1; hopPtr11 < endPtr1; ++hopPtr11)
#               hopPtr11 = hopPtr1 + 1;
                addi $t6, $t4, 4
#               goto FTest4;
                j FTest4
begF4:
#//             if (*hopPtr11 == anchor)
#               if (*hopPtr11 != anchor) goto else4;
		lw $t0, 0($t6)
		bne $t0, $t8, else4
begI4:
#               ++remCount;
		addi $t5, $t5, 4
#               goto endI4;
		j endI4
else4:
#//             else
#               *(hopPtr11 - remCount) = *hopPtr11;
		sll $t9, $t5, 2
		sub $v1, $t6, $t9
		lw $t0, 0($v1)
		sw $t0, 0($t6)
endI4:
#               ++hopPtr11;
                addi $t6, $t6, 4
FTest4:
#               if (hopPtr11 < endPtr1) goto begF4;
		blt $t6, $a1, begF4
#               used1 -= remCount;
		sub $t1, $t1, $t5
#               endPtr1 -= remCount;
		sub $a1, $a1, $t5
#               ++hopPtr1;
		addi $t4, $t4, 4
WTest3:
#               if (hopPtr1 < endPtr1) goto begW3;
		blt $t4, $a1, begW3
#               cout << proA1Str;
		li $v0, 4
		la $a0, proA1Str
		syscall
#             //for (hopPtr1 = a1; hopPtr1 < endPtr1; ++hopPtr1)
#               hopPtr1 = a1;
                la $t4, array1
#               goto FTest5;
		j FTest5
begF5:
#             //if (hopPtr1 == endPtr1 - 1)
#               if (hopPtr1 != endPtr1 - 1) goto else5;
		addi $t9, $a1, -4
		bne $t4, $t9, else5
begI5:
#               cout << *hopPtr1 << endl;
		li $v0, 1
		lw $a0, 0($t4)
		syscall
		li $v0, 4
		la $a0, newLine
		syscall
#               goto endI5;
		j endI5
else5:
#             //else
#               cout << *hopPtr1 << ' ';
		li $v0, 1
		lw $a0, 0($t4)
		syscall
		li $v0, 4
		la $a0, colSpace
		syscall
endI5:
#               ++hopPtr1;
                addi $t4, $t4, 4
FTest5:
#               if (hopPtr1 < endPtr1) goto begF5;
		blt $t4, $a1, begF5 
#               cout << comA2Str;
		li $v0, 4
		la $a0, comA2Str
		syscall
#             //for (hopPtr2 = a2; hopPtr2 < endPtr2; ++hopPtr2)
#               hopPtr2 = a2;
		la $t5, array2
#               goto FTest6;
		j FTest6
begF6:
#             //if (hopPtr2 == endPtr2 - 1)
#               if (hopPtr2 != endPtr2 - 1) goto else6;
		addi $t9, $a2, -4
		bne $t5, $t9, else6
		
begI6:
#             	cout << *hopPtr2 << endl;
		li $v0, 1
		lw $a0, 0($t5)
		syscall
		li $v0, 4
		la $a0, newLine
		syscall
#               goto endI6;
		j endI6
else6:
#             //else
#               cout << *hopPtr2 << ' ';
		li $v0, 1
		lw $a0, 0($t5)
		syscall
		li $v0, 4
		la $a0, colSpace
		syscall
endI6:
#               ++hopPtr2;
		addi $t5, $t5, 4
FTest6:
#               if (hopPtr2 < endPtr2) goto begF6;
		ble $t5, $a2, begF6
#               cout << comA3Str;
		li $v0, 4
		la $a0, comA3Str
		syscall
#               hopPtr3 = a3;
                la $t7, array3
#               endPtr3 = a3 + used3;
		la $t9, array3
		sll $a3, $t3, 2
		add $a3, $a3, $t9 
#             //while (hopPtr3 < endPtr3)
#               goto WTest4;
                j WTest4
begW4:
#             //if (hopPtr3 == endPtr3 - 1)
#             	if (hopPtr3 != endPtr3 - 1) goto else7;
		addi $t9, $a3, -4
		bne $t7, $t9, else7	
begI7:
#              	cout << *hopPtr3 << endl;
		li $v0, 1
		lw $a0, 0($t7)
		syscall
		li $v0, 4
		la $a0, newLine
		syscall
		
#             	goto endI7;
		j endI7
else7:
#		cout << *hopPtr3 << ' ';
		li $v0, 1
		lw $a0, 0($t7)
		syscall
		li $v0, 4
		la $a0, colSpace
		syscall
		
endI7:
#               ++hopPtr3;
		addi $t7, $t7, 4
WTest4:
#               if (hopPtr3 < endPtr3) goto begW4;
		blt $t7, $a3, begW4
#               cout << endl;
		li $v0, 4
		la $a0, newLine
		syscall
#               cout << dacStr;
		li $v0, 4
		la $a0, dacStr
		syscall
#               cin >> reply;
		li $v0, 12
		syscall
		move $t8, $v0
#               cout << endl;
		li $v0, 4
		la $a0, newLine
		syscall
DWTest1:
#             //while (reply != 'n' && reply != 'N');
#             //if (reply != 'n' && reply != 'N') goto begDW1;
#             	if (reply == 'n') goto xitDW1;
		li $t5, 'n'
		beq $v1, $t5, xitDW1
#             	if (reply != 'N') goto begDW1;
		li $t5, 'N'
		bne $v1, $t5, begDW1
xitDW1:
#		cout << dlStr;
		li $v0, 4
		la $a0, dlStr
		syscall
#		cout << '\n';
		li $v0, 4
		la $a0, newLine
		syscall
#		cout << byeStr;
		li $v0, 4
		la $a0, byeStr
		syscall
#		cout << '\n';
		li $v0, 4
		la $a0, newLine
		syscall
#		cout << dlStr;
		li $v0, 4
		la $a0, dlStr
		syscall
#		cout << '\n';
		li $v0, 4
		la $a0, newLine
		syscall
#             	return 0;
		li $v0, 10
		syscall