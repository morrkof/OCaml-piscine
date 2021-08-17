let () = 
  let rose = new People.people "Rose" in
  let doc = new Doctor.doctor "Who" 2100 rose in
  let dal = new Dalek.dalek in
  rose#talk;
  doc#talk;
  dal#talk;
  print_endline rose#to_string;
  print_endline doc#to_string;
  print_endline dal#to_string;
  doc#travel_in_time 2000 2500;
  print_endline doc#to_string;
  doc#use_sonic_screwdriver;
  dal#exterminate rose;
  print_endline dal#to_string;
  dal#die
