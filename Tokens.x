{
module Tokens where
}

%wrapper "posn"

-- Macros
$digit = 0-9
$alpha = [a-zA-Z]
$fileName = [A-Z]

tokens :-
  $white+       ;
  "//".*        ;   

  csv           { \pos s -> TokenCSV pos } 
  import        { \pos s -> TokenImport pos }
  
  print         { \pos s -> TokenPrint pos }
  asc           { \pos s -> TokenAsc pos }
  desc          { \pos s -> TokenDesc pos }
  select        { \pos s -> TokenSelect pos }
  reform        { \pos s -> TokenReform pos }
  update        { \pos s -> TokenUpdate pos }
  write         { \pos s -> TokenWrite pos }
  arity         { \pos s -> TokenArity pos }
  if            { \pos s -> TokenIf pos }
  "->"          { \pos s -> TokenThen pos }            
  
  \$            { \pos s -> TokenDollar pos }   
  [$digit]+     { \pos s -> TokenInt pos (read s) }
  
  \=            { \pos s -> TokenAssignment pos }
  
  \x            { \pos s -> TokenCross pos }
  "++"          { \pos s -> TokenUnion pos }
  "--"          { \pos s -> TokenDiff pos }

  \(            { \pos s -> TokenLParen pos }
  \)            { \pos s -> TokenRParen pos}
  \[            { \pos s -> TokenLSquare pos }
  \]            { \pos s -> TokenRSquare pos }
  
  \+            { \pos s -> TokenAdd pos }
  \-            { \pos s -> TokenSubs pos }
  \/            { \pos s -> TokenDiv pos }
  \*            { \pos s -> TokenMul pos }
  \%            { \pos s -> TokenMod pos }
  
  "&&"          { \pos s -> TokenAnd pos }
  "||"          { \pos s -> TokenOr pos }
  \!            { \pos s -> TokenNeg pos}
  true          { \pos s -> TokenTrue pos}
  false         { \pos s -> TokenFalse pos}
  
  \,            { \pos s -> TokenComma pos }
  \.            { \pos s -> TokenDot pos }
  \|            { \pos s -> TokenPipe pos }
  \;            { \pos s -> TokenEndLine pos }

  "!="          { \pos s -> TokenNotEq pos }
  "=="          { \pos s -> TokenEq pos }
  ">="          { \pos s -> TokenLessEq pos }
  "<="          { \pos s -> TokenMoreEq pos }
  \<            { \pos s -> TokenLess pos }
  \>            { \pos s -> TokenMore pos }
  
  \"[$alpha $digit \_ \’]*\"         { \pos s -> TokenString pos s}
  $alpha [$alpha $digit \_ \’]*.csv  { \pos s -> TokenFileName pos s}
  $alpha [$alpha $digit \_ \’]*      { \pos s -> TokenVar pos s}
  

