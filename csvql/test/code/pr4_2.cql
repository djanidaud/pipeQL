// Problem III:
csv A = import "./test/inputCSV/Test4_2A.csv";

A | select ($1 != "") | asc | write "./test/output/output23.csv";