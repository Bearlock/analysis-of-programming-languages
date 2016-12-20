import std.stdio;
import std.typecons;
import std.string;
import std.algorithm;


struct Semimap(K,V) {    
	private Nullable!(V)[K] stuff; // “Semipair” associative array

	public string toString(){
		string retString = "";
		foreach(key; stuff.keys.sort){
			if (stuff[key].isNull) {
				retString ~= format("%s", key);
			} else {
				retString ~= format("%s: %s", key, stuff[key]);
			}
			retString ~= ", ";
		}
		return retString;
	}

	void set(K key) {
		Nullable!V test;
		test.nullify;
		stuff[key] = test;
	}

	void set(K key, V str) {
		stuff[key] = str;
	}

	auto get(K key) {
		return stuff[key];
	}

	auto count() {
		return tuple(singCount(), pairCount());
	}

	int pairCount() {
		int count = 0;
		foreach(item; stuff) {
			if (!item.isNull) {
				count++;
			}
		}
		return count;
	}

	int singCount() {
		int count = 0;
		foreach(item; stuff) {
			if (item.isNull) {
				count++;
			}
		}
		return count;
	}

	bool hasKey(K key) {
		auto keys = stuff.keys();
		foreach(arrayKey; keys) {
			if (key == arrayKey) {
				return true;
			}
		}
		return false;
	}

	auto byKey() {
		return stuff.byKey();
	}

	auto byValue() {
		//stuff = sort(stuff);
		return stuff.byValue();
	}

	auto keys() {
		return sort(stuff.keys());
	}
	auto values() {
		auto things = stuff.values();
		V[] retVals;
		foreach(thing; things) {
			if (!thing.isNull()) {
				retVals ~= thing;
			}
		}
		return retVals;
	}

	void reset(K key) {
		this.set(key);
	}

	void remove(K key) {
		stuff.remove(key);
	}
}

void main() {    
	Semimap!(int,string) sm;    
	writeln(sm);    
	sm.set(2);    
	sm.set(1,"one");    
	sm.set(3);    
	writeln(sm.count);    
	writeln(sm.pairCount);   
	writeln(sm.singCount);    
	writeln(sm);    
	writeln(sm.hasKey(1));    
	writeln(sm.get(1));    
	writeln(sm.hasKey(10));    
	auto val = sm.get(2);    
	assert(val.isNull);     
	writeln(sm.keys);    
	writeln(sm.values);    
	foreach(k; sm.byKey)         
		writeln("key = ",k);    
	foreach(v; sm.byValue)         
		if (!v.isNull)            
			writeln("value = ",v);    
	sm.set(3,"three");    
	writeln(sm);    
	sm.reset(3);    
	writeln(sm);    
	sm.remove(3);    
	writeln(sm);
}

