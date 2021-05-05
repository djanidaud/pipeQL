// Problem VII:
csv F = import "F.csv";
csv G = import "G.csv";

F x G | select ($1 != "" && $2 != "" && $1 == $3 && $2 == $4) 
      | reform [$0, $5] 
      | asc 
      | print;