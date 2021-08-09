(* let ifdice x = 
  if x = 1 then "One"
  else if x = 2 then "Two"
  else if x = 3 then "Three"
  else if x = 4 then "Four"
  else if x = 5 then "Five"
  else if x = 6 then "Six"
  else "Error" *)

  let ifdice x = match x with
    | 1 -> "One"
    | 2 -> "Two"
    | 3 -> "Three"
    | 4 -> "Four"
    | 5 -> "Five"
    | 6 -> "Six"
    | _ -> "Error"

  let () = 
    print_endline (ifdice 2);
    print_endline (ifdice 6);
    print_endline (ifdice 7)