/*
 * 将内存ffff:0 ~ ffff:b单元中的数据复制到0:200~0:20b单元中
 */
	.file	"test.S"
	.code16
	.text
.globl _start
_start:
	nop

	movw $0xffff, %ax
	movw %ax, %ds
	
	movw $0x0020, %ax
	movw %ax, %es	

	movw $0, %bx
	movw $12, %cx

.mov:
	movb %ds:(%bx), %al
	movb %al, %es:(%bx)
	incw %bx
	loop .mov

	/* return to DOS */
	movw $0x4c00, %ax
	int $0x21
