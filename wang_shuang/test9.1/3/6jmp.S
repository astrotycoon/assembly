section jmp_test vstart=0x900
jmp far [addr]
times 128 db 0x90
addr dw start, 0x0000
start:
	mov ax, 0x1234
	jmp $
