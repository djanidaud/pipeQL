// Problem IV:
csv A = import "./test/Test4_1A.csv";

A | select ($1 != "") | asc | write "./test/output22.csv";