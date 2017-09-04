assume cs:code, ds:data, ss:stack

data segment
	dw 0123h, 0456h
data ends

stack segment
	dw 2 dup(0)
stack ends

code segment
start:
	mov ax, stack
	mov ss, ax
	mov sp, 16

	mov ax, data
	mov ds, ax

	push ds:[0]
	push ds:[2]
	pop ds:[2]
	pop ds:[0]

	mov ax, 4c00h
	int 21h
code ends
end start
;
;
; ③ data: X-2 stack: X-1
;
; 
; ④ masm 默认一个段16字节对齐, 尾部填充0
; 	16字节向上对齐 (N + 16 -1) & (~(16-1))	
;
;
