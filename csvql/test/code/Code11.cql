//Test 2
csv A = import "./test/inputCSV/Test.csv";
csv B = import "./test/inputCSV/Test.csv";

A | A -- B | write "./test/output/output11.csv";