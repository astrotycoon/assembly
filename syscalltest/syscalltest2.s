#syscalltest2.s - An example of getting a return value from a system call
.section	.bss
	.lcomm	pid, 4
	.lcomm 	uid, 4
	.lcomm  gid, 4

.section	.text
.globl	_start
_start:
	movl $20, %eax	#	call getpid()
	int $0x80
	movl %eax, pid

	movl $24, %eax	#	call getuid()
	int $0x80
	movl %eax, uid

	movl $47, %eax	#	call getgid()
	int $0x80
	movl %eax, gid

end:
	movl $1, %eax	#	call exit()
	movl $0, %ebx	#	return 0
	int $0x80
