#paramtest1.s - Listing command line parameters
.section	.data
output1:
	.asciz	"There are %d parameters:\n"
output2:
	.asciz	"%s\n"

.section	.text
.globl	_start
_start:
	movl (%esp), %ecx	#	count of parameters --> %ecx
	pushl %ecx
	pushl $output1
	call printf
	addl $4, %esp		#	%esp pointer to (%ecx)
	popl %ecx		#	count of parameters --> %ecx
	movl %esp, %ebp		#	%esp pointer to (the count of patameters)
	addl $4, %ebp		#	%ebp pointer to (the name of program)
loop1:
	pushl %ecx		#	avoid printf destroy %ecx
	pushl (%ebp)		#	(%ebp) pointer to command line
	pushl $output2
	call printf
	addl $8, %esp
	popl %ecx
	addl $4, %ebp
	loop loop1
end:
	pushl $0
	call exit
