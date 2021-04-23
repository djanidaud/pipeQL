// Problem IV:
csv A = import "./test/Test4_2A.csv";

A | select ($1 != "") | asc | write "./test/output23.csv";