/*
 * 编写code段中的代码, 将a段和b段中的数字依次相加，将结果存在c段中
 */
	.file	"test.S"
	.code16

.extern	__num 

.section 	.a
.type	addenda, @object
addenda:	/* 被加数 */
	.byte	0x01, 0x02, 0x03, 0x04, 0x05, 0x06, 0x07, 0x08

.section 	.b
.type 	addend, @object
addend:		/* 加数 */
	.byte	0x01, 0x02, 0x03, 0x04, 0x05, 0x06, 0x07, 0x08

.section 	.c
.type	sum, @object
sum:
	.byte	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00

.section 	.text
.type 	_start, @function
.globl	_start
	nop

	movw $__num, %cx 
	movw $0, %bx

s:
	movb addenda(%bx), %al
	addb addend(%bx), %al
	movb %al, sum(%bx)
	incw %bx
	loop s

	/* return to DOS */
	movw $0x4c00, %ax
	int $0x21
