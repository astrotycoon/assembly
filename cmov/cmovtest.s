#vmoctest.s - An example of the CMOV instructions
.section	.data
output:
	.asciz	"The largest value is %d\n"
       #.asciz 	"The smallest value is %d\n"
values:
	.int	105, 235, 61, 315, 134, 221, 53, 145, 117, 5

.section	.text
.globl	_start
_start:
	movl values, %ebx	#move first data of values to register ebx
	movl $1, %edi
loop:
	movl values(, %edi, 4), %eax	#move second data to register eax
	cmp %ebx, %eax
	cmova %eax, %ebx	#if (%eax) > (%ebx)
#	cmovb %eax, %ebx	 if (%eax) < (%ebx)
	inc %edi		#	%edi += 1
	cmp $10, %edi
	jne loop

	pushl %ebx		#push ebx to stack(store the largest num)
	pushl $output
	call printf
	addl $8, %esp
	pushl $0
	call exit
