// Problem III:
csv P = import "./test/inputCSV/Test3_1P.csv";
csv Q = import "./test/inputCSV/Test3_1Q.csv";

P x Q | select ($0 == $4) 
      | if ($1 == "") -> update $1 $5;
      | if ($2 == "") -> update $2 $6;
      | if ($3 == "") -> update $3 $7;
      | reform [$0, $1, $2, $3]
      | asc 
      | write "./test/output/output19.csv";
