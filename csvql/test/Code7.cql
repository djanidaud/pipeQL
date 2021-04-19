//Test 2
csv A = import "./test/Test.csv";
A | reform [$0, $1, $1] | write "./test/output.csv";