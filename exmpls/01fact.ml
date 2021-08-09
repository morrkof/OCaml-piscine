let fact n = 
  let rec fact_aux n acc = 
    if n <= 1 then acc
    else fact_aux (n - 1) (acc * n) (* хвостовая рекурсия *)
  in fact_aux n 1

let () = 
  print_int (fact 6);
  print_char '\n'