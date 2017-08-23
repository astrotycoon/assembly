/*
 * 计算ffff:0 ~ ffff:b单元中的数据的和，结果存储在dx中。
 */
	.file	"test.S"
	.code16
	.text
.globl _start
_start:
	nop

	movw $0xffff, %ax
	movw %ax, %ds

	movw $12, %cx
	movw $0, %bx
	movw $0, %dx

.signed_add:
	movb (%bx), %al
//	cbw 	/* cbw 是将%al中的数当做有符号数 */
	movsbw %al, %ax
	addw %ax, %dx	/* %dx = %dx + %ax */
	incw %bx
	loop .signed_add 

	movw $12, %cx
	movw $0, %bx
	movw $0, %dx
.unsigned_add:
	movb %ds:(%bx), %al
	movzbw %al, %ax
	addw %ax, %dx
	incw %bx
	loop .unsigned_add

	movw $0x4c00, %ax
	int $0x21

