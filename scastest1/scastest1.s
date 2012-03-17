#scastest1.s - An example of the SCAS instruction
.section	.data
string1:
	.ascii	"This is a test - a long text string to scan."
length:
	.int 44
string2:
	.ascii	"-"

.section	.text
.globl	_start
_start:
	leal string1, %edi
	leal string2, %esi
	movl length, %ecx
	lodsb		#	string2 -> al
	cld		# 	clear up DF
	repne scasb
	jne notfound
	subl length, %ecx
	neg %ecx		#	make %ex Two's Complement Negation
	movl $1, %eax	#	call exit()
	movl %ecx, %ebx	#	return %ecx
	int $0x80
notfound:
	movl $1, %eax
	movl $0, %ebx
	int $0x80
	

	
