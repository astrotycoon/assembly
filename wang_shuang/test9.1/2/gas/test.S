/* 
 * 王爽《汇编语言》第三版，检测9.1 - 2 
 */
	.file	"test.S"
	.code16

#include "common.S"

.section	.data, "aw"	
.type	buffer, STT_OBJECT
buffer:
	.long	0x12345678
/*
 *	+---------------+ low
 *	|   offset      |
 *	+---------------+
 *	|   section     |
 *	+---------------+ high
 */

.section	.text, "ax"
.type	_start, STT_FUNC 
.globl	_start
_start:
	nop

	movw $0x0100, buffer
	movw %cs, buffer+2

	ljmp *buffer

/*
00000101  C70620010001      mov word [0x120],0x100
00000107  8C0E2201          mov [0x122],cs
0000010B  FF2E2001          jmp word far [0x120] 16位实模式间接绝对远转移
*/

	/* return to DOS */
	RETURN_TO_DOS

