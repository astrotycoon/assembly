/*
 * 编程，向内存0:200 ~ 0:23F以此传送数据0~63
 */
	.file 	"test.S"
	.code16
	.text
.globl _start
_start:
	movw $0x0020, %ax
	movw %ax, %ds

	movw $0, %bx
	movw $0x0040, %cx

.mov:
	movw %bx, %ds:(%bx)
	incw %bx
	loop .mov

	/* return to DOS */
	movw $0x4c00, %ax
	int $0x21 


