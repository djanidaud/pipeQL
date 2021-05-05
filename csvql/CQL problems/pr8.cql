// Problem VIII:
csv P = import "P.csv";
csv Q = import "Q.csv";

P x Q | select ($3 == $7) 
      | if ($4 != "") -> update $0 $4;
      | if ($5 != "") -> update $1 $5;
      | if ($6 != "") -> update $2 $6;
      | reform [$0, $1, $2, $7]
      | asc
      | print;