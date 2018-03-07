assume cs:code

code segment
start:
	mov ax, 0123h
	mov ds:[0], ax
	mov word ptr ds:[2], 0
	jmp dword ptr ds:[0]

	mov ax, 0043h
	int 21h
code ends
end start
