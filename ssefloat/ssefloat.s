#ssefloat.s - An example of moving SSE FP data types
.section	.data
value1:
	.float	12.34, 2345.543, -3493.2, 0.44901
value2:
	.float	-5439.234, 32121.4, 1.0094, 0.000003

.section	.bss
	.lcomm	data, 16

.section	.text
.globl	_start
_start:
	movups value1, %xmm0
	movups value2, %xmm1
	movups %xmm0, %xmm1
	movups %xmm0, data

	movl $1, %eax	#call exit()
	movl $0, %ebx	#return 0
	int $0x80
