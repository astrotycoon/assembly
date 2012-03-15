#movstest2.s - An second example of the MOVS instruction
.section	.data
string:
	.asciz	"This is a test string.\n"

.section	.bss
	.lcomm	output, 23

.section	.text
.globl	_start
_start:
	leal string+22, %esi
	leal output+22, %edi

	std	#set EFLAGS DF and the esi(edi) 递减
	movsb
	movsw
	movsl

	movl $1, %eax	#call exit()
	movl $0, %ebx	#return 0
	int $0x80
