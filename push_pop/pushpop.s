#pushpop.s - An example of using the PUSH and POP instruction
.section	.data
data:
	.int 	125

.section	.text
.globl	_start
_start:
	movl $24420, %ecx
	movw $350, %bx
	movl $100, %eax	#equal to movb $100, %al

	pushl %ecx
	pushw %bx
	pushl %eax
	pushl data	#push the 32-bit data value referenced by the data label
	pushl $data	#push the 32-bt memory address referenced by the data label

	popl %eax
	popl %eax
	popl %eax
	popw %ax
	popl %eax

	movl $0, %ebx
	movl $1, %eax
	int $0x80
