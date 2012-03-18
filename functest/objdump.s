
functest3:     file format elf32-i386


Disassembly of section .text:

08048074 <_start>:
 8048074:	9b db e3             	finit  
 8048077:	d9 2d d0 90 04 08    	fldcw  0x80490d0
 804807d:	6a 0a                	push   $0xa
 804807f:	e8 32 00 00 00       	call   80480b6 <area>
 8048084:	83 c4 04             	add    $0x4,%esp
 8048087:	a3 d4 90 04 08       	mov    %eax,0x80490d4
 804808c:	6a 02                	push   $0x2
 804808e:	e8 23 00 00 00       	call   80480b6 <area>
 8048093:	83 c4 04             	add    $0x4,%esp
 8048096:	a3 d4 90 04 08       	mov    %eax,0x80490d4
 804809b:	6a 78                	push   $0x78
 804809d:	e8 14 00 00 00       	call   80480b6 <area>
 80480a2:	83 c4 04             	add    $0x4,%esp
 80480a5:	a3 d4 90 04 08       	mov    %eax,0x80490d4
 80480aa:	b8 01 00 00 00       	mov    $0x1,%eax
 80480af:	bb 00 00 00 00       	mov    $0x0,%ebx
 80480b4:	cd 80                	int    $0x80

080480b6 <area>:
 80480b6:	55                   	push   %ebp
 80480b7:	89 e5                	mov    %esp,%ebp
 80480b9:	83 ec 04             	sub    $0x4,%esp
 80480bc:	d9 eb                	fldpi  
 80480be:	df 45 08             	fild   0x8(%ebp)
 80480c1:	d8 c8                	fmul   %st(0),%st
 80480c3:	de c9                	fmulp  %st,%st(1)
 80480c5:	d9 5d fc             	fstps  -0x4(%ebp)
 80480c8:	8b 45 fc             	mov    -0x4(%ebp),%eax
 80480cb:	89 ec                	mov    %ebp,%esp
 80480cd:	5d                   	pop    %ebp
 80480ce:	c3                   	ret    

Disassembly of section .data:

080490d0 <precision>:
 80490d0:	7f 00                	jg     80490d2 <__bss_start>

Disassembly of section .bss:

080490d4 <result>:
 80490d4:	00 00                	add    %al,(%eax)
	...

Disassembly of section .debug_aranges:

00000000 <.debug_aranges>:
   0:	1c 00                	sbb    $0x0,%al
   2:	00 00                	add    %al,(%eax)
   4:	02 00                	add    (%eax),%al
   6:	00 00                	add    %al,(%eax)
   8:	00 00                	add    %al,(%eax)
   a:	04 00                	add    $0x0,%al
   c:	00 00                	add    %al,(%eax)
   e:	00 00                	add    %al,(%eax)
  10:	74 80                	je     ffffff92 <_end+0xf7fb6eba>
  12:	04 08                	add    $0x8,%al
  14:	5b                   	pop    %ebx
	...

Disassembly of section .debug_info:

