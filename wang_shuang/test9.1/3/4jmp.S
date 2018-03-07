section	jmp_test vstart=0x900
mov word [addr], start
jmp near [addr]
times 128 db 0x90
addr dw 0x00000
start:
	mov ax, 0x1234
	jmp $
