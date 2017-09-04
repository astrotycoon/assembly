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
	__byte_array_len = . - __data_begin;
}
