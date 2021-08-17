let talking () =
let phrases = Array.make 5 "" in
  Array.set phrases 0 "Explain! Explain!";
  Array.set phrases 1 "Exterminate! Exterminate!";
  Array.set phrases 2 "I obey!";
  Array.set phrases 3 "You are the Doctor! You are the enemy of the Daleks!";
  Random.self_init();
  let index = Random.int 4 in
  Array.get phrases index

class dalek  =
  object
    initializer print_endline "➜  Object dalek has been created"

    val _name:string = ("Dalek" ^ String.make 1 (char_of_int ((Random.int 94) + 33)) ^ String.make 1 (char_of_int ((Random.int 94) + 33)) ^ String.make 1 (char_of_int ((Random.int 94) + 33)))
    val mutable _hp:int = 100
    val mutable _shield = true
    method to_string = "➜  name = " ^_name ^ ", hp = " ^ (string_of_int _hp) ^ ", shield = " ^ (string_of_bool _shield)
    method talk = print_endline (talking ())
    method exterminate (people:People.people) = people#die; _shield <- false
    method die = print_endline "Emergency Temporal Shift!"
  end