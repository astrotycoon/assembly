#signtest.s - An example of using the sign flag and using the JNS instruction
.section	.data
values:
	.int	21, 15, 34, 11, 6, 50, 32, 80, 10, 2
output:
	.asciz	"The value is: %d\n"

.section	.text
.globl	_start
_start:
	movl $9, %edi
loop:
	pushl values(, %edi, 4)
	pushl $output
	call printf
	addl $8, %esp	#should clear up the stack
	dec %edi
	jns loop

	movl $1, %eax	#call exit()
	movl $10, %ebx	#return 10
	int $0x80
