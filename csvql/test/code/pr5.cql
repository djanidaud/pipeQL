// Problem III:
csv A = import "./test/inputCSV/Test5A.csv";

A | reform [$0, "0", $0] | asc | write "./test/output/output24.csv";