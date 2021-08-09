let pair = (2, 3)
let quinte = ("10", "Valet", "Dame", "Roi", "As")
let foo = ("Bar", 42, true)

let f x = match x with
  | ("Bar", 42, false) -> print_endline ("1")
  | ("Bar", _, true) -> print_endline ("2")
  | (_, _, _) -> print_endline ("3")

let () =
  f foo