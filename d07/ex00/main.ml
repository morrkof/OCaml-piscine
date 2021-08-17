let () = 
  let rose = new People.people ("Rose") in
  rose#talk;
  print_endline rose#to_string;
  rose#die;
  print_endline rose#to_string
