let rec fact n =
  if n < 0 then -1
  else if n <= 1 then 1
  else n * fact (n - 1) (* не хвостовая рекурсия *)

let main () = 
  print_string "fact 5 = ";
  print_int (fact 5);
  print_char '\n'

let() = main()