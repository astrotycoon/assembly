section	jmp_test vstart=0x900
jmp 0x0000:start
times 128 db 0x90
start:
	mov ax, 0x1234
	jmp $
