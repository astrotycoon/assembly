/*
 * 多段版本
 */	
	.file "3.1-2.S"
	.code16

.extern __text_begin
.extern __text_end
.extern __data_begin
.extern __data_end
.extern __stack

.section .data
/* 将mem1的数据写入0x2000:0x0000 */
	.align	16	
.type	mem1, @object
mem1:
	.byte	0xb8, 0x22, 0x66, 0xea, 0x00, 0x01, 0xf0, 0x0f, 0x89, 0xc3
.equ	mem1_len, (. - mem1) / 1
.equ	mem1_offset, mem1 - mem1 
/* 将mem2的数据写入0x1000:0x0000 */
	.align	16	
.type 	mem2, @object
mem2:
	.byte	0xb8, 0x00, 0x20, 0x8e, 0xd8, 0xa1, 0x08, 0x00, 0xa1, 0x02, 0x00
.equ 	mem2_len, (. - mem2) / 1
.equ	mem2_offset, mem2 - mem1
.equ	data_section_len, (. - mem1) / 1

/*
.section .bss
	.type stack, @object
	.lcomm 	stack, 160 */

.section .text
.globl _start
.type _start, @function
_start:
	nop

	/* %cs */
//	movw $__text_begin, %ax
//	movw %ax, %cs

	/* %ds */
//	movw $__data_begin, %ax
//	movw %ax, %ds

	/* %ss */
	cli
//	movw $__stack_begin, %ax
//	movw %ax, %ss
	movw $__stack, %sp
	sti

	xorw %ax, %ax
	xorw %bx, %bx
	xorw %si, %si
	xorw %di, %di
	xorw %cx, %cx

	movw $0x2000, %ax
	movw %ax, %es	
	movw $0, %bx
	movw $mem1_len, %cx
s:
	movb mem1(%bx), %al
	movb %al, %es:(%bx)
	incw %bx
	loop s

	movw $0x1000, %ax
	movw %ax, %es	
	movw $0, %bx
	movw $mem2_len, %cx
s1:
	movb mem2(%bx), %al
	movb %al, %es:(%bx)
	incw %bx
	loop s1
	
/*	movw $mem1_offset, %bx
	movw $mem1_len, %cx
	callw write_data	

	movw $0x1000, %ax
	movw %ax, %es	
	movw $mem2_offset, %bx
	movw $mem2_len, %cx
	callw write_data	*/

	ljmp $0x2000, $0x0000

	/* return to DOS */
	movw $0x4c00, %ax
	int $0x21
/*
write_data:
	pushw %ax
.move:
	movb (%bx), %al
	movb %al, %es:(%bx) 
	incw %bx
	loop .move
	popw %ax
	ret */

//	.org 0x1fe - data_section_len, 0x88
//	.offset 0x1fe + 0x7c00	/* 使用.offset只能硬编码， no */
//stack:	/* This is the bottom of stack */
//	.word 0xaa55
