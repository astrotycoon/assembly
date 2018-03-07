/*
 * 王爽《汇编语言》第三版，检测点9.1
 */
	.file	"test.S"
	.code16

#include "common.S"

.section	.data
	.byte	0x00
offset:
	.word	0x0100	/* 我们这里生成的是com文件，所以首地址是0x0100 */

.section	.text
.type	_start, STT_FUNC
.globl	_start
_start:
	nop
	
	movw $_start, offset
	jmp *offset

/*
00000101  C70611010001      mov word [0x111],0x100
00000107  FF261101          jmp word [0x111] 16位实模式间接绝对近转移
*/

	/* return to DOS */
	RETURN_TO_DOS
	

