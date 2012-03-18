#paramtest3.s - An example of using command line parameters
.section	.data
output:
	.asciz	"The area is: %f\n"

.section	.bss
	.lcomm	result, 4

.section	.text
.globl	_start
_start:
	finit

	pushl 8(%esp)	#	8(%esp) pointer to first argument
	call atoi
	addl $4, %esp
	movl %eax, result
	fldpi
	filds result
	fmul %st(0), %st(0)
	fmul %st(1), %st(0)
	fstpl (%esp)
	pushl $output
	call printf
	addl $12, %esp

	pushl $0
	call exit
