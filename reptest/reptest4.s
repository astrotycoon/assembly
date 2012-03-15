#reptest4.s - An example of using REP backwards
.section	.data
string:
	.asciz	"This is a test string.\n"

.section	.bss
	.lcomm	output, 24

.section	.text
.globl	_start
_start:
	leal string+22, %esi
	leal output+22, %edi
	movl $23, %ecx
	std	#set DF
	rep movsb

	movl $1, %eax	#call exit()
	movl $0, %ebx	#return 0
	int $0x80
