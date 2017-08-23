	.file "5.1.S"
	.code16

	.text
.globl _start
_start:
	nop

	xorl %eax, %eax
	xorl %ebx, %ebx
	xorl %ecx, %ecx

	movw %cs, %ax
	cli
	movw %ax, %ss
	movw $stack, %sp
	sti

	/* copy data to desitination (0x21000)*/
	movw $0x2100, %ax
	movw %ax, %es
	movw $data_len, %cx
	movw $0, %bx
	call write_data

	/* program */
	movw $0x2000, %ax
	movw %ax, %ds
	movw $0x1000, %bx
	movw (%bx), %ax
	incw %bx
	incw %bx
	movw %ax, (%bx)
	incw %bx
	incw %bx
	movw %ax, (%bx)
	incw %bx
	movb %al, (%bx)
	incw %bx
	movb %al, (%bx)

	/* return to DOS */
	movw $0x4c00, %ax
	int $0x21

data_start:
	.quad 	0x00000000000000be
//	.quad 	0x0102030405060708
data_end:
	.equ data_len, data_end - data_start

write_data:
	pushw %ax
agian:
	movb data_start(, %ebx, 1), %al
	movb %al, %es:(, %ebx, 1)
	incw %bx
	loop agian
	popw %ax
	ret

	.org 0x100, 0x90
stack:	/* this is the bottom of stack */
