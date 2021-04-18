// Problem I:
csv A = import "A.csv";
csv B = import "B.csv";

query orderedPrint = asc | print;

A x B | reform [$4..$1] | orderedPrint; 