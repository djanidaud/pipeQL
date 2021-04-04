// Problem IV:
csv A = import "A.csv";
A | select ($2 != "") | asc | print;