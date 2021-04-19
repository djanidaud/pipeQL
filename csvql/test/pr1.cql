// Problem I:
csv A = import "Test1_2A.csv";
csv B = import "Test1_2B.csv";

A | A x B | asc | write
