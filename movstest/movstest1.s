#movstest.s - An example of the MOVS instruction
#%esi	-> the address of the source string 
#%edi	-> the address of the destination string
#movl $output, %es(d)x	or leal output, %es(d)x
.section	.data
string1:
	.asciz	"This is test string.\n"

.section	.bss
	.lcomm	output, 23

.section	.text
.globl	_start
_start:
	leal string1, %esi
	leal output, %edi
	movsb
	movsw
	movsl

	movl $1, %eax	#call exit()
	movl $0, %ebx	#return 0
	int $0x80
