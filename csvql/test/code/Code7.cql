//Test 2
csv A = import "./test/inputCSV/Test.csv";
A | reform [$0, $1, $1] | write "./test/output/output7.csv";