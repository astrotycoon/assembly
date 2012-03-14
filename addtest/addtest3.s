#addtest3.s - An example of detecting a carry condition
.section	.text
.globl	_start
_start:
	movl $0, %ebx
	movb $190, %bl 
	movb $10, %al
	addb %al, %bl
	jc overhere
	movl $1, %eax
	int $0x80
overhere:
	movl $1, %eax	#call exit()
	movl $0, %ebx	#return 0
	int $0x80
