#paritytest.s - An example of testing the parity flag and using the JP instruction
.section	.text
.globl	_start
_start:
	movl $1, %eax	#call exit()
	movl $4, %ebx
	subl $1, %ebx	#return 1
	jp overhere
	int $0x80
overhere:
	movl $100, %ebx	#return 100
	int $0x80
