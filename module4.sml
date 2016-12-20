fun squarelist x = map (fn a => a * a) x;
fun inclist x y = map (fn a => y + a) x;
fun bxor x = foldr (fn (a,b) => if a andalso b then false else true) false x;
fun dupList x = foldr (fn (a,b) => a::a::b) [] x;
fun mylength x = foldr (fn (a,b) => 1 + b) 0 x;
fun min x = foldr (fn (a,b) => if a < b then a else b) (hd x) x;
fun member (x, y) = foldr (fn (a,b) => if a = x then true else false) false y;
fun evens x = foldr (fn (a, b) => if ((a mod 2) = 0) then a::b else b) [] x; 
fun compose x y = foldr (fn (a, b) => a b) y x;