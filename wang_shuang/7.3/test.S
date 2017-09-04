/*
 * 王爽《汇编语言》第三版 
 */
	.file	"test.S"
	.code16

.section 	.data
	.ascii	"unIX", "foRK"
.section 	.text
.type	_start, @function
.globl	_start
_start:
	nop

	movb $'a', %al
	movb $'b', %bl

	/* return to DOS */
	movw $0x4c00, %ax
	int $0x21

