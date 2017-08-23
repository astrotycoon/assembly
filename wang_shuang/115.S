/*
 * 	《x86汇编语言 - 从实模式到保护模式》
 *
 *	基址寻址中的例子
 */
	.file 	"base_addr.S"
	.code16
	.text
.globl _start
_start:
	nop

	/* set stack */
	movw %cs, %ax
	cli
	movw %ax, %ss
	movw $stack, %sp
	sti

	xorw %bx, %bx
	movw $buffer_len, %cx
s:
	incw buffer(%bx)
	incw %bx
	incw %bx
	loop s

	/* return to DOS */
	movw $0x4c00, %ax
	int $0x21

buffer:
	.short	0x0020, 0x0100, 0x000f, 0x0300, 0xff00
buffer_end:
.equ	buffer_len, (buffer_end - buffer) / 2


	.org	0x100, 0x90
stack:			/* the bottom of stack */
