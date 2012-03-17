
scastest1:     file format elf32-i386


Disassembly of section .text:

08048074 <_start>:
 8048074:	8d 3d ac 90 04 08    	lea    0x80490ac,%edi
 804807a:	8d 35 dc 90 04 08    	lea    0x80490dc,%esi
 8048080:	8b 0d d8 90 04 08    	mov    0x80490d8,%ecx
 8048086:	ac                   	lods   %ds:(%esi),%al
 8048087:	fc                   	cld    
 8048088:	f2 ae                	repnz scas %es:(%edi),%al
 804808a:	75 13                	jne    804809f <notfound>
 804808c:	66 2b 0d d8 90 04 08 	sub    0x80490d8,%cx
 8048093:	66 f7 d9             	neg    %cx
 8048096:	b8 01 00 00 00       	mov    $0x1,%eax
 804809b:	89 cb                	mov    %ecx,%ebx
 804809d:	cd 80                	int    $0x80

0804809f <notfound>:
 804809f:	b8 01 00 00 00       	mov    $0x1,%eax
 80480a4:	bb 00 00 00 00       	mov    $0x0,%ebx
 80480a9:	cd 80                	int    $0x80

Disassembly of section .data:

080490ac <string1>:
 80490ac:	54                   	push   %esp
 80490ad:	68 69 73 20 69       	push   $0x69207369
 80490b2:	73 20                	jae    80490d4 <string1+0x28>
 80490b4:	61                   	popa   
 80490b5:	20 74 65 73          	and    %dh,0x73(%ebp,%eiz,2)
 80490b9:	74 20                	je     80490db <length+0x3>
 80490bb:	2d 20 61 20 6c       	sub    $0x6c206120,%eax
 80490c0:	6f                   	outsl  %ds:(%esi),(%dx)
 80490c1:	6e                   	outsb  %ds:(%esi),(%dx)
 80490c2:	67 20 74 65          	and    %dh,0x65(%si)
 80490c6:	78 74                	js     804913c <_end+0x5c>
 80490c8:	20 73 74             	and    %dh,0x74(%ebx)
 80490cb:	72 69                	jb     8049136 <_end+0x56>
 80490cd:	6e                   	outsb  %ds:(%esi),(%dx)
 80490ce:	67 20 74 6f          	and    %dh,0x6f(%si)
 80490d2:	20 73 63             	and    %dh,0x63(%ebx)
 80490d5:	61                   	popa   
 80490d6:	6e                   	outsb  %ds:(%esi),(%dx)
 80490d7:	2e                   	cs

080490d8 <length>:
 80490d8:	2c 00                	sub    $0x0,%al
	...

080490dc <string2>:
 80490dc:	2d                   	.byte 0x2d

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
  10:	74 80                	je     ffffff92 <_end+0xf7fb6eb2>
  12:	04 08                	add    $0x8,%al
  14:	37                   	aaa    
	...

Disassembly of section .debug_info:

00000000 <.debug_info>:
   0:	4c                   	dec    %esp
   1:	00 00                	add    %al,(%eax)
   3:	00 02                	add    %al,(%edx)
   5:	00 00                	add    %al,(%eax)
   7:	00 00                	add    %al,(%eax)
   9:	00 04 01             	add    %al,(%ecx,%eax,1)
   c:	00 00                	add    %al,(%eax)
   e:	00 00                	add    %al,(%eax)
  10:	74 80                	je     ffffff92 <_end+0xf7fb6eb2>
  12:	04 08                	add    $0x8,%al
  14:	ab                   	stos   %eax,%es:(%edi)
  15:	80 04 08 73          	addb   $0x73,(%eax,%ecx,1)
  19:	63 61 73             	arpl   %sp,0x73(%ecx)
  1c:	74 65                	je     83 <_start-0x8047ff1>
  1e:	73 74                	jae    94 <_start-0x8047fe0>
  20:	31 2e                	xor    %ebp,(%esi)
  22:	73 00                	jae    24 <_start-0x8048050>
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
  35:	73 63                	jae    9a <_start-0x8047fda>
  37:	61                   	popa   
  38:	73 74                	jae    ae <_start-0x8047fc6>
  3a:	65                   	gs
  3b:	73 74                	jae    b1 <_start-0x8047fc3>
  3d:	31 00                	xor    %eax,(%eax)
  3f:	47                   	inc    %edi
  40:	4e                   	dec    %esi
  41:	55                   	push   %ebp
  42:	20 41 53             	and    %al,0x53(%ecx)
  45:	20 32                	and    %dh,(%edx)
  47:	2e 32 31             	xor    %cs:(%ecx),%dh
  4a:	2e                   	cs
  4b:	35 33 00 01 80       	xor    $0x80010033,%eax

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
   0:	45                   	inc    %ebp
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
  1b:	00 73 63             	add    %dh,0x63(%ebx)
  1e:	61                   	popa   
  1f:	73 74                	jae    95 <_start-0x8047fdf>
  21:	65                   	gs
  22:	73 74                	jae    98 <_start-0x8047fdc>
  24:	31 2e                	xor    %ebp,(%esi)
  26:	73 00                	jae    28 <_start-0x804804c>
  28:	00 00                	add    %al,(%eax)
  2a:	00 00                	add    %al,(%eax)
  2c:	00 05 02 74 80 04    	add    %al,0x4807402
  32:	08 03                	or     %al,(%ebx)
  34:	0c 01                	or     $0x1,%al
  36:	67 67 67 21 21       	addr32 addr32 and %esp,(%bx,%di)
  3b:	2f                   	das    
  3c:	2f                   	das    
  3d:	75 3d                	jne    7c <_start-0x8047ff8>
  3f:	59                   	pop    %ecx
  40:	2f                   	das    
  41:	30 59 59             	xor    %bl,0x59(%ecx)
  44:	02 02                	add    (%edx),%al
  46:	00 01                	add    %al,(%ecx)
  48:	01                   	.byte 0x1
