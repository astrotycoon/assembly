#divtest.s - An example of the DIV instruction
.section	.data
dividend:	#被除数
	.quad	8335
divisor:	#除数
	.int	25
quotient:	#商
	.int	0
remainder:	#余数
	.int	0
output:
	.asciz	"The quotient is %d, and the remainder is %d\n"

.section	.text
.globl	_start
_start:
	movl dividend, %eax
	movl dividend+4, %edx
	divl divisor
	movl %eax, quotient
	movl %edx, remainder
	pushl remainder
	pushl quotient
	pushl $output
	call printf
	addl $12, %esp
	pushl $0
	call exit
