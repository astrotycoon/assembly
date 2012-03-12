#carrytest.s - An example of using the carry flag and using the JC instruction
.section	.text
.globl	_start
_start:
	movl $0xffffffff, %ebx
#	inc %ebx	#dec and inc do not cause the carry
	addl $1, %ebx	#can cause the carry
	jc overhere
	movl $1, %eax	#call exit()
	movl $200, %ebx	#return 200
	int $0x80
overhere:	
	movl $1, %eax	#call exit()
	movl $100, %ebx	#return 100
	int $0x80
