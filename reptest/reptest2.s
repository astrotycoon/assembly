#reptest2.s - An incorrect example of using the REP instruction
.section	.data
string1:
	.ascii	"This is a test string.\n"
string2:
	.ascii	"Oops"

.section	.bss
	.lcomm	output, 23

.section	.text
.globl	_start
_start:
	leal string1, %esi
	leal output, %edi
	movl $6, %ecx
	cld 	#clear up DF
	rep movsl

	movl $1, %eax	#call exit()
	movl $0, %ebx	#return 0
	int $0x80

