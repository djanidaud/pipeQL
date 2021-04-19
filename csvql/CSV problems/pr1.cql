// Problem I:
csv A = import "A.csv";
csv B = import "B.csv";

query orderedPrint = asc | print;

A | orderedPrint | write "gugu.csv"; 