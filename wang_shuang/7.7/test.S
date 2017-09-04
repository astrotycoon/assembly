/*
 * 用si和di实现将字符串"welcome to gas!!" 复制到它后面的数据区
 */
	.file	"test.S"
	.code16

.section	.data
str:
	.ascii	"welcome to gas!!"
	.equ	str_len, . - str
.if 0
buffer:
	.ascii "................"
.else
.section 	.bss
	.type	buffer, @object
	.lcomm	buffer, str_len 
.endif

.section	.text
.type	_start, @function
.globl	_start
_start:
	nop
	
	movw $str_len, %cx
	movw $0, %bx

.copy:
	movb str(%bx), %al
	movb %al, buffer(%bx)	
	incw %bx
	loop .copy

	/* return to DOS */
	movw $0x4c00, %ax
	int $0x21
	
