// Problem II:
csv A = import "./test/inputCSV/Test2_3A.csv";

A | select ($0 == $1) | reform [$2, $1] | asc | write "./test/output/output18.csv";
