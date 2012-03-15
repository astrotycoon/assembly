#reptest3.s - Moving a large string using MOVSL and MOVSB
.section	.data
string:
	.asciz	"This is a test of the conversion program!\n"
length:
	.int 43
divisor:
	.int 4

.section	.bss
	.lcomm	buffer, 43

.section	.text
.globl	_start
_start:
	leal string, %esi
	leal buffer, %edi
	movl length, %ecx
	shrl $2, %ecx	#	%ecx = %ecx/4
	cld		#clear up DF

	rep movsl
	movl length, %ecx
	andl $3, %ecx
	rep movsb

	movl $1, %eax	#call exit()
	movl $0, %ebx	#return 0
	int $0x80
