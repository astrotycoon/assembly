#inttest.s - An example of using signed integers
.section	.data
data:
	.int	-45

.section	.text
.globl	_start
_start:
	movl $-345, %ecx
	movw $0xffb1, %dx
	movl data, %ebx	#return -45
	movl $1, %eax	#call exit()
	int $0x80
