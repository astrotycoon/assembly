/*
 * 王爽《汇编语言》第三版，检测点9.2
 */
	.file	"test.S"
	.code16

#include "common.S"

	.text
.type	_start, STT_FUNC
.globl 	_start
_start:
	nop

	movw $0x2000, %ax
	movw %ax, %ds
	xorw %bx, %bx

s:
	movb (%bx), %cl
	movb $0x00, %ch
	jcxz ok
	incw %bx
	jmp s
/*
0000010C  E303              jcxz 0x111

0000010F  EBF7              jmp short 0x108
*/

ok:
	movw %bx, %dx

	/* return to DOS */
	RETURN_TO_DOS
	

