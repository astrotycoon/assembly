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
	.data : /* AT(ADDR(.text) + SIZEOF(.text)) */ 
	{
		__data_begin = .; 
		*(.data);
		*(.bss);	
		*(.rodata);	
		__data_end = .;	
	}
	data_size = SIZEOF(.data);
	
	. = 0x07dfe;
	.sig : AT(0x07dfe)
	{
		_stack = .;	/* this is the bottom of stack */
		SHORT(0xaa55);
	}
}
