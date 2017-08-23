/*OUTPUT_FORMAT(binary) 
EXTERN(__stack_begin); */
SECTIONS
{
	/* code segment */
	. = ALIGN(16);	
	. = 0x100;
	.text : AT(0x100) 
	{
		__text_begin = .;
		*(.text);
		__text_end = .;
	}
	
	/* data segment */
	. = ALIGN(16);	
	. = 0x200;
	.data : 
	{
		__data_begin = .; 
		*(.data);
		__data_end = .;	
	}

	/* stack segment */
	. = ALIGN(16);	
	. = 0x300;
	.stack : 
	{
		__stack = .;
	}
}
