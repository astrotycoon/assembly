#imultest2.s - An example of detecting an IMUL overflow
.section	.text
.globl	_start
_start:
	movw $680, %ax
	movw $100, %cx
	imulw %cx
	jo overhere
	movl $1, %eax	#call exit()
	movl $0, %ebx	#return 0
	int $0x80
overhere:
	movl $1, %eax	#call exit()
	movl $1, %ebx	#return 0
	int $0x80
