//Test 2
csv A = import "./test/inputCSV/Test.csv";
A | if ($0 == "Andrew") -> reform [$0, $1, $1]; | write "./test/output/output8.csv";