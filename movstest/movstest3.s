#movstest3.s - An example of moving an entire string
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
loop1:
	movsb
	loop loop1

	movl $1, %eax	#call exit()
	movl $0, %ebx	#return 0
	int $0x80
