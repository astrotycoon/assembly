#getstatus.s - Get FPU Status register contents by using FSTSW instrction
#fstsw %ax --> get infomation into ax 
#fstsw (memory) --> get infomation into memory
.section	.bss
	.lcomm	status, 2

.section	.text
.globl _start
_start:
	fstsw %ax
	fstsw status 

	movl $1, %eax	#	call exit()
	movl $0, %ebx	# 	return 0
	int $0x80


