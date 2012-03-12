#demo.s - An example of using the carry flag
.section	.text
.globl	_start
_start:
	movl $2, %eax
	subl $4, %eax
	jc overhere
	movl $1, %eax	#call exit()
	movl $100, %ebx	#return 100
	int $0x80
overhere:
	movl $1, %eax	#call exit()
	movl $200, %ebx	#return 200
	int $0x80
