class doctor name age sidekick =
  object
    initializer print_endline "➜  Object doctor has been created"

    val _name:string = name
    val mutable _age:int = age
    val _side:People.people = sidekick
    val mutable _hp:int = 100

    method to_string = "➜  name = " ^_name ^ ", age = " ^ (string_of_int _age) ^ ", hp = " ^ (string_of_int _hp) ^ ", sidekick = [" ^ _side#to_string ^ " ]"
    method talk = print_endline ("Hi! I'm the Doctor!")
    method travel_in_time start arrival = _age <- _age - start + arrival; print_endline "╔═══╩═══╗ \n╠╦╦╦═╦╦╦╣ \n╠╬╬╣ ╠╬╬╣ \n╠╩╩╣ ╠╩╩╣ \n║░░║ ║  ║ \n╠══╣ ╠══╣ \n║  ║ ║  ║ \n╠══╣ ╠══╣ \n║  ║ ║  ║ \n╩══╩═╩══╩ \n"
    method use_sonic_screwdriver = print_endline "Whiiiiwhiiiwhiii Whiiiiwhiiiwhiii Whiiiiwhiiiwhiii"
    method private regenerate = _hp <- 100
  end