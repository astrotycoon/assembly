	.file "test3.S"
	.code16
	.text
.globl _start
_start:
	nop
	movw $0x2000, %ax
	movw %ax, %ss
	movw $0x0000, %sp
	addw $0x0010, %sp
	popw %ax
	popw %bx
	pushw %ax
	pushw %bx
	popw %ax
	popw %bx
	
	/* return to DOS */
	movw $0x4c00, %ax
	int $0x21
