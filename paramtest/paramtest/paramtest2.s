#paramtest2.s - Listing system environment variables
.section	.data
output:
	.asciz	"%s\n"

.section	.text
.globl	_start
_start:
	movl %esp, %ebp
	addl $12, %ebp	#	%ebp pointer to the first environment patameter
loop1:
	cmpl $0, (%ebp)	#	NULL and (%ebp)
	je endit
	pushl (%ebp)
	pushl $output
	call printf
	addl $8, %esp
	addl $4, %ebp
	loop loop1
endit:
	pushl $0
	call exit
