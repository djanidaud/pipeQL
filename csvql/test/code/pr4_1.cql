// Problem III:
csv A = import "./test/inputCSV/Test4_1A.csv";

A | select ($1 != "") | asc | write  "./test/output/output22.csv";