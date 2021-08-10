(* ocamlopt unix.cmxa micronap.ml *)

let my_sleep () = Unix.sleep 1

let () = 
  let argv = Sys.argv in
  let num = try (int_of_string argv.(1)) with _ -> 0 in
  for i = (num - 1) downto 0 do
    my_sleep()
  done