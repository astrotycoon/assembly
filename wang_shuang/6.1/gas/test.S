/*
 * 编程计算8个数据的和，结果存储在ax中。
 */
	.file 	"test.S"
	.code16
	
.section	.data
.type data, @object
.align	16
data:
	.short 0x0123, 0x0456, 0x0789, 0x0abc, 0x0def, 0x0fed, 0x0cba, 0x0987 
data_end:
	.equ	data_len, (data_end - data) / 2

.section 	.text
.globl	_start
.type _start, @function
_start:
	nop
	
	movw $0, %ax
	movw $data_len, %cx
	movw $0, %bx
.add:
	addw data(%bx), %ax	
	incw %bx
	incw %bx
	loop .add

	/* return to DOS */
	movw $0x4c00, %ax
	int $0x21

