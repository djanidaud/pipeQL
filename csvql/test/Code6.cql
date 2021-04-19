//Test 2
csv A = import "./test/Test.csv";
A | update $1 $0  | write "./test/output6.csv";