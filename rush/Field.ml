type player = O | X

let string_of_player = function
  | O -> "O"
  | X -> "X"

let another_player = function
  | O -> X 
  | X -> O

let player_offset = function
  | O -> 0
  | X -> 10

type field = Field of
        int * int * int (* 1 2 3 *)
      * int * int * int (* 4 5 6 *)
      * int * int * int (* 7 8 9 *)
      * int             (* out field *)

(* int = [(10 bits of X-player signs)(10 bits of O-player size)] *)
(*       [(9, 8, 7, 6, 5, 4, 3, 2, 1, ())(9, 8, 7, 6, 5, 4, 3, 2, 1, ())]*)
let empty_field = Field(0, 0, 0,
                        0, 0, 0,
                        0, 0, 0,
                        0)

let field_full = 0b1111111110
let win_condition = [
  0b0000001110; (* 1 2 3 *)
  0b0001110000; (* 4 5 6 *)
  0b1110000000; (* 7 8 9 *)
  0b1001001000; (* 3 6 9 *)
  0b0100100100; (* 2 5 8 *)
  0b0010010010; (* 1 4 7 *)
  0b1000100010; (* 1 5 9 *)
  0b0010101000; (* 3 5 7 *)
]

let is_cell_won cell =
  let rec match_with_won_cond cell = function
    | [] -> false
    | h :: t -> (h land cell) = h || match_with_won_cond cell t in
  match_with_won_cond cell win_condition

let is_game_won (f: field) (p: player) = 
  let off = player_offset p in
  match f with 
  | Field(fir, sec, th, fo, fi, si, se, ei, ni, te) -> te lsr off |> is_cell_won

let make_move (f: field) (p: player) x y = 
  let ap = another_player p in
  let off = player_offset p in
  let ap_off = player_offset ap in
  match f with 
  | Field(fir, sec, th, fo, fi, si, se, ei, ni, te) as orig -> 
    match x with
    | 1 -> let al = (fir lor (0x1 lsl (off + y))) in if ((fir lsr (off + y)) land 0x1) lor ((fir lsr (ap_off + y)) land 0x1) = 0x1 || fir |> is_cell_won then false, orig
      else true, Field(al, sec, th, fo, fi, si, se, ei, ni, if (al lsr off) |> is_cell_won || ((al lsr (off)) lor ((al lsr (ap_off))) land field_full = field_full) then te lor (0x1 lsl (1 + off)) else te)
    | 2 -> let al = (sec lor (0x1 lsl (off + y))) in if ((sec lsr (off + y)) land 0x1) lor ((sec lsr (ap_off + y)) land 0x1) = 0x1 || sec |> is_cell_won then false, orig
      else true, Field(fir, al, th, fo, fi, si, se, ei, ni, if ((al lsr off) |> is_cell_won || ((al lsr (off)) lor (al lsr (ap_off))) land field_full = field_full) then te lor (0x1 lsl (2 + off)) else te)
    | 3 -> let al = (th lor (0x1 lsl (off + y))) in if ((th lsr (off + y)) land 0x1) lor ((th lsr (ap_off + y)) land 0x1) = 0x1 || th |> is_cell_won then false, orig
      else true, Field(fir, sec, al, fo, fi, si, se, ei, ni, if ((al lsr off) |> is_cell_won || ((al lsr (off)) lor (al lsr (ap_off))) land field_full = field_full) then te lor (0x1 lsl (3 + off)) else te)
    | 4 -> let al = (fo lor (0x1 lsl (off + y))) in if ((fo lsr (off + y)) land 0x1) lor ((fo lsr (ap_off + y)) land 0x1) = 0x1 || fo |> is_cell_won then false, orig
      else true, Field(fir, sec, th, al, fi, si, se, ei, ni, if ((al lsr off) |> is_cell_won || ((al lsr (off)) lor (al lsr (ap_off))) land field_full = field_full) then te lor (0x1 lsl (4 + off)) else te)
    | 5 -> let al = (fi lor (0x1 lsl (off + y))) in if ((fi lsr (off + y)) land 0x1) lor ((fi lsr (ap_off + y)) land 0x1) = 0x1 || fi |> is_cell_won then false, orig
      else true, Field(fir, sec, th, fo, al, si, se, ei, ni, if ((al lsr off) |> is_cell_won || ((al lsr (off)) lor (al lsr (ap_off))) land field_full = field_full) then te lor (0x1 lsl (5 + off)) else te)
    | 6 -> let al = (si lor (0x1 lsl (off + y))) in if ((si lsr (off + y)) land 0x1) lor ((si lsr (ap_off + y)) land 0x1) = 0x1 || si |> is_cell_won then false, orig
      else true, Field(fir, sec, th, fo, fi, al, se, ei, ni, if ((al lsr off) |> is_cell_won || ((al lsr (off)) lor (al lsr (ap_off))) land field_full = field_full) then te lor (0x1 lsl (6 + off)) else te)
    | 7 -> let al = (se lor (0x1 lsl (off + y))) in if ((se lsr (off + y)) land 0x1) lor ((se lsr (ap_off + y)) land 0x1) = 0x1 || se |> is_cell_won then false, orig
      else true, Field(fir, sec, th, fo, fi, si, al, ei, ni, if ((al lsr  off) |> is_cell_won || ((al lsr  (off)) lor (al lsr (ap_off))) land field_full = field_full) then te lor (0x1 lsl (7 + off)) else te)
    | 8 -> let al = (ei lor (0x1 lsl (off + y))) in if ((ei lsr (off + y)) land 0x1) lor ((ei lsr (ap_off + y)) land 0x1) = 0x1 || ei |> is_cell_won then false, orig
      else true, Field(fir, sec, th, fo, fi, si, se, al, ni, if ((al lsr  off) |> is_cell_won || ((al lsr  (off)) lor (al lsr (ap_off))) land field_full = field_full) then te lor (0x1 lsl (8 + off)) else te)
    | 9 -> let al = (ni lor (0x1 lsl (off + y))) in if ((ni lsr (off + y)) land 0x1) lor ((ni lsr (ap_off + y)) land 0x1) = 0x1 || ni |> is_cell_won then false, orig
      else true, Field(fir, sec, th, fo, fi, si, se, ei, al, if ((al lsr  off) |> is_cell_won || ((al lsr  (off)) lor (al lsr (ap_off))) land field_full = field_full) then te lor (0x1 lsl (9 + off)) else te)
    | _ -> false, orig

