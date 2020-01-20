#include<iostream>
#include<cmath>
#include<cstdlib>

using namespace std;

void ref(int& i);
void nonref(int i);

int main() {
    int i = 2;
    cout << i << endl;
    ref(i);
    cout << i << endl;
    nonref(i);
    cout << i << endl;

    double *a = new double[10];

    cout << "jee" << endl;
    for (int i = 0; i < 10; i++) {
        a[i] = i;
        cout << a[i] << endl;
    }

    delete [] a;
}


void ref(int& i) {
    i += 1;
}


void nonref(int i) {
    i += 1;
}
