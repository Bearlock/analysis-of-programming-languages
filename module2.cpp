#include <iostream>
using namespace std;

void readStuff (unsigned long long x)
{
    union hexAndInstructions
    {
        unsigned long long hexPortion;
        
        struct {
            unsigned int li:32;
            unsigned int rreg:6;
            unsigned int lreg:6;
            unsigned int si:7;
            unsigned int radrm:4;
            unsigned int ladrm:4;
            unsigned int code:5;
        } ;
    };
    hexAndInstructions instructions;
    instructions.hexPortion = x;

    cout << "rreg = " << dec << instructions.rreg << endl;
    cout << "lreg = " << dec << instructions.lreg << endl;
    cout << "si = " << dec << instructions.si << endl;
    cout << "radrm = " << dec << instructions.radrm << endl;
    cout << "ladrm = " << dec << instructions.ladrm << endl;
    cout << "code = " << dec << instructions.code << endl;
    cout << "li = " << dec << instructions.li << endl;
}

int main( ) {
    unsigned long long x;
    while (cin >> hex >> x) {
        cout << "Instruction: " << hex << x << endl;
        cout << dec;     // Convert back to decimal
        readStuff(x);
        cout << endl;
    }
}