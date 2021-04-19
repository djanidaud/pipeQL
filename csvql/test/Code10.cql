//Test 2
csv A = import "./test/Test.csv";
csv B = import "./test/Test.csv";
A | A x B | write "./test/output.csv";