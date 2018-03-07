/**/
	.file	"test.S"
	.code16

	.text
.type	_start, @function
.globl	_start
_start:
	movw $0, %ax
	jmp s	/* 8位转移 段内短转移 */
	addw $1, %ax
s:
	incw %ax

	jmp s0	/* 16位转移 段内近转移 */

	/* skip和space都可以 */
//	.skip 0x1000, 0x90 
	.space 0x1000, 0x90
s0:
	incw %ax

	/* return to DOS */
	movw $0x4c00, %ax
	int $0x21

// 00000100  B80000            mov ax,0x0
// 00000103  EB03              jmp short 0x108
// 00000105  83C001            add ax,byte +0x1
// 00000108  40                inc ax
// 00000109  E90010            jmp word 0x110c


