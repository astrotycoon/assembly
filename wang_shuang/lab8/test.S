/*
 * 王爽《汇编语言》第三版，实验8
 */
	.file	"test.S"
	.code16

#include "common.S"

	.text
.type	_start, @function
.globl	_start
	

_start:
	jmp s

	RETURN_TO_DOS
	movw $0x00, %ax
s:
	nop
	nop

	movw s2, %ax 
	movw %ax, s

s0:
	jmp s

s1:
	movw $0x00, %ax
	int $0x21
	movw $0x00, %ax

s2:
	jmp s1
	nop	

	/* return to DOS */
	RETURN_TO_DOS
/*
	movw s2, %ax
	movw %ax, s
	这两句将s出的两个nop覆盖成EBF6, 注意F6是偏移，表示往回调转10个字节
 */

	
