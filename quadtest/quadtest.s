#quadtest.s - An example of quad integers
.section	.data
data1:
	.int	1, -1, 463345, -333252322, 0
data2:
	.quad	1, -1, 463345, -333252322, 0

.section	.text
.globl	_start
_start:
	movl $1, %eax	#call exit()
	movl $0, %ebx	#return 0
	int $0x80
