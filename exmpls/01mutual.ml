let rec is_odd n = 
  if n < 0 then is_odd (-n)
  else if n == 0 then false
  else is_even (n - 1)

and is_even n =  (* and - keyword for mutual recursion *)
  if n < 0 then is_even (-n)
  else if n == 0 then true
  else is_odd (n - 1)

let () = 
  if is_odd 3 then print_endline "true"
  else print_endline "false"