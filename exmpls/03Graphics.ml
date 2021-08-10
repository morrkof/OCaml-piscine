let main () = 
  Graphics.open_graph " 800x600";
  Graphics.moveto 400 300;
  Graphics.draw_string "42";
  Graphics.read_key ();;

let _ = main ();;