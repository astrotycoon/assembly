assume cs:code, ds:data

data segment
	dd 12345678h
data ends

code segment
start:
	mov ax, data
	mov ds, ax
	mov bx, 0h
	mov word ptr [bx], offset start
	mov [bx+2], cs	
	jmp dword ptr ds:[0] 

	mov ax, 4c00h
	int 21h
code ends
end start
