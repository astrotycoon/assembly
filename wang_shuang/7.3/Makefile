all:
	as --32 -o test.o test.S 
	ld -o test.com test.o --nmagic --script=com.ld --print-map 

clean:
	rm -rf test.o test test.com 

