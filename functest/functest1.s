#functest1.s - An example of using function
.section	.data	
precision:
	.byte	0x7f, 0x00
output:
	.asciz	"Radius: %d, Area: %f"

.section	.bss
	.lcomm	value, 4

.section	.text
.globl	_start
_start:
	finit
	fldcw precision

	movl $10, %ebx
	pusha
	call area

	movl $2, %ebx
	call area

	movl $120, %ebx
	call area

	movl $1, %eax	#	call exit()
	movl $0, %ebx	#	return 0
	int $0x80

.type	area, @function
area:
	fldpi		#	pi -->st(0)
	imull %ebx, %ebx#	%ebx^2
	movl %ebx, value
	filds value	#	value -->st(0), pi -->st(1)
	fmulp %st(0), %st(1)
	pushl %ebx
	pushl %eax
	pushl $output
	call printf
	addl $12, %esp
	popa

	ret
