#cmpxchg8btest.s - An example of using cmpxchg8b instruction
#cmpxchg8b destination	(EDX+EAX)
.section	.data
data:
	.byte	0x11, 0x22, 0x33, 0x44, 0x55, 0x66, 0x77, 0x87

.section	.text
.globl	_start
_start:
	movl $0x44332211, %eax
	movl $0x88776655, %edx	#edx:eax

	movl $0x11111111, %ebx
	movl $0x22222222, %ecx

	cmpxchg8b data

	movl $1, %eax	#call exit()
	movl $0, %ebx	#return 0
	int $0x80

