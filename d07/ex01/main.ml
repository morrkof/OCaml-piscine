let () = 
  let rose = new People.people "Rose" in
  let doc = new Doctor.doctor "Who" 2100 rose in
  rose#talk;
  doc#talk;
  print_endline rose#to_string;
  print_endline doc#to_string;
  doc#travel_in_time 2000 2500;
  print_endline doc#to_string;
  doc#use_sonic_screwdriver
