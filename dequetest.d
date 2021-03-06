﻿// dequetest.d
import deque, std.stdio; 

// deque is your D module

unittest {    
	Deque!int d;    
	d.push_front(1);    
	d.push_back(2);
	//writeln(d);
	assert(d.at(0) == 1);    
	assert(d.at(1) == 2);    
	assert(d.size() == 2);    
	d.push_front(3);    
	d.push_back(4);
	//writeln(d);
	assert(d.back() == 4);    
	assert(d.front() == 3);    
	d.at(1) = 10;    
	d.front() = 30;    
	d.back() = 40;
	//writeln(d);
	assert(d.back() == 40);    
	assert(d.front() == 30);    
	assert(d.at(1) == 10);

	//writeln("First foreach block");
	foreach (n; 100..200)        
		d.push_back(n);    

	//writeln("Second foreach block");
	foreach (n; 200..300)        
		d.push_front(n); 

	//writeln(d);
	assert(d.front() == 299);    
	assert(d.back() == 199);     

	//writeln("Asserted front = 299, back = 199");
	foreach (n; 0..d.size())        
		d.pop_back();   
		
	assert(d.size() == 0);
	//writeln(d);
	Deque!string d2;    
	d2.push_front("one");    
	d2.push_back("two");    
	assert(d2.at(0) == "one");    
	assert(d2.at(1) == "two");    
	assert(d2.size() == 2);
	//writeln(d2);
	d2.push_front("three");    
	d2.push_back("four");    
	assert(d2.back() == "four");    
	assert(d2.front() == "three");    
	//writeln(d2);
	d2.at(1) = "ten";    
	d2.front() = "thirty";    
	d2.back() = "forty";    
	assert(d2.back() == "forty");    
	assert(d2.front() == "thirty");    
	assert(d2.at(1) == "ten");
	//writeln(d2);
	
	foreach (n; 0..d2.size())        
		d2.pop_front();    
	assert(d2.size() == 0);
	//writeln(d2);
	writeln("unit test passed");
}
