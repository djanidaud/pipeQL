// Problem I:
csv A = import "./test/inputCSV/Test1_1A.csv";
csv B = import "./test/inputCSV/Test1_1B.csv";

A x B | asc | select (arity == 4) |  write "./test/output/output13.csv";
