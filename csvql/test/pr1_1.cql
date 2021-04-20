// Problem I:
csv A = import "./test/Test1_1A.csv";
csv B = import "./test/Test1_1B.csv";

A x B | asc | select (arity == 4) | write "./test/output15.csv";