{
-- Each action has type :: String -> Token 
-- The token type: 
data Token = 
  TokenCSV AlexPosn             | 
  TokenImport AlexPosn          |
  TokenPrint AlexPosn           |
  TokenAsc AlexPosn             |
  TokenDesc AlexPosn            |
  TokenSelect AlexPosn          |
  TokenReform AlexPosn          |
  TokenUpdate AlexPosn          |
  TokenWrite AlexPosn           |
  TokenArity AlexPosn           |
  TokenIf AlexPosn              |
  TokenThen AlexPosn            |
  TokenDollar AlexPosn          |
  TokenInt AlexPosn Int         |
  TokenAssignment AlexPosn      | 
  TokenCross AlexPosn           |
  TokenUnion AlexPosn           |
  TokenDiff AlexPosn            |
  TokenLParen AlexPosn          |
  TokenRParen AlexPosn          |
  TokenLSquare AlexPosn         |
  TokenRSquare AlexPosn         |
  TokenAdd AlexPosn             |
  TokenSubs AlexPosn            |
  TokenDiv AlexPosn             |
  TokenMul AlexPosn             |
  TokenMod AlexPosn             |
  TokenAnd AlexPosn             |
  TokenOr AlexPosn              |
  TokenNeg AlexPosn             |
  TokenTrue AlexPosn            |
  TokenFalse AlexPosn           |
  TokenComma AlexPosn           |
  TokenDot AlexPosn             |
  TokenPipe AlexPosn            |    
  TokenEndLine AlexPosn         |
  TokenNotEq AlexPosn           |
  TokenEq AlexPosn              |
  TokenLessEq AlexPosn          |
  TokenMoreEq AlexPosn          |
  TokenLess AlexPosn            |
  TokenMore AlexPosn            |
  TokenString AlexPosn String   |      
  TokenFileName AlexPosn String | 
  TokenVar AlexPosn String
  deriving (Eq,Show) 


tokenPosn :: Token -> String
tokenPosn (TokenCSV al) = "1" ++ printAlexPosn al
tokenPosn (TokenImport al) ="2" ++  printAlexPosn al
tokenPosn (TokenPrint al) ="3" ++  printAlexPosn al
tokenPosn (TokenAsc al) ="4" ++  printAlexPosn al
tokenPosn (TokenDesc al) ="5" ++  printAlexPosn al
tokenPosn (TokenSelect al) ="6" ++  printAlexPosn al
tokenPosn (TokenReform al) = "7" ++ printAlexPosn al
tokenPosn (TokenUpdate al) = "8" ++ printAlexPosn al
tokenPosn (TokenWrite al) ="9" ++  printAlexPosn al
tokenPosn (TokenArity al) ="10" ++  printAlexPosn al
tokenPosn (TokenIf al) = "11" ++ printAlexPosn al
tokenPosn (TokenThen al) ="12" ++  printAlexPosn al
tokenPosn (TokenDollar al) ="13" ++  printAlexPosn al
tokenPosn (TokenInt al i) ="14 " ++ printAlexPosn al
tokenPosn (TokenAssignment al) ="15" ++  printAlexPosn al
tokenPosn (TokenCross al) ="16" ++  printAlexPosn al
tokenPosn (TokenUnion al) ="17" ++  printAlexPosn al
tokenPosn (TokenDiff al) ="18" ++  printAlexPosn al
tokenPosn (TokenLParen al) ="19" ++  printAlexPosn al
tokenPosn (TokenRParen al) ="20" ++  printAlexPosn al
tokenPosn (TokenLSquare al) ="21" ++  printAlexPosn al
tokenPosn (TokenRSquare al) ="22" ++  printAlexPosn al
tokenPosn (TokenAdd al) = "23" ++ printAlexPosn al
tokenPosn (TokenSubs al) ="24" ++  printAlexPosn al
tokenPosn (TokenDiv al) ="25" ++  printAlexPosn al
tokenPosn (TokenMul al) ="26"++ printAlexPosn al
tokenPosn (TokenMod al) ="27"++ printAlexPosn al
tokenPosn (TokenAnd al) ="28"++ printAlexPosn al
tokenPosn (TokenOr al) ="29"++ printAlexPosn al
tokenPosn (TokenNeg al) ="30"++ printAlexPosn al
tokenPosn (TokenTrue al) ="90"++ printAlexPosn al
tokenPosn (TokenFalse al) ="31"++ printAlexPosn al
tokenPosn (TokenComma al) ="32"++ printAlexPosn al
tokenPosn (TokenDot al) ="33"++ printAlexPosn al
tokenPosn (TokenPipe al) ="34"++ printAlexPosn al
tokenPosn (TokenEndLine al) ="35"++ printAlexPosn al
tokenPosn (TokenNotEq al) ="36"++ printAlexPosn al
tokenPosn (TokenEq al) = "37"++printAlexPosn al
tokenPosn (TokenLessEq al) ="38"++ printAlexPosn al
tokenPosn (TokenMoreEq al) ="39"++ printAlexPosn al
tokenPosn (TokenLess al) ="40"++ printAlexPosn al
tokenPosn (TokenMore al) ="41"++ printAlexPosn al
tokenPosn (TokenString al s) ="42"++ printAlexPosn al
tokenPosn (TokenFileName al s) ="43"++ printAlexPosn al
tokenPosn (TokenVar al s) ="44"++ printAlexPosn al
  

printAlexPosn (AlexPn a l c) = show(l) ++ ":" ++ show(c);
}


