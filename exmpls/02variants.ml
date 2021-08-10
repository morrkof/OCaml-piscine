type card = As | King | Queen | Jack 

let onecard = As

type foo = Bar | Baz of int | Qux of string | Norf of card

let cardvalue c = match c with
  | As -> 14
  | King -> 13
  | Queen -> 12
  | Jack -> 11

let () = 
    print_int (cardvalue As);
    print_endline ""