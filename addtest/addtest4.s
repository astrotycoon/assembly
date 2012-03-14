#addtest4.s - An exampel of detecting an overflow condition
.section	.data
output:
	.asciz	"The result is %d\n"

.section	.text
.globl	_start
_start:
	movl $-1590976934, %ebx
	movl $-1259230143, %eax
	addl %eax, %ebx
	jo overhere
	pushl %ebx
	pushl $output
	call printf
	addl $8, %esp
	pushl $0
	call exit
overhere:
	pushl $0
	pushl $output
	call printf
	addl $8, %esp
	pushl $0
	call exit
