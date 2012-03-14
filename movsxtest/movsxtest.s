#movsxtest.s - An example of the MOVSX instruction
.section	.text
.globl	_start
_start:
	movl $0x12345678, %eax
	movw $-79, %cx
	movl $0, %ebx
	movw %cx, %bx
	movsx %cx, %eax
	movl $1, %eax	#call exit()
	movl $0, %ebx	#return 0
	int $0x80
