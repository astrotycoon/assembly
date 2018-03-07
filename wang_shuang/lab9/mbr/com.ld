OUTPUT_FORMAT(binary)
EXTERN(_stack);
SECTIONS
{
	. = 0x07c00;
	.text : AT(0x07c00)
	{
		*(.text);
	}
/*	. = ADDR(.text) + SIZEOF(.text); */
	.data ALIGN(16) : /* AT(ADDR(.text) + SIZEOF(.text)) */ 
	{
		__data_begin = .; 
		*(.data);
		*(.bss);	
		*(.rodata);	
		__data_end = .;	
	}
	
	. = 0x07dfe;
	.sig : AT(0x07dfe)
	{
		__stack_end = .;	/* this is the bottom of stack */
		SHORT(0xaa55);
	}
}
