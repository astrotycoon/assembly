/**/
	.file	"test.S"
	.code16

	.text
.type	_start, @function
.globl	_start
_start:
	movw $0, %ax
	jmp s
	addw $1, %ax
s:
	incw %ax

	/* return to DOS */
	movw $0x4c00, %ax
	int $0x21
