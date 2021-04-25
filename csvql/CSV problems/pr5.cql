// Problem V:
csv A = import "A.csv";
A | reform [$1, "0", $1] | asc | print;

