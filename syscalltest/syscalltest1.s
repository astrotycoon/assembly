#syscalltest1.s - An example of passing input values to a system call
.section	.data
output:
	.ascii	"This is a test message.\n"
output_end:
	.equ	len, output_end - output

.section	.text
.globl	_start
_start:
	movl $4, %eax	#	call write()
	movl $1, %ebx
#	movl $output, %ecx	#	leal output, %ecx
	leal output, %ecx
	movl $len, %edx
	int $0x80

	movl $1, %eax	#	call exit()
	movl $0, %ebx	#	return 0
	int $0x80
