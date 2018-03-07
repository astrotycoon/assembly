assume cs:code, ds:data

data segment
	db 	0
	dw 	offset start	; 这里是生成exe文件，并且start在code段的一开始，所以偏移为0	
data ends

code segment
start:
	mov ax, data
	mov ds, ax
	mov bx, 0
	jmp word ptr [bx+1]

	mov ax, 4c00h
	int 21h
code ends
end start
