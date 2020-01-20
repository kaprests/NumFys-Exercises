#include<iostream>
#include<cstdlib> // atof function (string -> float)
#include<cmath> // math stuff


using namespace std;


int main (int argc, char* argv[]) {
    double r = atof(argv[1]);
    double s = sin(r);
    cout << "Hello, World! sin(" << r << ") =" << s << endl;

    int *b;
    b = new int[10];
    for (int i = 0; i<10; i++) {
        b[i] = i;
        cout << b[i] << endl;
    }

    cout << b << endl << &b[0] << endl;
    cout << *(b+5) << endl;

    int a = 11;
    int *d = &a;
    cout << *d << endl;

    delete [] b;
}
