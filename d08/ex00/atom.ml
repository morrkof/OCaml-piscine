class virtual atom name sym num =
  object (self)
    method name:string = name
    method symbol:string = sym
    method atomic_number:int = num
    method to_string = "Name = " ^ self#name ^ ", symbol = " ^ self#symbol ^ ", atomic number = " ^ (string_of_int self#atomic_number)
    method equals (src:atom) = (self#name = src#name) && (self#symbol = src#symbol) && (self#atomic_number = src#atomic_number)
  end

class hydrogen =
  object
    inherit atom "Hydrogen" "H" 1
  end

class carbon =
  object
    inherit atom "Carbon" "C" 6
  end

class oxygen =
  object
    inherit atom "Oxygen" "O" 8
  end

class calcium =
  object
    inherit atom "Calcium" "Ca" 20
  end

class molybdenum =
  object
    inherit atom "Molybdenum" "Mo" 42
  end

class iron =
  object
    inherit atom "Iron" "Fe" 26
  end

