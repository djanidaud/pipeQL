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
  \)            { \pos s -> TokenRParen pos }
  \[            { \pos s -> TokenLSquare pos }
  \]            { \pos s -> TokenRSquare pos }
  
  \+            { \pos s -> TokenAdd pos }
  \-            { \pos s -> TokenSubs pos }
  \/            { \pos s -> TokenDiv pos }
  \*            { \pos s -> TokenMul pos }
  \%            { \pos s -> TokenMod pos }
  
  "&&"          { \pos s -> TokenAnd pos }
  "||"          { \pos s -> TokenOr pos }
  \!            { \pos s -> TokenNeg pos }
  true          { \pos s -> TokenTrue pos }
  false         { \pos s -> TokenFalse pos }
  
  \,            { \pos s -> TokenComma pos }
  \.            { \pos s -> TokenDot pos }
  \|            { \pos s -> TokenPipe pos }
  \;            { \pos s -> TokenEndLine pos }

  "!="          { \pos s -> TokenNotEq pos }
  "=="          { \pos s -> TokenEq pos }
  ">="          { \pos s -> TokenGreaterEq pos }
  "<="          { \pos s -> TokenLessEq pos }
  \<            { \pos s -> TokenLess pos }
  \>            { \pos s -> TokenGreater pos }
  
  \"[$alpha $digit \_ \’]*\"         { \pos s -> TokenString pos s }
  $alpha [$alpha $digit \_ \’]*.csv  { \pos s -> TokenFileName pos s }
  $alpha [$alpha $digit \_ \’]*      { \pos s -> TokenVar pos s }
  

{
-- Each action has type ::AlexPosn -> String -> Token 
-- The token type: 
data Token = TokenCSV AlexPosn
           | TokenImport AlexPosn
           | TokenPrint AlexPosn
           | TokenAsc AlexPosn  
           | TokenDesc AlexPosn
           | TokenSelect AlexPosn
           | TokenReform AlexPosn 
           | TokenUpdate AlexPosn 
           | TokenWrite AlexPosn 
           | TokenArity AlexPosn  
           | TokenIf AlexPosn 
           | TokenThen AlexPosn 
           | TokenDollar AlexPosn 
           | TokenInt AlexPosn Int
           | TokenAssignment AlexPosn
           | TokenCross AlexPosn
           | TokenUnion AlexPosn
           | TokenDiff AlexPosn
           | TokenLParen AlexPosn    
           | TokenRParen AlexPosn
           | TokenLSquare AlexPosn
           | TokenRSquare AlexPosn
           | TokenAdd AlexPosn
           | TokenSubs AlexPosn 
           | TokenDiv AlexPosn
           | TokenMul AlexPosn
           | TokenMod AlexPosn 
           | TokenAnd AlexPosn
           | TokenOr AlexPosn 
           | TokenNeg AlexPosn 
           | TokenTrue AlexPosn
           | TokenFalse AlexPosn
           | TokenComma AlexPosn
           | TokenDot AlexPosn
           | TokenPipe AlexPosn 
           | TokenEndLine AlexPosn 
           | TokenNotEq AlexPosn
           | TokenEq AlexPosn 
           | TokenLessEq AlexPosn 
           | TokenGreaterEq AlexPosn
           | TokenLess AlexPosn 
           | TokenGreater AlexPosn
           | TokenString AlexPosn String
           | TokenFileName AlexPosn String 
           | TokenVar AlexPosn String
           deriving (Eq,Show) 
}


