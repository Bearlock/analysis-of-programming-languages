use "stream.sml";

(*Exercise 3*)
datatype number = Int of int | Real of real;

(*Exercise 4*)
fun plus (Int x) (Int y) = Int (x + y)
|	plus (Real x) (Real y) = Real (x + y)
|	plus (Int x) (Real y) = Real (real x + y)
|	plus (Real x) (Int y) = Real (x + real y);

(*Exercise 5*)
datatype intnest = 
	INT of int |
	LIST of intnest list;

fun addup (INT x) = x
|	addup (LIST(x)) = foldr (fn (INT(a), b) => a + b) 0 x;


(*Exercise 9*)
datatype 'data tree = 
	Empty | 
	Node of 'data tree * 'data * 'data tree;

fun appendall Empty = nil 
|	appendall (Node(x, y, z)) = 
		appendall x @ y @ appendall z;

(*Exercise 10*)
fun isComplete Empty = true
|	isComplete (Node(Empty, _, Empty)) = true
|	isComplete (Node((Node x), _, (Node y))) = (isComplete (Node (x)) andalso isComplete (Node(y)))
|	isComplete (Node(_, _, _)) = false; 

(*Exercise A*)
fun fib () =
    let
        fun fibHelper (x, y) = Cons(x, fn () => fibHelper(y, x + y));
    in
        fibHelper (0, 1)
    end;

(*Exercise B*)
datatype (''a, 'b) semipair = Pair of (''a * 'b option);
exception KeyError;

fun pairCount nil = 0
|	pairCount (Pair(_, NONE)::rest) = pairCount rest
|	pairCount (Pair(_, SOME(_))::rest) = 1 + pairCount rest;

fun singCount nil = 0
|	singCount (Pair(_, NONE)::rest) = 1 + singCount rest
|	singCount (Pair(_, SOME(_))::rest) = singCount rest;

fun hasKey nil _ = false
|	hasKey (Pair(x, _)::rest) y = 
		if x = y then true else hasKey rest y;

fun getItem nil _ = raise KeyError
|	getItem (Pair(x, y)::rest) z = 
		if x = z then Pair(x, y) else getItem rest z;

fun getValue nil _ = raise KeyError
|	getValue (Pair(x, y)::rest) z = 
		if x = z then y else getValue rest z;

fun getKeys nil = nil
|	getKeys (Pair(x, _)::rest) = x :: getKeys rest;

fun getValues nil = nil
|	getValues (Pair(_, NONE)::rest) = getValues rest
|	getValues (Pair(_, SOME(y))::rest) = y :: getValues rest;

fun insertItem nil (Pair(x,y)) = [Pair(x,y)]
|	insertItem (Pair(a, b)::rest) (Pair(x, y)) = 
		if a = x then Pair(a, b)::rest else (Pair(a, b)) :: insertItem rest (Pair(x, y));

fun removeItem nil _ = nil
|	removeItem (Pair(x, y)::rest) z = 
		foldr (fn (Pair(a, b), c) => if a = z then c else Pair(a,b)::c) [] (Pair(x,y)::rest);


(* ML Statements *)
print "\n\nOUTPUT\n\n";

print "\n\nExercise 3 \n\n";
val testInt = Int (1);
val testReal = Real (1.0);

print "\n\nExercise 4 \n\n";
plus (Int(1)) (Int(2));
plus (Int(3)) (Real(4.0));
plus (Real(5.0)) (Real(6.0));

print "\n\nExercise 5 \n\n";
addup (INT (1));
val testList = LIST ([INT(1), INT(2)]); 
addup testList;

print "\n\nExercise 9 \n\n";
val tree = Node(Node(Empty, [1,2], Empty), [3,4], Node(Empty, [5,6], Empty));
appendall tree;

print "\n\nExercise 10 \n\n";
val tree1 = Node(Node(Empty,1,Empty),2,Node(Empty,3,Empty));
val tree2 = Node(Node(Empty,1,Empty),2,Empty);

isComplete tree1;
isComplete tree2;
isComplete Empty;


print "\n\nExercise A \n\n";
val f = fib();
printStrm 10 f;


print "\n\nExercise B \n\n";
val stuff = [(Pair (1,SOME "one")), Pair (2,NONE)];
pairCount stuff;
singCount stuff;
getItem stuff 1;
getItem stuff 10 handle KeyError => Pair (0,SOME "error!");
getValue stuff 1;
getValue stuff 10 handle KeyError => SOME "error!";
getKeys stuff;
getValues stuff;
hasKey stuff 1;
hasKey stuff 3;
pairCount stuff;
singCount stuff;
removeItem stuff 1;
insertItem stuff (Pair (3,SOME "three"));
insertItem stuff (Pair (3,SOME "three"));
stuff;



