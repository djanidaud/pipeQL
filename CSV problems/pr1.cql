// Problem I:
csv A = import "A.csv";
csv B = import "B.csv";

A ++ B | if ($0 == "1") -> update $0 "ddd";
       | print;
    
