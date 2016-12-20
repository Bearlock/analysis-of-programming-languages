struct Deque(T) {
	private T[] frontSlice;
	private T[] backSlice;

	public void push_front(T)(T x) {
		T[] tempArray;
		tempArray ~= x;
		frontSlice = tempArray ~ frontSlice;
	}

	public void push_back(T)(T x) {
		backSlice ~= x;
	}

	public T pop_front() {
		if (frontSlice.length > 0) {
			auto retVal = frontSlice[0];
			frontSlice = frontSlice[1 .. $];
			return retVal;
		}
		else {
			auto retVal = backSlice[0];
			backSlice = backSlice[1..$];
			return retVal;
		}
	}

	public T pop_back() {
		if (backSlice.length > 0) {
			auto retVal = backSlice[$-1];
			backSlice = backSlice[0..$-1];
			return retVal;
		}
		else {
			auto retVal = frontSlice[$-1];
			frontSlice = frontSlice[0..$-1];
			return retVal;
		}
	}

	public ref T at(size_t pos) {
		if (pos < frontSlice.length) {
			return frontSlice[pos];
		}
		else {
			return backSlice[pos - frontSlice.length];
		}
	}

	public ref T back() {
		return backSlice[$-1];
	}

	ref T front() {
		return frontSlice[0];
	}

	auto size() {
		return frontSlice.length + backSlice.length;
	}
}

