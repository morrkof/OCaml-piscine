let rec is_odd n = 
  if n < 0 then is_odd (-n)
  else if n = 0 then false
  else if n = 1 then true
  else is_odd (n - 2) (* хвостовая рекурсия *)

let () = 
  if is_odd 3 then print_endline "true"
  else print_endline "false"