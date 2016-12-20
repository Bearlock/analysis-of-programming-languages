// multimeth.d
import std.stdio;

/* Possible combinations (in ascending "most derived" order); existing methods marked*:
Y V A *
Y V B
Y V C
Y W A
Y W B *
Y W C
Y X A
Y X B
Y X C *
Z V A *
Z V B
Z V C *
Z W A
Z W B
Z W C
Z X A *
Z X B *
Z X C
*/

class A {};
class B : A {};
class C : B {};
class V {};
class W : V {};
class X : W {};
class Y {};
class Z : Y {};

string dispatch(Y y, V v, A a) {
    B b = cast(B) a;
    C c = cast(C) a;
	W w = cast(W) v;
	X x = cast(X) v;
	Z z = cast(Z) y;

    if (z) {
        if (x && b) {
            return "(Z X B)";
        }
        if (x) {
            return "(Z X A)";
        }
        if (v && c) {
            return "(Z V C)";
        }  
        return "(Z V A)";
    }
    if (x) {
        if (c) {
            return "(Y X C)";
        }
        if (b) {
            return "(Y W B)";
        }
        return "(Y V A)";
    }
    if (w) {
        if (b || c) {
            return "(Y W B)";
        }
    }
    return "(Y V A)";
}

void f(Y y, V v, A a) {
    writeln(dispatch(y, v, a));
}

void main() {
    auto a = new A;
    auto b = new B;
    auto c = new C;
    auto v = new V;
    auto w = new W;
    auto x = new X;
    auto y = new Y;
    auto z = new Z;
    
    f(y,v,a);
    f(y,v,b);
    f(y,v,c);
    f(y,w,a);
    f(y,w,b);
    f(y,w,c);
    f(y,x,a);
    f(y,x,b);
    f(y,x,c);
    f(z,v,a);
    f(z,v,b);
    f(z,v,c);
    f(z,w,a);
    f(z,w,b);
    f(z,w,c);
    f(z,x,a);
    f(z,x,b);
    f(z,x,c);
}

/* Output:
(Y V A)
(Y V A)
(Y V A)
(Y V A)
(Y W B)
(Y W B)
(Y V A)
(Y W B)
(Y X C)
(Z V A)
(Z V A)
(Z V C)
(Z V A)
(Z V A)
(Z V C)
(Z X A)
(Z X B)
(Z X B)
 */
