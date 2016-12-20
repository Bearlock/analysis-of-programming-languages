import std.stdio;
import core.thread;
import std.conv;
import std.string;

class StreamFiber(T) : Fiber {
protected:    
	bool term = false;  // Should we terminate the fiber?    
	T val;              // The current stream value    
	abstract void run();
public:    
	this() {        
		super(&run);    
	}    

	T get() const {        
		return val;    
	}    

	void stop() {        
		term = true;    
	} 

	bool done() const {        
		return term;    
	}    
}

class FoldStream(alias f, T): StreamFiber!T {
protected:
	StreamFiber!T sm;
public:
	this(StreamFiber!T stream, T theirType ){
		sm = stream; 
		val = theirType; 
	}
	
	override void run(){
		while(!done){
			if(!sm.done){
				sm.call; 
				val = f(val, sm.get); 
			}
			else{
				stop(); 
				break;
				
			}
			yield;
		}
	}
}


class TrinumStream : StreamFiber!int {
	int step;
	this(int start = 1, int step = 1) {
		val = start;
		this.step = step;
	}

	override void run() {
		while (!done) {
			yield;
			val += ++step;
		}
	}
}

class NumStream : StreamFiber!int {     
	int step;     
	this(int start = 1, int step = 1) {         
		val = start;         
		this.step = step;     
	}     
	override void run() {        
		while (!done) {            
			yield;          
			val += step;   
		}  
	} 
}

class StringStream(T) : StreamFiber!string {
protected:
	StreamFiber!T sm;
public:
	this(StreamFiber!T stream) {
		sm = stream;
	}
	override void run() {
		while (!done) {
			if(sm.done) {
				stop();
				break;
			}
			else {
				sm.call();
				val = to!string(sm.get());
			}
			yield;
		}
	}
}

int f(int x, int y) {
	return x + y;
}

string g(string x, string y) {
	return x ~ "_" ~ y;
}

void main() {    
	auto f1 = new FoldStream!(f,int)(new TrinumStream,0);    
	foreach (i; 0..10) {        
		f1.call;        
		writeln(f1.get);    
	}    
	auto f2 = new FoldStream!(g,string)(new StringStream!int(new NumStream),"0");
	foreach (i; 0..10) {        
		f2.call;        
		writeln(f2.get);    
	}
}