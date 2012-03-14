#movzxtest.s - An example of the MOVZX instruction
.section	.text
.globl	_start
_start:
	movl $279, %ecx
	movl $0x12345678, %ebx
	movzx %cl, %ebx
	movl $1, %eax	#calle exit()
	int $0x80
