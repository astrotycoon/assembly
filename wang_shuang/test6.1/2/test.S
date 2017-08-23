/*
 * 程序实现依次用内存0:0 ~ 0:15单元中的内容改写.data中的数据, 数据的传送用栈来进行
 */
	.file	"test.S"
	.code16

.section 	.data
.align	16
data:
	.word 0x0123, 0x0456, 0x0789, 0x0abc, 0x0def, 0x0fed, 0x0cba, 0x0987 
data_end:
	.equ	data_len, (data_end - data) / 2

.section 	.text
.type _start, @function
.globl _start
_start:
	nop

	movw $0, %ax
	movw %ax, %ds	

	movw $0, %bx	/* %ds:0 -> 0:0 */
	movw $data_len, %cx

.write:
//	movw %ds:(%bx), %ax
//	movw %ax, data(%bx)
	pushw %ds:(%bx)
	popw data(%bx)
	incw %bx
	incw %bx
	loop .write
	
	/* return to DOS */
	movw $0x4c00, %ax
	int $0x21
	
