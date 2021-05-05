// Problem IX:
csv R = import "R.csv";

R x R x R | select ($1 == $2 && $3 == $4) 
          | reform [$0, $5] 
          | unique 
          | asc 
          | print;