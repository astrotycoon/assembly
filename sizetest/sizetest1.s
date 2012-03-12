#sizetest1.s - A simple program to view the excutable size
.section	.text
.globl _start
_start:
	movl $1, %eax	#call exit()
	movl $0, %ebx	#return 0
	int $0x80
