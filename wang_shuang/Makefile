all:
	as --32 -o test.o test.S
#	ld -o test.com test.o --script=com.ld --print-map
	/home/astrol/test/elfutils/elfutils-architecture-dependent/bin/eu-ld -v -o test.com test.o -c com.ld 

	
clean:
	rm -rf test.o test.com
