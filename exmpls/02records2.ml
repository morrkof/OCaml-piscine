type student = {
  name : string;
  login : string;
  etat : string
}

let print_record e = match e with
  | {login;_} when login = "marvin" -> e.name
  | {name; etat; _} -> "OTHER"

let () =
  let marvin = {
    name = "Marvinella";
    login = "marvin";
    etat = "deprime"
  } in
  print_endline (print_record marvin)