00000000 <.debug_info>:
   0:	4b                   	dec    %ebx
   1:	00 00                	add    %al,(%eax)
   3:	00 02                	add    %al,(%edx)
   5:	00 00                	add    %al,(%eax)
   7:	00 00                	add    %al,(%eax)
   9:	00 04 01             	add    %al,(%ecx,%eax,1)
   c:	00 00                	add    %al,(%eax)
   e:	00 00                	add    %al,(%eax)
  10:	74 80                	je     ffffff92 <_end+0xf7fb6eba>
  12:	04 08                	add    $0x8,%al
  14:	cf                   	iret   
  15:	80 04 08 66          	addb   $0x66,(%eax,%ecx,1)
  19:	75 6e                	jne    89 <_start-0x8047feb>
  1b:	63 74 65 73          	arpl   %si,0x73(%ebp,%eiz,2)
  1f:	74 33                	je     54 <_start-0x8048020>
  21:	2e 73 00             	jae,pn 24 <_start-0x8048050>
  24:	2f                   	das    
  25:	68 6f 6d 65 2f       	push   $0x2f656d6f
  2a:	61                   	popa   
  2b:	73 74                	jae    a1 <_start-0x8047fd3>
  2d:	72 6f                	jb     9e <_start-0x8047fd6>
  2f:	6c                   	insb   (%dx),%es:(%edi)
  30:	2f                   	das    
  31:	61                   	popa   
  32:	73 6d                	jae    a1 <_start-0x8047fd3>
  34:	2f                   	das    
  35:	66                   	data16
  36:	75 6e                	jne    a6 <_start-0x8047fce>
  38:	63 74 65 73          	arpl   %si,0x73(%ebp,%eiz,2)
  3c:	74 00                	je     3e <_start-0x8048036>
  3e:	47                   	inc    %edi
  3f:	4e                   	dec    %esi
  40:	55                   	push   %ebp
  41:	20 41 53             	and    %al,0x53(%ecx)
  44:	20 32                	and    %dh,(%edx)
  46:	2e 32 31             	xor    %cs:(%ecx),%dh
  49:	2e                   	cs
  4a:	35 33 00 01 80       	xor    $0x80010033,%eax

Disassembly of section .debug_abbrev:

00000000 <.debug_abbrev>:
   0:	01 11                	add    %edx,(%ecx)
   2:	00 10                	add    %dl,(%eax)
   4:	06                   	push   %es
   5:	11 01                	adc    %eax,(%ecx)
   7:	12 01                	adc    (%ecx),%al
   9:	03 08                	add    (%eax),%ecx
   b:	1b 08                	sbb    (%eax),%ecx
   d:	25 08 13 05 00       	and    $0x51308,%eax
	...

Disassembly of section .debug_line:

00000000 <.debug_line>:
   0:	53                   	push   %ebx
   1:	00 00                	add    %al,(%eax)
   3:	00 02                	add    %al,(%edx)
   5:	00 22                	add    %ah,(%edx)
   7:	00 00                	add    %al,(%eax)
   9:	00 01                	add    %al,(%ecx)
   b:	01 fb                	add    %edi,%ebx
   d:	0e                   	push   %cs
   e:	0d 00 01 01 01       	or     $0x1010100,%eax
  13:	01 00                	add    %eax,(%eax)
  15:	00 00                	add    %al,(%eax)
  17:	01 00                	add    %eax,(%eax)
  19:	00 01                	add    %al,(%ecx)
  1b:	00 66 75             	add    %ah,0x75(%esi)
  1e:	6e                   	outsb  %ds:(%esi),(%dx)
  1f:	63 74 65 73          	arpl   %si,0x73(%ebp,%eiz,2)
  23:	74 33                	je     58 <_start-0x804801c>
  25:	2e 73 00             	jae,pn 28 <_start-0x804804c>
  28:	00 00                	add    %al,(%eax)
  2a:	00 00                	add    %al,(%eax)
  2c:	00 05 02 74 80 04    	add    %al,0x4807402
  32:	08 03                	or     %al,(%ebx)
  34:	0b 01                	or     (%ecx),%eax
  36:	3d 68 2f 59 3d       	cmp    $0x3d592f68,%eax
  3b:	5a                   	pop    %edx
  3c:	2f                   	das    
  3d:	59                   	pop    %ecx
  3e:	3d 5a 2f 59 3d       	cmp    $0x3d592f5a,%eax
  43:	5a                   	pop    %edx
  44:	59                   	pop    %ecx
  45:	59                   	pop    %ecx
  46:	32 21                	xor    (%ecx),%ah
  48:	2f                   	das    
  49:	3d 2f 3d 2f 2f       	cmp    $0x2f2f3d2f,%eax
  4e:	3d 3e 2f 22 02       	cmp    $0x2222f3e,%eax
  53:	01 00                	add    %eax,(%eax)
  55:	01 01                	add    %eax,(%ecx)
