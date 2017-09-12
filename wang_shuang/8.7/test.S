/**/
	.file	"test.S"
	.code16

	.text
.globl	_start
.type	_start, @function
_start:

	/* 利用出发计算100001/100 
     * 100001 > 65536 -> 186A1
     */
	movw $0x0001, %dx
	movw $0x86a1, %ax
	movw $100, %bx
	div %bx

	/* 利用除法指令计算 1001/100 */
	/* 1001 < 65536 -> 03e9h */
	movw $0x03e9, %ax
	movb $100, %bl
	div %bl

	/* return to DOS */
	movw $0x4c00, %ax
	int $0x21

