let rec print_list = function
  |[] -> print_string "\n"
  |hd::tl -> print_string hd; print_string " "; print_list tl

let main argc argv = 
  print_list argv

let () =
  let argv = Array.to_list Sys.argv in
  main (List.length argv) argv