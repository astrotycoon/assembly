;
; 生成exe后，cs和ds并不相等，所以一开始需要将ds重新赋值为cs
;
assume cs:code
code segment
	mov ax, cs
	mov ds, ax
	mov ax, 0020h
	mov es, ax
	mov bx, 0
	mov cx, offset return - offset code
s:
	mov al, [bx]
	mov es:[bx], al
	inc bx
	loop s
return:
	mov ax, 4c00h
	int 21h
code ends
end
