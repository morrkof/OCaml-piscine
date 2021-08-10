type 'a ft_ref = {mutable data : 'a}

let return a = { data = a }
let get a = a.data
let set a value = a.data <- value
let bind a f = f(get a)

let add x = x + 2

let () = 
  let my_ref = return 666 in
  print_int (get my_ref);
  print_char '\n';
  set my_ref 21;
  print_int (get my_ref);
  print_char '\n';
  let bind_ref = bind my_ref (fun x -> return (x + x)) in
  print_int (get bind_ref);
  print_char '\n';
