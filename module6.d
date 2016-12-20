import std.stdio;
import std.functional;
import std.algorithm;
import std.range;

auto squarelist(int[] sList) pure {
	return map!(a => a * a)(sList);
}

auto inclist(int[] iList, int increment) pure {
	return map!(a => a + increment)(iList);
}

auto sqsum(int[] sqList) pure {
	return reduce!((a, b) => a + b)(map!(a => a * a)(sqList));
}

auto evens(int[] eList) pure {
	return filter!(a => a % 2 == 0)(eList);
}

auto bxor(bool[] bxList) pure {
	return reduce!((a, b) => a != b)(bxList);
}

auto duplist(T)(T[] dList) pure {
	return reduce!((a, b) => a ~= b)(map!(a => [a, a])(dList));
}

auto compose_n(T)(T[] cList) pure {
	return reduce!((a,b)=> a)(retro(cList));
}

void main() {
	int[] nums = [1,2,3,4,5];    
	writeln(inclist(nums,1));       // [2, 3, 4, 5, 6]    
	writeln(squarelist(nums));      // [1, 4, 9, 16, 25]    
	writeln(sqsum(nums));           // 55    
	writeln(evens(nums));           // [2, 4]    
	writeln(bxor([false,true]));    // true    
	writeln(duplist(nums));         // [1, 1, 2, 2, 3, 3, 4, 4, 5, 5]    
	writeln(duplist(["a","b"]));    // ["a", "a", "b", "b"]
	auto f = compose_n([(real a)=>a/3.0,(real a)=>a*a]); 
	writeln(f(2.0));                // 3    
	writeln(f(2.0));                // 3

}
