//raz abergel
//riddle3 
// i used scanf_s because the compiler forced me to
#include <stdio.h>

void func(int input1, int input2) {


	for (int i = input1; i > 0; i--)
	{
		for (int j = 1; j <= i; j++) { // 
			printf("*");
		}
		printf("\n");
		
		
	}


}

int main() {

	int input1;
	int input2;

	scanf_s("%d", &input1);
	scanf_s("%d", &input2);

	func(input1, input2);

	return 0;

}


