; 王爽《汇编语言》第三版，实验7
assume cs:code, ds:data

data segment
	db	'1975','1976', '1977', '1978', '1979','1980', '1981', '1982', '1983'
	db	'1984','1985', '1986', '1987', '1988','1989', '1990', '1991', '1992'
	db	'1993','1994', '1995'
	; 以上是表示21年的21个字符串
	dd 	16, 22, 382, 1356, 2390, 8000, 16000, 24486, 50065, 97479, 140417, 197514
	dd 	345980, 590827, 803530, 1183000, 1843000, 2759000, 3753000, 4649000, 5937000
	; 以上是表示21年公司总收入的21个dword型数据
	dw 	3, 7, 9, 13, 28, 38, 130, 220, 476, 778, 1001, 1442, 2258, 2793, 4037, 5635, 8226
	dw	11542, 14430, 15257, 17800
	; 以上是表示21年公司雇员人数的21个word型数据
data ends

table segment
	;			 0    5    10 D
	db	21	dup('year summ ne ?? ')
table ends

code segment
start:
	nop
	
	mov ax, data
	mov ds, ax

	mov ax, table
	mov es, ax

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	mov cx, 21
	mov bx, 0
	mov si, 0

year_to_table:
	push cx

	mov cx, 2
	mov di, 0
char_to_table:
	mov ax, [si]
	mov es:[bx+di+0], ax
	add si, 2
	add di, 2
	loop char_to_table

	pop cx
	add bx, 16
	loop year_to_table
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	mov cx, 21
	mov bx, 0
	mov si, 54h	; 4 * 21 = 84 = 54h 
incoming_to_table:
	push cx

	mov cx, 2
	mov di, 0
s:
	mov ax, [si]
	mov es:[bx+di+5], ax
	add si, 2
	add di, 2
	loop s

	pop cx
	add bx, 16
	loop incoming_to_table
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	mov cx, 21
	mov bx, 0 
	mov si, 0a8h  
employee_to_table:
	
	mov ax, [si]
	mov es:[bx+10], ax
	add si, 2
	add bx, 16
	loop employee_to_table
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	mov cx, 21
	mov bx, 0
	mov si, 54h
	mov di, 0a8h 
salary_to_table:
	mov ax, [si]
	add si, 2
	mov dx, [si]
	div word ptr [di]
	mov es:[bx+13], ax
	add si, 2
	add di, 2
	add bx, 16
	loop salary_to_table
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

	mov ax, 4c00h
	int 21h
code ends

end start
