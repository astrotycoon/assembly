#cmpstest2.s - An example of using the CMPS instruction

.section	.data
string1:
	.ascii	"This is a test of the CMPS instruction"
string2:
	.ascii	"This is a test of the CMPS Instruction"

.section	.text
.globl	_start
_start:
	movl $1, %eax	#call exit()
	leal string1, %esi
	leal string2, %edi
	movl $39, %ecx
	cld
	repe cmpsb
	je equal
	movl %ecx, %ebx	#return %ecx
	int $0x80
equal:
	movl $0, %ebx	#return 0
	int $0x80
