OUTPUT_FORMAT(binary)
ENTRY(_start)

SECTIONS
{
	. = 0x0100;
	.text ALIGN(16) :
	{
		__text_begin = .;
		*(.text) 
		. = 0xff;
		__text_end = .;
	} = 0x90
	
	. = 0x0200;
	.data ALIGN(16) :
	{
		__data_begin = .;
		*(.data)
		__data_end = .;
	}
}
