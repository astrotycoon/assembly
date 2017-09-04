/*
 *	王爽《汇编语言》（第三版）实验5 （1）
 *	gas默认不会像masm那样使每个段16字节对齐，而完全由我们在程序中和链接脚本中去控制
 */
	.file	"test.S"
	.code16

.extern __estack

.section 	.data
.type	short_array, @object
short_array:
	.word	0x0123, 0x0456

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

