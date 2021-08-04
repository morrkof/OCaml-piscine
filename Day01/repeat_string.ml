let rec repeat_string ?name:(str="x") n =
  if n < 0 then
    "Error"
  else
  if n = 0 then
    ""
  else
    str ^ repeat_string ~name:str (n - 1)

let () = 
  print_string (repeat_string (-1));
  print_char '\n';
  print_string (repeat_string 0);
  print_char '\n';
  print_string (repeat_string ~name:"Toto!" 1);
  print_char '\n';
  print_string (repeat_string ~name:"fusrodah!" 8);
  print_char '\n';
  print_string (repeat_string 8);
  print_char '\n'
