/*
 * 这是不分段的版本，即只有.text段，.data段杂糅在text段内
 * stack段是随意定的
 */	
	.file "3.1-2.S"
	.code16
	.text
.globl start, _start
start:
_start:
	nop

	xorw %ax, %ax
	xorw %bx, %bx
	xorw %si, %si
	xorw %di, %di
	xorw %cx, %cx

	cli
	movw %cs, %ax
	movw %ax, %ss
	movw $stack, %sp
	sti

	movw $0x2000, %ax
	movw %ax, %es	
	leaw mem1, %bx
	movw $0x00, %si
	movw $0x00, %di
	movw $mem1_len, %cx
	callw write_data	

	movw $0x1000, %ax
	movw %ax, %es	
	leaw mem2, %bx
	movw $0x00, %si
	movw $0x00, %di
	movw $mem2_len, %cx
	callw write_data	

	ljmp $0x2000, $0x0000

	/* return to DOS */
	movw $0x4c00, %ax
	int $0x21

write_data:
	pushw %ax
.move:
	movb (%bx, %si, 1), %al
	movb %al, %es:(%di) 
	incw %si
	incw %di
	loop .move
	popw %ax
	ret

/* 将mem1的数据写入0x2000:0x0000 */
mem1:
	.byte	0xb8, 0x22, 0x66, 0xea, 0x00, 0x01, 0xf0, 0x0f, 0x89, 0xc3
mem1_end:
.equ	mem1_len, (mem1_end - mem1) / 1
/* 将mem2的数据写入0x1000:0x0000 */
mem2:
	.byte	0xb8, 0x00, 0x20, 0x8e, 0xd8, 0xa1, 0x08, 0x00, 0xa1, 0x02, 0x00
mem2_end:
.equ 	mem2_len, (mem2_end - mem2) / 1
	
	.org 0x100, 0x90
stack:	/* This is the bottom of stack */
