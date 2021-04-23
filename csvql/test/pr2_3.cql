// Problem II:
csv A = import "./test/Test2_3A.csv";

A | select ($0 == $1) | reform [$2, $1] | asc |  write "./test/output18.csv";
