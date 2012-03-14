#floattest.s - An example of using floating point numbers
#fld source (source -> FPU)
#flds -> float
#fldl -> double
#fsts -> float
#fstl -> double

.section	.data
value1:
	.float	12.34
value2:
	.double	2325.631

.section	.bss
	.lcomm	data, 8

.section	.text
.globl	_start
_start:
	flds value1
	fldl value2
	fstl data

	movl $1, %eax	#call exit()
	movl $0, %ebx	#return 0
	int $0x80
