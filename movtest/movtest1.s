#movtest1.s - An example of moving data from memory to a register
.section	.data
value:
.int 1

.section	.text
.globl _start
_start:
	movl value, %ecx
	movl $1, %eax	#call exit()
	movl $0, %ebx	#return 0
	int $0x80
