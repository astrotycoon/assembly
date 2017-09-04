/*
 * 问题7.9: 编程，将datasg段中每个单词的前4个字母改为大写字母。
 */
	.file	"test.S"
	.code16

.extern __char_array_element_nums
.extern	__end_stack

.align	16
.section	.data
.type	char_array, @object
char_array:
	.ascii	"1. display      "
	.ascii	"2. brows        "
	.ascii	"3. replace      "
	.ascii	"4. modify       "

.align	16
.section	.dss
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

	movw $4, %cx
	movw $0, %si

.inter_foreach:
	movb 3(%bx, %si, 1), %al
	andb $0xdf, %al
	movb %al, 3(%bx, %si, 1)
	incw %si
	loop .inter_foreach

	popw %cx
	addw $16, %bx
	loop .outer_foreach
	
	/* return to DOS */
	movw $0x4c00, %ax
	int $0x21

