//raz abergel
//riddle4
// i used scanf_s because the compiler forced me to
#include <stdio.h>


void my_func(int* input1, int input2) // insert into input1 the biggest num by reference
{
	if (*input1 <= input2) {
		*input1 = input2;
	}
	else
	{
		return; // //*input1 = *input1;
	}
}

int main()
{
	int input1;
	int	input2;


	scanf_s("%d", &input1);
	scanf_s("%d", &input2);

	my_func(&input1, input2);

	printf("%d", input1); // 

	return 0;
}


