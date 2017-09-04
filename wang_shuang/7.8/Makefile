all:
	as --32 -o test.o test.S
	ld -o test.com test.o --script=com.ld --print-map
	
clean:
	rm -rf test.o test.com
