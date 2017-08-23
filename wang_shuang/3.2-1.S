	.file "3.2-1.S"
	.code16

	.text
.globl start, _start
start:
_start:
	nop
	movw $0x1000, %ax
	movw %ax, %ds
	movw $0x2000, %ax
	cli
	movw %ax, %ss
	movw $0x0010, %sp	
	sti

	pushw (0)
	pushw (2)
	pushw (4)
	pushw (6)
	pushw (8)
	pushw (10)
	pushw (12)
	pushw (14)

	movw $0x4c00, %ax
	int $0x21
