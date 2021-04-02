-- Problem II:
csv A = import A.csv;
A | select [$1 == $2] | form [$3, $2] | asc | print;