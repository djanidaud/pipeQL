// Problem I:
csv A = import "./test/inputCSV/Test1_3A.csv";
csv B = import "./test/inputCSV/Test1_3B.csv";

A x B | asc | select (arity == 4) | write "./test/output/output15.csv";

