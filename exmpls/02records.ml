type student = {
  name : string;
  login : string;
  etat : string
}

let marvin = {
  name = "Marvin";
  login = "marvin";
  etat = "deprime"
}

let () = 
  print_endline marvin.name