/*
 * 王爽《汇编语言》第三版，检测点9.3
 */
	.file	"test.S"
	.code16

#include "common.S"

	.text
.type	_start, STT_FUNC
.globl	_start
_start:
	nop

	movw $0x2000, %ax
	movw %ax, %ds
	xorw %bx, %bx

s:
	movb %ds:(%bx), %cl
	movb $0x00, %ch
	incw %cx
	incw %bx
	loop s

ok:
	decw %bx
	movw %bx, %dx

	/* return to DOS */
	RETURN_TO_DOS
