/*
 */
	.file	"test.S"
	.code16

.section	.data
data:
	.word	0x0000

.section	.text
.type	_start, @function
.globl 	_start
_start:
	nop

	movw $s, %ax 
	movw $s, data
	
	// 00000101  B81601            mov ax,0x116
	// 00000104  FFE0              jmp ax
//	ljmp *%ax	/* 不支持，ljmp后续只能是两个立即数，或者内存地址 */
	jmp *%ax	/* 16位实模式间接绝对近转移 寄存器 */
	jmp *data	/* jmp %ds:*data 16位实模式间接绝对近转移 内存地址 */
	jmp data	/* 16位实模式相对近转移 0xE9 */
/*
00000100  90                nop
00000101  B81311            mov ax,0x1113
00000104  C70620111311      mov word [0x1120],0x1113
0000010A  FFE0              jmp ax
0000010C  FF262011          jmp word [0x1120]
00000110  E90D10            jmp word 0x1120
*/

	.space 0x1000, 0x90
s:
	incw %ax
	
	/* return to DOS */
	movw $0x4c00, %ax
	int $0x21

