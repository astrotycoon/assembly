#loop.s - An example of the loop instruction
.section	.data
output:
	.asciz	"The value is: %d\n"

.section	.text
.globl	_start
_start:
	movl $100, %ecx
	movl $0, %eax
loop1:
	addl %ecx, %eax
	loop loop1

	pushl %eax
	pushl $output
	call printf
	addl $8, %esp

	movl $1, %eax	#call exit()
	movl $0, %ebx	#return 0
	int $0x80
