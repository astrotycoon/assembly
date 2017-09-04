/*
 * 编程，将datasg段中的每个单词的头一个字母改为大写字母。
 */
	.file	"test.S"
	.code16

.align	16
.section	.data
.type	char_array, @object
char_array:	/* char a[6][16] */
	.ascii	"1. file         "
	.ascii	"2. edit         "
	.ascii	"3. search       "
	.ascii	"4. view         "
	.ascii	"5. options      "
	.ascii	"6. help         "

.section	.text
.type	_start, @function
.globl	_start
_start:
	nop

	movw $6, %cx
	movw $char_array, %bx

.change:
	movb 3(%bx), %al
	andb $0xdf, %al
	movb %al, 3(%bx)
	addw $16, %bx	/* %bx++ in C */
	loop .change

	/* return to DOS */
	movw $0x4c00, %ax
	int $0x21

