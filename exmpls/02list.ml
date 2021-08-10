(* let a = 1 :: 2 :: 3 :: []
let b = 1 :: 2 ::[3]
let c = 1 :: [2; 3]
let d = [1; 2; 3] *)

(* a == b == c == d *)

let l = [1; 2; 3];;

let rec is_in_list x list = match list with
  | [] -> false
  | head::tail -> (x = head) || (is_in_list x tail)
  ;;

is_in_list 2 l;;
is_in_list 4 l;;
is_in_list 4 [];;
