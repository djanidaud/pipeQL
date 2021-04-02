-- Problem V:
csv A = import A.csv;
A | form [$1, "0", $1] | asc | print;