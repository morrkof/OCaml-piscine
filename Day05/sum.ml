let sum x y = x +. y

let () =
  print_float (sum 3.14 3.14);
  print_char '\n';
  print_float (sum 0.0 3.14);
  print_char '\n';
  print_float (sum (-3.14) 3.14);
  print_char '\n'
