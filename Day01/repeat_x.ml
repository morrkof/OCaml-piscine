let rec repeat_x n =
  if n < 0 then
    "Error"
  else
  if n = 0 then
    ""
  else
    "x" ^ repeat_x (n - 1)

let () = 
  print_string (repeat_x (8));
  print_char '\n';
  print_string (repeat_x (5));
  print_char '\n';
  print_string (repeat_x (3));
  print_char '\n';
  print_string (repeat_x (0));
  print_char '\n';
  print_string (repeat_x (-3));
  print_char '\n'