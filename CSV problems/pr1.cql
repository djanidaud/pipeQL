// Problem I:
csv A = import "A.csv";
csv B = import "B.csv";

query orderedPrint = note "hey" | asc | print;

A ++ A | orderedPrint;
