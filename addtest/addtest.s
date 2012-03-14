#addtest1.s - An example of the ADD instruction
.section	.data
data:
	.int	40

.section	.text
.globl	_start
_start:
	movl $0, %eax
	movl $0, %ebx
	movl $0, %ecx
	movb $-20, %al
	movsx %al, %eax

	movw $100, %cx
	addw %cx, %bx
	movsx %bx, %ebx

	movl $100, %edx
	addl %edx, %edx
	addl %eax, data

	movl $1, %eax	#call exit()
	movl $0, %ebx	#return 0
	int $0x80
