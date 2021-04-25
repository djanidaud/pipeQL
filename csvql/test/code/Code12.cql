//Test 2
csv A = import "./test/inputCSV/Test.csv";

A | if (arity == 2) -> reform [$1, $0]; | write "./test/output/output12.csv";