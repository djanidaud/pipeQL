//Test 2
csv A = import "./test/Test.csv";
A | select ($1 != "Andrewson") | write "./test/output5.csv";