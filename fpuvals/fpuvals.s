#fpuvals.s - An example of pushing floating point constants
.section	.text
.globl	_start
_start:
	fld1
	fldl2t
	fldl2e
	fldpi
	fldlg2
	fldln2
	fldz

	movl $1, %eax	#call exit()
	movl $0, %ebx	#return 0
	int $0x80
