/*
 * 王爽《汇编语言》，问题8.1
 * 用div指令计算data段中第一个数据除以第一个数据后的结果，商存在第三个数据的存储单元中。
 */
	.file	"test.S"
	.code16

.extern __data_begin

.section	.data
dividend:
	.long	0x000186a1
divisor:
	.word	100
quotient:
	.word	0
remainder:
	.word	0

.section	.text
.globl	_start
.type	_start, @function
_start:
	nop

.if 0
	movw $__data_begin, %bx 
	movw (%bx), %ax
	addw $2, %bx
	movw (%bx), %dx

.if 0
	addw $2, %bx
	movw (%bx), %si  
	div %si
.else
	addw $2, %bx
	divw (%bx)	
.endif

	addw $2, %bx
	movw %ax, (%bx)

	addw $2, %bx
	movw %dx, (%bx)
.else
	movw $dividend, %bx
	movw (%bx), %ax
	addw $2, %bx
	movw (%bx), %dx

.if 0
	movw divisor, %bx
	div %bx 
.else
	divw divisor
.endif

	movw %ax, (quotient)
	movw %dx, (remainder)
.endif	

	/* return to DOS */
	movw $0x4c00, %ax
	int $0x21

