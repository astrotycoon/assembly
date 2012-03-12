#demo2.s - An example of using JZ instruction
.section	.data
output:
	.asciz	"The number is %d\n"
values:
	.int 10, 15, 20, 25, 30, 35, 40, 45, 50, 55, 60

.section	.text
.globl	_start
_start:
	movl $10, %edi
loop:
	movl values(, %edi, 4), %eax
	pushl %eax
	pushl $output
	call printf
	addl $8, %esp	#should clear up the stack
	dec %edi
	jz out		#call this instruction if $edi == 0
	cmp $0, %edi
	jne loop

	movl $1, %eax	#call exit()
	movl $100, %ebx	#return 100
	int $0x80
out:
	movl $1, %eax	#call exit()
	movl $200, %ebx	#return 200
	int $0x80
