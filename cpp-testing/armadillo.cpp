#include<iostream>
#include<cstdlib>
#include<cmath>
#include<armadillo>


using namespace std;
using namespace arma;


int main() {
    mat A = randu<mat>(4,5);
    mat B = randu<mat>(4,5);

    cout << A*B.t() << endl;
    cout << A << endl << B << endl;
}


