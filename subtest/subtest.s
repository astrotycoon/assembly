#subtest.s - An example of the SUB instruction
.section	.data
data:
	.int 40

.section	.text
.globl	_start
_start:
#	movl $0, %eax
#	movl $0, %ebx
#	movl $0, %ecx
	xor %eax, %eax
	xor %ebx, %ebx
	xor %ecx, %ecx

	movb $20, %al
	subb $10, %al
	movsx %al, %eax

	movw $100, %cx
	subw %cx, %bx
	movsx %bx, %ebx
	
	movl $100, %edx
	subl %eax, %edx
	subl data, %eax
	subl %eax, data

	movl $1, %eax	#call exit()
	movl $0, %ebx	#return 0
	int $0x80

