#convert.s - Converting lower to upper case
.section	.data
string:
	.asciz	"This is TEST, of the conversion program!\n"
length:
	.int 43
.section	.text
.globl	_start
_start:
	leal string, %esi
	movl %esi, %edi		# %esi and %edi pointe to the same string
	movl length, %ecx
	cld
loop1:
	lodsb
	cmpb $'a', %al
	jl skip
	cmpb $'z', %al
	jg skip
	subb $0x20, %al
skip:
	stosb
	loop loop1
end:
	pushl $string
	call printf
	addl $4, %esp
	pushl $0
	call exit
