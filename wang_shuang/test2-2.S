	.file "test2-2.S"
	.code16

	.text
.globl start, _start
start:
_start:
	nop
	

	/* set %ds */
	movw $0xffff, %ax
	movw %ax, %ds

	/* set %ss %sp */
	movw $0x2200, %ax
	movw %ax, %ss
	movw $0x0100, %sp

	/* %ax = (0) + (2) */
	movw (0), %ax
	addw (2), %ax
	/* %bx = (4) + (6) */
	movw (4), %bx
	addw (6), %bx

	pushw %ax
	pushw %bx
	popw %ax
	popw %bx

	pushw (4)
	pushw (6)

	/* return to DOS */
	movw $0x4c00, %ax
	int $0x21
