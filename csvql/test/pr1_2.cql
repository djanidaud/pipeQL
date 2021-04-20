// Problem I:
csv A = import "./test/Test1_2A.csv";
csv B = import "./test/Test1_2B.csv";

A x B | asc | select (arity == 4) | write "./test/output15.csv";
