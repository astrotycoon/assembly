/* while.c - A sample C while program */
#include <stdio.h>

int main()
{
	int i = 0;
	int j;
	while (i < 1000)
	{
		j = i * 5;
		printf("The answer is %d\n", j);
		i++;
	}
	return 0;
}
