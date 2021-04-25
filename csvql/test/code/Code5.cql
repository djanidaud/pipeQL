//Test 2
csv A = import "./test/inputCSV/Test.csv";
A | select ($1 != "Andrewson") | write "./test/output/output5.csv";