(* let main () = 
  print_endline "Hello world!"

let () = main() *)



(* let n = read_int() in
if (n mod 2) = 0 then
  begin
    print_string "The number ";
    print_int n;
    print_endline " is even"
  end
else
  begin
    print_string "The number ";
    print_int n;
    print_endline " is odd"
  end *)

let add x y =
  x + y

let main() = 
  print_string "Result: ";
  print_int (add 27 22);
  print_char '\n'

let () = main()