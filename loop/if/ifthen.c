/*
	ifthen.c - An sample C if-then program
*/
#include <stdio.h>
int main(int argc, const char *argv[])
{
	int a = 100;
	int b = 25;
	if (a > b && a == 200)
	{
		printf("The higher value is %d\n", a);
	} else
		printf("The higher value is %d\n", b);
	return 0;	
}
