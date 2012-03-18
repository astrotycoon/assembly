#function2.s - An example of using global variable in functions
.section	.data
precision:
	.byte	0x7f, 0x00

.section	.bss
	.lcomm	radius, 4
	.lcomm	result, 4
	.lcomm	trash, 4

.section	.text
.globl	_start
_start:
	finit		#	initial the FPU stack
	fldcw precision

	movl $10, radius
	call area

	movl $2, radius
	call area

	movl $120, radius
	call area

	movl $1, %eax	#	call exit()
	movl $0, %ebx	#	return 0
	int $0x80
.type	area, @function
area:
	fldpi		#	pi --> %st(0)
	filds radius
	fmul %st(0), %st(0)
	fmulp %st(0), %st(1)
	fstps result

	ret
