OUTPUT_FORMAT(binary)
ENTRY(_start)

SECTIONS
{
	. = 0x0100;
	.text ALIGN(16) :
	{
		__text_begin = .;
		*(.text)
		__text_end = .;
	} 

	.data ALIGN(16) :
	{
		__data_begin = .;
		*(.data)
		__data_end = .;
	}
	__char_array_element_nums = SIZEOF(.data) >> 4;	/* 每个元素16字节 */ 

	.bss ALIGN(16) :
	{
		__begin_stack = .;
		*(.bss)
		__end_stack = .;
	}

	/DISCARD/ : 
	{
  		*(.note.GNU-stack) 
		*(.gnu_debuglink) 
		*(.gnu.lto_*) 
	}
}
