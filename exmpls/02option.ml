type int_option = Some of int | None

let is_nothing x = match x with
  | None -> "Nothing"
  | Some n -> "Something " ^ (string_of_int n)


let extract x = match x with 
  | None -> 0
  | Some x -> x

let () = 
  let a = Some 42 in
  let b = None in

  print_endline (is_nothing a);
  print_endline (is_nothing b);
  print_endline (string_of_int (extract a));
  print_endline (string_of_int (extract b));