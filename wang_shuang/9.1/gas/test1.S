/*
 * 王爽《汇编语言》第三版，问题9.1
 */
	.file "test1.S"
	.code16

	.text
.globl	_start
_start:
	movw %bx, %ax
	movw $_start, %si
	movw $s, %di
	movw (%si), %ax
	movw %ax, (%di)
s:
	nop
	nop

	/* return to DOS */
	movw $0x4c00, %ax
	int $0x21
