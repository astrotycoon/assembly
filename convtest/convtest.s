#contest.s - An example of data conversion
.section	.data
value1:
	.float	1.25, 124.79, 200.0, -312.5
value2:	
	.int 1, -435, 0, -25

.section	.bss
	.lcomm	data, 16

.section	.text
.globl	_start
_start:
	cvtps2dq value1, %xmm0
	cvttps2dq value1, %xmm1
	cvtdq2ps value2, %xmm2
	movdqu %xmm0, data

	movl $1, %eax	#call exit()
	movl $0, %ebx	#return 0
	int $0x80
