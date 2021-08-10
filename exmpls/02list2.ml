let sum_2_first_head = function
| head::next::tail -> head + next
| head::tail -> head
| [] -> 0
;;

sum_2_first_head [1;2;3;4;5;6];;
sum_2_first_head [5;6];;
sum_2_first_head [5];;
sum_2_first_head [];;