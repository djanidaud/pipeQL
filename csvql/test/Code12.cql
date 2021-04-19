//Test 2
csv A = import "./test/Test.csv";

A | if (arity == 2) -> reform [$1, $0]; | write "./test/output12.csv";