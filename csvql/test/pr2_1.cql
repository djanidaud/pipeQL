// Problem II:
csv A = import "./test/Test2_1A.csv";

A | select ($0 == $1) | reform [$2, $1] | asc | write "./test/output16.csv";