let get_mini_field_by_index field idx =
  match field with
  | Field (fir, sec, th, fo, fi, si, se, ei, ni, te) -> (
    match idx with
    | 1 -> fir
    | 2 -> sec
    | 3 -> th
    | 4 -> fo
    | 5 -> fi
    | 6 -> si
    | 7 -> se
    | 8 -> ei
    | 9 -> ni
    | 10 -> te
    | _ -> invalid_arg "Index should be from 1 to 9"
  )
  
let get_mini_index = function
  | 1 | 2 | 3 | 10 | 11 | 12 | 19 | 20 | 21 -> 1
  | 4 | 5 | 6 | 13 | 14 | 15 | 22 | 23 | 24 -> 2
  | 7 | 8 | 9 | 16 | 17 | 18 | 25 | 26 | 27 -> 3
  | 28 | 29 | 30 | 37 | 38 | 39 | 46 | 47 | 48 -> 4
  | 31 | 32 | 33 | 40 | 41 | 42 | 49 | 50 | 51 -> 5
  | 34 | 35 | 36 | 43 | 44 | 45 | 52 | 53 | 54 -> 6
  | 55 | 56 | 57 | 64 | 65 | 66 | 73 | 74 | 75 -> 7
  | 58 | 59 | 60 | 67 | 68 | 69 | 76 | 77 | 78 -> 8
  | 61 | 62 | 63 | 70 | 71 | 72 | 79 | 80 | 81 -> 9
  | _ -> invalid_arg "Invalid index"
  
let get_micro_index = function
  | 1 | 4 | 7 | 28 | 31 | 34 | 55 | 58 | 61 -> 1
  | 2 | 5 | 8 | 29 | 32 | 35 | 56 | 59 | 62 -> 2
  | 3 | 6 | 9 | 30 | 33 | 36 | 57 | 60 | 63 -> 3
  | 10 | 13 | 16 | 37 | 40 | 43 | 64 | 67 | 70 -> 4
  | 11 | 14 | 17 | 38 | 41 | 44 | 65 | 68 | 71 -> 5
  | 12 | 15 | 18 | 39 | 42 | 45 | 66 | 69 | 72 -> 6
  | 19 | 22 | 25 | 46 | 49 | 52 | 73 | 76 | 79 -> 7
  | 20 | 23 | 26 | 47 | 50 | 53 | 74 | 77 | 80 -> 8
  | 21 | 24 | 27 | 48 | 51 | 54 | 75 | 78 | 81 -> 9
  | _ -> invalid_arg "Invalid index"
  
let get_cell_by_index mini_field idx = (mini_field land (0x1 lsl idx)) <> 0x0

let o_win_print =
  function
  | 1 | 9 -> '/'
  | 2 | 8 -> '-'
  | 3 | 7 -> '\\'
  | 4 | 6 -> '|'
  | 5 -> ' '
  | _ -> invalid_arg "Invalid index"

let x_win_print =
  function
  | 1 | 9 -> '\\'
  | 3 | 7 -> '/'
  | 2 | 4 | 6 | 8 -> ' '
  | 5 -> 'X'
  | _ -> invalid_arg "Invalid index"
  
let string_of_field field =
  let rec loop idx =
    if idx <= 81 then (
      let ten = get_mini_field_by_index field 10 in
      let mini_idx = get_mini_index idx in
      let micro_idx = get_micro_index idx in
      let mini_field = get_mini_field_by_index field mini_idx in
      if (ten land (0x1 lsl mini_idx)) <> 0x0 then print_char (o_win_print micro_idx)
      else if (ten land (0x1 lsl (10 + mini_idx))) <> 0x0 then print_char (x_win_print micro_idx)
      else if get_cell_by_index mini_field micro_idx then print_char 'O'
      else if get_cell_by_index mini_field (micro_idx + 10) then print_char 'X'
      else print_char '-';
      print_char ' ';
      if idx mod 9 = 0 then print_char '\n'
      else if idx mod 3 = 0 then print_string "| ";
      if idx = 27 || idx = 54 then print_endline "---------------------";
      loop (idx + 1)
    )
  in loop 1
