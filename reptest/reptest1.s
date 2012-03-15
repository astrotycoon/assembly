#reptest1.s - An example of the REP instruction
.section	.data
string:
	.ascii	"This is a test string.\n"

.section	.bss
	.lcomm	output, 23

.section	.text
.globl	_start
_start:
	leal string, %esi
	leal output, %edi

	movl $23, %ecx
	cld
	rep movsb

	movl $1, %eax	#call exit()
	movl $0, %ebx	#return 0
	int $0x80
