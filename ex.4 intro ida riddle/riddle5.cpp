// raz abergel 
// riddle 5
//

#include <iostream>
using namespace std;


void swap( int &a,int &b) {

    int temp = a;
    a = b;
    b = temp;

}

int main()
{
    int input1 = 0;
    int input2 = 0;
    cin >> input1;
    cin >> input2;
    
    cout << input1  << " " << input2 << endl;
    swap(input1, input2);
    cout << input1 << " " << input2 << endl;
    return 0;

}

