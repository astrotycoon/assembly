#xaddtest.s - An example of using XADD instruction
#xadd source(must be register), destination(register or address of memory)
.section	.data
value:
	.int 100

.section 	.text
.globl 	_start
_start:
	movl $150, %eax
	xadd %eax, value
	movl $1, %eax	#call exit()
	movl $0, %ebx	#return 0
	int $0x80
