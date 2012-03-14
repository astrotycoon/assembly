#ssetest.s - An example of using 128-bit SSE registers and MOVDQA(MOVDQU) instruction
.section	.data
values1:
	.int	1, -1, 0, 135246
values2:
	.quad	1, -1

.section	.text
.globl 	_start
_start:
	movdqu values1, %xmm0
	movdqu values2, %xmm1

	movl $1, %eax	#call exit()
	movl $0, %ebx	#return 0
	int $0x80
