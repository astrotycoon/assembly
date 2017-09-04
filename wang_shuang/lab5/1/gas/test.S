/*
 *	王爽《汇编语言》（第三版）实验5 （1）
 */
	.file	"test.S"
	.code16

.extern __estack

.section 	.data
.align	16
.type	short_array, @object
short_array:
	.word	0x0123, 0x0456, 0x0789, 0x0abc, 0x0def, 0x0fed, 0x0cba, 0x0987

.section	.bss
	.type	stack, @object
	.lcomm	stack, 256

.section	.text
.globl	_start
_start:
	nop

	sti
	movw $__estack, %ax
	movw %ax, %sp	
	cli

	pushw (short_array + 0)
	pushw (short_array + 2)
	popw (short_array + 2)
	popw (short_array + 0)

	/* return to DOS */
	movw $0x4c00, %ax
	int $0x21

