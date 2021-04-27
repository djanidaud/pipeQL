// Problem IV:
import "A.csv" | select ($1 != "") 
               | asc 
               | print;