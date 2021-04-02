-- Problem III:
csv P = import P.csv;
csv Q = import q.csv;

P x Q | select [$1 == $5] 
      | if [$2 == ""] -> update $2 $6;
      | if [$3 == ""] -> update $3 $7;
      | if [$4 == ""] -> update $4 $8;
      | reform [$1, $2, $3, $4]
      | asc 
      | print;