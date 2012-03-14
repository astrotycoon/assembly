#addtest2.s - An example of the ADD instruction and negative numbers
.section	.data
data:
	.int -40

.section	.text
.globl	_start
_start:
	movl $-10, %eax
	movl $-200, %ebx
	movl $80, %ecx
	addl data, %eax
	addl %ecx, %eax
	addl %ebx, %eax
	addl %eax, data
	addl $210, data

	movl $1, %eax	#call exit()
	movl $0, %ebx	#return 0
	int $0x80

