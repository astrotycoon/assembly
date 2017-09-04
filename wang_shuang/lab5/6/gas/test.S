/*
 * 王爽《汇编语言》第三版实验5 （6）
 * 编写code段中的代码，用push指令将a段中的前8个字型数据，逆序存储到b段中。
 */
	.file	"test.S"
	.code16

.extern __estack

.section	.data
.align	16
.type short_array,	@object
short_array:
	.short	0x0001, 0x0002, 0x0003, 0x0004, 0x0005, 0x0006, 0x0007, 0x0008
	.short 	0x0009, 0x000a, 0x000b, 0x000c, 0x000d, 0x000e, 0x000f, 0x00ff

.section	.bss
	.type	buffer, @object
	.lcomm	buffer, 16	/* this is the bottom of stack */	

.section	.text
.type 	_start, @function
.globl	_start
_start:
	nop

	sti
	movw $__estack, %sp
	cli	

	movw $8, %cx
	movw $0, %bx

s:
	pushw short_array(%bx)
	incw %bx
	incw %bx
	loop s

	/* return to DOS */
	movw $0x4c00, %ax
	int $0x21
	
