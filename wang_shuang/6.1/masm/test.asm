assume cs:code
code segment
	dw	0123h, 0456h, 0789h, 0abch, 0defh, 0fedh, 0cbah, 0987h

; 没有start时，exe头文件信息中ip初始值为0，加上start后，初始值为0x10
start:
	mov bx, 0
	mov ax, 0
	mov cx, 8
	mov ax, offset start
s:
	add ax, cs:[bx]
	add bx, 2
	loop s

	mov ax, 4c00h
	int 21h

code ends
end	start	; end label 这里的label指明程序入口处
