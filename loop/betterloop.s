#betterloop.s - An example of the loop and jcxz instruction
.section	.data
output:
	.asciz	"The value is: %d\n"

.section	.text
.globl	_start
_start:
	movl $0, %ecx
	movl $0, %eax
	jcxz done
loop1:
	addl %ecx, %eax
	loop loop1
done:
	pushl %eax
	pushl $output
	call printf
	movl $1, %eax	#call exit()
	movl $0, %ebx	#return 0
	int $0x80
