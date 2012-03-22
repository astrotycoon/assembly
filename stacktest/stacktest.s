#stacktest.s - An example of working with the FPU stack
.section	.data
value1:
	.int	40
value2:
	.float	92.4405
value3:
	.double	221.440321

.section	.bss
	.lcomm	int1, 4
	.lcomm	control, 2
	.lcomm	status, 2
	.lcomm 	result, 4

.section	.text
.globl	_start
_start:
	finit
	fstcw control	#	get ctrl-information into memory of control
	fstsw status	#	get stat-information into memory of status

	filds value1	#	push value1 into FPU
	fists int1	#	pop st(0) into memory of int1

	flds value2	#	push value2 into FPU
	fldl value3	#	push value3 into FPU
	fst %st(4)	#	get %st(0) into %st(4)
	fxch %st(1)	#	xchange %st(0) and %st(1)
	fstps result	#	pop %st(0) into memory of reslut

	movl $1, %eax
	movl $0, %ebx
	int $0x80
