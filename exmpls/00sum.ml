let add x y =
  x + y

let main() = 
  print_string "Result: ";
  print_int (add 27 22);
  print_char '\n'

let () = main()