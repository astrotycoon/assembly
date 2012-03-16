#cmpstest.s - A simple example of the CMPS instruction
.section	.data
string1:
	.ascii	"Test"
string2:
	.ascii	"Test"

.section	.text
.globl	_start
_start:
	movl $1, %eax	#call exit()
	leal string1, %esi
	leal string2, %edi
	cld 
	cmpsl
	je equal
	movl $1, %ebx	#return 1
	int $0x80
equal:
	movl $0, %ebx	#return 0
	int $0x80

