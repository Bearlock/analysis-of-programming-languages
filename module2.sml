(*3. *)
fun fourth x = 
	(hd (tl (tl (tl x))));

(*Test Case fourth [1, 2, 3, 4, 5]; *)

(*4. *)
fun min3 (x: int * int * int) = 
	if (#1 x <= #2 x andalso #1 x <= #3 x) then #1 x 
	else 
		if (#2 x <= #1 x andalso #2 x <= #3 x) then #2 x 
		else 
			#3 x;

(*Test Case min3 (4, 2, 9); *)

(*5. *)
fun red3 (x: 'a * 'b * 'c) = 
	(#1 x, #3 x);

(*Test Case red3 (1, 2, 3); *)

(*6. *)
fun thirds (x: string) = 
	hd (tl (tl (explode x)));

(*Test Case thirds "Hello";	*)

(*7. *)
fun cycle1 x =
	(tl x) @ [hd x];

(*Test Case cycle1 [1, 2, 3, 4, 5]; *)

(*8. *)
fun sort3 (x: real * real * real) = 
	if (#1 x <= #2 x andalso #1 x <= #3 x)
	then
		if (#2 x <= #3 x) then [#1 x, #2 x, #3 x]
		else [#1 x, #3 x, #2 x]
	else
		if (#2 x <= #1 x andalso #2 x <= #3 x)
		then
			if (#1 x < #3 x) 
			then [#2 x, #1 x, #3 x]
			else [#2 x, #3 x, #1 x]
		else
			if (#1 x < #2 x) 
			then [#3 x, #1 x, #2 x] 
			else [#3 x, #2 x, #1 x];

(*Test Case sort3 (1.1, 1.5, 1.2); *)

(*9. *)
fun del3 x = 
	[hd x] @ [hd (tl x)] @ tl(tl(tl(x)));

(*Test Case del3 [1, 2, 3, 4, 5]; *)

(*10. *)
fun sqsum x =
	if x > 0 
	then
		(x * x) + sqsum(x - 1)
	else
		x;

(*Test Case sqsum 5; *)

(*11. *)
fun cycle (x, y) = 
	if y > 0 then cycle ((cycle1 x), y - 1 )
	else x;

(*Test Case cycle ([1, 2, 3, 4, 5, 6], 2); *)

(*13. *)
fun maxHelper (x: int list, y: int) =
	if null x then y
	else
		if y >= hd x then maxHelper (tl x, y)
		else maxHelper (tl x, hd x);

fun max (x: int list) =
	maxHelper (tl x, hd x);

(*Test Case max [1, 2, 3, 3232, 5]; *)

(*14. *)
fun isPrimeHelper (x: int, y:int) =
if x * x > y then true
else
	if y mod x = 0 then false
	else
		isPrimeHelper(x + 1, y);

fun isPrime (x: int) =
	if x = 1 then false
	else
		isPrimeHelper(2, x);

(*Test Case isPrime 7; *)
	

(*15. *)
fun select (x: 'a list, y: 'a -> bool) =
	if null x then x
	else
		if y (hd x) then [hd x] @ select(tl x, y)
		else select (tl x, y);

(*Test Case select ([1, 2, 3, 4, 5, 6, 7, 8, 9, 10], isPrime); *)



