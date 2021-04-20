// Problem II:
csv A = import "./test/Test2_1A.csv";

A | select ($1 == $2) | reform [$3, $2] | asc | write "./test/output16.csv";
