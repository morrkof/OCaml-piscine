type foo = int

let x:foo = 3

(* let y:foo = 4.2  <-- not compile *)

type bar = int -> int

let plusUn:bar = (+) 1