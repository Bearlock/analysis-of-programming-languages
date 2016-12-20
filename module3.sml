fun member (_, nil) = false
|	member (x, head::rest) =
		if x = head then true
		else
		member(x, rest);

fun less (_, nil) = nil
|	less (x, head::rest) =
		if head < x then head::less(x, rest)
		else less(x, rest);

fun repeats nil = false
|	repeats (x::nil) = false
|	repeats ((x:int)::y::rest) =
		if x = y then true 
		else repeats(y::rest);

fun eval ([a], _) = a
|	eval ((head:real)::rest, x) =
		head + (x * eval(rest, x));

fun lessThan (x, y) =
	if x < y then true else false;

fun quicksort (nil, _) = nil
|   quicksort (head::rest, f) =
      let
        fun split(nil) = (nil,nil)
        |   split(x::xs) =
              let
                val (lesser, greater) = split(xs)
              in
                if f(x, head) then (x::lesser, greater) 
                else (lesser, x::greater)
              end;
        val (lesser, greater) = split(rest)
      in
        quicksort (lesser, f) @ [head] @ quicksort (greater, f)
      end;