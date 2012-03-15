#subtest2.s - An example of a subtraction carry
.section	.text
.globl	_start
_start:
	movl $5, %eax
	movl $2, %ebx
	subl %eax, %ebx
	jc overhere
	movl $1, %eax	#call exit()
	int $0x80
overhere:
	movl $1, %eax	#call exit()
	movl $0, %ebx	#return 0
	int $0x80
