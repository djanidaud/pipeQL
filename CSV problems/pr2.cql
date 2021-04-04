// Problem II:
csv A = import "A.csv";
A | select ($1 == $2) | reform [$3, $2] | asc | print;
