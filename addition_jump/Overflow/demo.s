#demo.s - An example of using the JO instruction
.section	.text
.globl	_start
_start:
	movl $1, %eax	#call exit()
	movb $0x7f, %bl
	addb $1, %bl
	jo overhere
	movl $100, %ebx	#return 100
	int $0x80
overhere:
	movl $200, %ebx	#return 200
	int $0x80
