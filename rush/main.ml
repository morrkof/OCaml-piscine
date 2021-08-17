let rec check_state field turn = 
  if Field.is_game_won field turn then ( Field.string_of_field field; Field.string_of_player turn ^ " won" |> print_endline |> exit 0)
  else start_state field (Field.another_player turn)
  
and make_move field turn x y = 
  let succ, new_field = Field.make_move field turn x y in
  if succ then check_state new_field turn else print_endline "Illegal move."; get_move field turn

and get_move field turn = 
  let two_ints_from_string s = 
    let lst = String.split_on_char ' ' s in 
    match lst with
    | one :: two :: [] -> int_of_string one, int_of_string two
    | _ -> failwith "Fail on parsing" in
  let x, y = try read_line () |> two_ints_from_string  with _ -> print_endline "Incorrect format."; get_move field turn; 0, 0
  in make_move field turn x y

and start_state field turn =
  Field.string_of_field field;
  Field.string_of_player turn ^ "\'s turn" |> print_endline;
  get_move field turn

let () = start_state Field.empty_field Field.O