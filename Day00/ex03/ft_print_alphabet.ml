let ft_print_alphabet() = 
  let rec print_letter ascii_number = 
    if ascii_number <= 122 then
      begin
        print_char (char_of_int ascii_number);
        print_letter (ascii_number + 1)
      end
    else
      print_char '\n'
  in
  print_letter 97

let() = ft_print_alphabet()