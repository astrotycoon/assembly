#sse2float.s - An example of moving SSE2 FP data types
.section	.data
value1:
	.double	12.34, 2345.543
value2:
	.double -5439.234, 32121.4

.section	.bss
	.lcomm	data, 16

.section	.text
.globl	_start
_start:
	movupd value1, %xmm0
	movupd value2, %xmm1
	movupd %xmm0, %xmm1
	movupd %xmm0, data

	movl $1, %eax	#call exit()
	movl $0, %ebx	#return 0
	int $0x80
