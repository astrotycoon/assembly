
scastest1:     file format elf32-i386


Disassembly of section .text:

08048074 <_start>:
 8048074:	8d 3d ac 90 04 08    	lea    0x80490ac,%edi
 804807a:	8d 35 dc 90 04 08    	lea    0x80490dc,%esi
 8048080:	8b 0d d8 90 04 08    	mov    0x80490d8,%ecx
 8048086:	ac                   	lods   %ds:(%esi),%al
 8048087:	fc                   	cld    
 8048088:	f2 ae                	repnz scas %es:(%edi),%al
 804808a:	75 11                	jne    804809d <notfound>
 804808c:	2b 0d d8 90 04 08    	sub    0x80490d8,%ecx
 8048092:	f7 d9                	neg    %ecx
 8048094:	b8 01 00 00 00       	mov    $0x1,%eax
 8048099:	89 cb                	mov    %ecx,%ebx
 804809b:	cd 80                	int    $0x80

0804809d <notfound>:
 804809d:	b8 01 00 00 00       	mov    $0x1,%eax
 80480a2:	bb 00 00 00 00       	mov    $0x0,%ebx
 80480a7:	cd 80                	int    $0x80
