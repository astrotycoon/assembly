#stostest1.s - An example of using the STOS instruction
.section	.data
space:
	.ascii	" "

.section	.bss
	.lcomm	buffer, 256

.section	.text
.globl	_start
_start:
	leal space, %esi
	leal buffer, %edi
	movl $256, %ecx
	cld
	lodsb
	rep stosb

	movl $1, %eax	#call exit()
	movl $0, %ebx	#return 0
	int $0x80
