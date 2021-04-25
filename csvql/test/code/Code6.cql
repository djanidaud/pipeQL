//Test 2
csv A = import "./test/inputCSV/Test.csv";
A | update $1 $0  | write "./test/output/output6.csv";