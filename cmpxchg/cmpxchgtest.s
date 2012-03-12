#cmpxchgtest.s - An example of the cmpxchg instruction
#cmpxchg source, destination
.section	.data
data:
	.int	100

.section	.text
.globl	_start
_start:
	movl $10, %eax
	movl $5, %ebx
	cmpxchg %ebx, data
	movl $1, %eax	#call exit()
	int $0x80
