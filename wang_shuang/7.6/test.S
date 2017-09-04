/*
 * 将str1转换为大写  -- 大写字母第6位是0
 * 将str2转换为小写  -- 小写字母第6位是1
 */
	.file 	"test.S"
	.code16

.section 	.data
str1:
	.ascii	"BaSiC"
	.equ	str1_len, (. - str1)
str2:
	.ascii	"MinIX"
	.equ	str2_len, (. - str2)
// str1_len == str2_len

.section	.text
.type	_start, @function
.globl	_start
_start:
	nop

	movw $str1_len, %cx
	movw $0, %bx
change:
	movb str1(%bx), %al
	andb $0xdf, %al	/* 设置第6位为0 */
	movb %al, str1(%bx)
	movb str2(%bx), %al
	orb $0x20, %al
	movb %al, str2(%bx)
	incw %bx
	loop change 

	/* return to DOS */
	movw $0x4c00, %ax
	int $0x21

