let n = read_int() in
if (n mod 2) = 0 then
  begin
    print_string "The number ";
    print_int n;
    print_endline " is even"
  end
else
  begin
    print_string "The number ";
    print_int n;
    print_endline " is odd"
  end