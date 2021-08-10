let () = 
  let jokes = Array.make 5 "" in
  Array.set jokes 0 "I went to buy some camouflage trousers the other day, but I couldn’t find any.";
  Array.set jokes 1 "I have kleptomania. But when it gets bad, I take something for it.";
  Array.set jokes 2 "My New Year’s resolution is to get in shape. I choose round.";
  Array.set jokes 3 "Toughest job I ever had? Selling doors, door-to-door.";
  Array.set jokes 4 "I was playing chess with my friend and he said, ‘Let’s make this interesting’. So we stopped playing chess.";
  Random.self_init();
  let index = Random.int 5 in
  print_endline (Array.get jokes index)
