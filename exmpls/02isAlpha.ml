let isalpha c = match c with
  | 'a' .. 'z' | 'A' .. 'Z' -> "True"
  | _ -> "False"

let () = 
  print_endline (isalpha 'a');
  print_endline (isalpha '+')