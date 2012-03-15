#saltest.s - An example of the SAL instruction	
.section	.data
value1:
	.int	25

.section	.text
.globl	_start
_start:
	movl $10, %ebx
	sall %ebx
	movb $2, %cl
	sall %cl, %ebx
	sall $2, %ebx
	sall value1
	sall $2, value1

	movl $1, %eax	#call exit()
	movl $0, %ebx	#return 0
	int $0x80
