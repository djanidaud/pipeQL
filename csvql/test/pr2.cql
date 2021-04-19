// Problem II:
csv A = import "Test2_2A.csv";
A | select ($1 == $2) | reform [$3, $2] | asc | print;
