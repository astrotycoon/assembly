assume cs:code, ds:data, ss:stack


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

data segment
	dw 0123h, 0456h
data ends

stack segment
	dw 2 dup(0)
stack ends

end start
;
;  	masm 默认一个段16字节对齐, 尾部填充0
; 	16字节向上对齐 (N + 16 -1) & (~(16-1))	
;
; ③ code段本身有34字节，由于16字节对齐的原因，会填充至48字节
; 	B8 57 08 8E D0 BC 10 00-B8 56 08 8E D8 FF 36 00 
;	00 FF 36 02 00 8F 06 02-00 8F 06 00 00 B8 00 4C
;	CD 21 00 00 00 00 00 00-00 00 00 00 00 00 00 00
; 
;  	data段紧跟其后，占16字节
;  	stack段紧跟data段后，占16字节
;	因此code段地址为X，那么data段地址为X+3,stack段地址为X+4
;
