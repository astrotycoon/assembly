/*
 * 利用栈，将.data中的数据逆序存放
 */
	.file	"test.S"
	.code16

.extern array_num
.extern __bstack
.extern __estack
.extern stack_size

.section 	.data
.type	data, @object
.align 	16
data_begin:
	.short 0x0123, 0x0456, 0x0789, 0x0abc, 0x0def, 0x0fed, 0x0cba, 0x0987 
data_end:
	.equ	data_size, (data_end - data_begin) / 2

.section 	.bss
	.type	stack, @object
	.lcomm	stack, 0x100

.section 	.text
.globl _start
.type _start, @function
_start:
	nop

	cli
.if 0
	movw $__estack, %sp
.else
//	movw $stack, %ax
	movw $__bstack, %ax
	addw $stack_size, %ax
	movw %ax, %sp
.endif
	sti

	movw $array_num, %cx
//	movw $data_size, %cx

	movw $0, %bx

.save_to_stack:
	pushw data_begin(%bx) 
	incw %bx
	incw %bx
	loop .save_to_stack 

	movw $data_size, %cx
	movw $0, %bx

.pop_to_data:
	popw data_begin(%bx) 
	incw %bx
	incw %bx
	loop .pop_to_data

	/* return to DOS */
	movw $0x4c00, %ax
	int $0x21
	
