// Problem V:
csv A = import "./test/Test5A.csv";

A | reform [$0, "0", $0] | asc | write "./test/output24.csv";