all:
	as --32 -o test.o test1.S
	ld -o test.com test.o --script=com.ld --print-map
#	objcopy --only-section=.text --only-section=.data --only-section=.table --output-target=binary test test.com
#	objcopy --output-target=binary test test.com
	
clean:
	rm -rf test.o test.com
