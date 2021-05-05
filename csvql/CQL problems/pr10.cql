// Problem X:
csv S = import "S.csv";
csv T = import "T.csv";

S x T | select ($0 == $1 && $4 == $5) 
      | reform [$2, $3]
      | asc
      | print;