let () =
  let hydro = new Atom.hydrogen in
  let carb = new Atom.carbon in
  let oxy = new Atom.oxygen in
  let calc = new Atom.calcium in
  let mol = new Atom.molybdenum in
  let mol_2 = new Atom.molybdenum in
  let iron = new Atom.iron in
  print_endline (hydro#to_string);
  print_endline (carb#to_string);
  print_endline (oxy#to_string);
  print_endline (calc#to_string);
  print_endline (mol#to_string);
  print_endline (iron#to_string);
  print_endline (string_of_bool (mol#equals mol_2));
  print_endline (string_of_bool (mol#equals oxy));
