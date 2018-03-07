/**/
.include "common.S"
/*
 * gcc -m32 -c -o test.o test.S
 * 可以使用#include ""
 */
//#include "common.S"

	.file	"test.S"
	.code16

.extern __text_end

.section	.data
offset:
	.word	0x0000
section:
	.word	0x0000

.section	.text
.type	_start, @function
.globl	_start
_start:
	nop

	/* jmp word ptr 内存单元地址(段内偏移地址) */
	/* 跳转到标号s处执行 */
	movw $s, offset
	// 00000107  FF265003          jmp word [0x350]
	jmp *offset 

	.space 0x100, 0x90
s:
	xorw %ax, %ax
	addw $1, %ax
	incw %ax


	/* 把从标号s0到程序结束的代码拷贝到0:200处，然后跳转到那里执行 */
	movw $0x0000, %ax
	movw %ax, %es
	movw $__text_end, %cx 
	subw $s, %cx
	xorw %bx, %bx

.move:
	movb s0(%bx), %al
	movb %al, %es:512(%bx)	/* 0x200 --> 512 */
	incw %bx
	loop .move

	movw $0x200, offset
	movw $0x0000, section 

	/* jmp dword ptr 内存单元地址（段间转移） */
	// 00000237  FF2E5003          jmp word far [0x350]
	ljmp *offset

	.space 0x100, 0x90
	
s0:
	xorw %bx, %bx
	addw $1, %bx
	incw %bx

	/* return to DOS */
	RETURN_TO_DOS

