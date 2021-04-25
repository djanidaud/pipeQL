// Problem II:
csv A = import "A.csv";
A | select ($0 == $1) 
  | reform [$2, $1] 
  | asc 
  | print;
