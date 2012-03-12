#demo1.s - An example of using JZ instruction
.section	.text
.globl	_start
_start:
	movl $30, %eax
	movl $100, %ebx
	subl $30, %eax
	jz overhere
	movl $1, %eax
	int $0x80
overhere:
	movl $200, %ebx
	movl $1, %eax
	int $0x80
