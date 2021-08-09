let ft_print_digits() = 
  let ascii_of_0 = int_of_char '0' in
  let ascii_of_9 = int_of_char '9' in
  let rec loop ascii_of_current = 
    if ascii_of_current <= ascii_of_9 then 
    let char_of_current = char_of_int ascii_of_current in
      print_char char_of_current;
      loop (ascii_of_current + 1)
in loop ascii_of_0;
print_char '\n'

let main() = ft_print_digits()
let() = main()