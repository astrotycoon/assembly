/*
 * 问题7.7: 编程，将datasg段中的每个单词改为大写字母。 
 */
	.file	"test.S"
	.code16

.extern __char_array_element_nums
.extern	__end_stack

.align 	16
.section	.data
.type 	char_array, @object
char_array:	/* char a[4][16] */
	.ascii	"ibm             "
	.ascii	"dec             "
	.ascii 	"dos             "
	.ascii 	"vax             "

.section	.bss
	.type	stack, @object
	.lcomm	stack, 256

.section	.text
.type	_start, @function
.globl	_start
_start:
	nop

	sti
	movw $__end_stack, %sp
	cli

	movw $__char_array_element_nums, %cx
	movw $char_array, %bx

.outer_foreach:
	pushw %cx

	movw $3, %cx
	movw $0, %si

.inter_foreach:
	movb (%bx, %si, 1), %al	
	andb $0xdf, %al
	movb %al, (%bx, %si, 1)
	incw %si
	loop .inter_foreach

	popw %cx
	addw $16, %bx
	loop .outer_foreach

	/* return to DOS */
	movw $0x4c00, %ax
	int $0x21

