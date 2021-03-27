{ 
module Grammar where 
import Tokens 
}

%name parseCalc 
%tokentype { Token } 
%error { parseError }


    
%token
  csv           { TokenCSV _ } 
  import        { TokenImport _ }
  
  print         { TokenPrint _ }
  asc           { TokenAsc _ }
  desc          { TokenDesc _ }
  select        { TokenSelect _ }
  reform        { TokenReform _ }
  update        { TokenUpdate _ }
  write         { TokenWrite _ }
  arity         { TokenArity _ }
  if            { TokenIf _ }
  '->'          { TokenThen _ }            
  
  dollar        { TokenDollar _ }    
  int           { TokenInt _ $$ }    
  
  x             { TokenCross _ }
  '++'          { TokenUnion _ }
  '--'          { TokenDiff _ }

  '('           { TokenLParen _ }
  ')'           { TokenRParen _ }
  '['           { TokenLSquare _ }
  ']'           { TokenRSquare _ }
  
  '+'           { TokenAdd _ }
  '-'           { TokenSubs _ }
  '/'           { TokenDiv _ }
  '*'           { TokenMul _ }
  '%'           { TokenMod _ }
  
  '&&'          { TokenAnd _ }
  '||'          { TokenOr _ } 
  '!'           { TokenNeg _ }
  true          { TokenTrue _ }
  false         { TokenFalse _ }

  ','           { TokenComma _ }
  '|'           { TokenPipe _ }
  ';'           { TokenEndLine _ }

  '!='          { TokenNotEq _ }
  '=='          { TokenEq _ }
  '>='          { TokenGreaterEq _ }
  '<='          { TokenLessEq _ }
  '<'           { TokenLess _ }
  '>'           { TokenGreater _ }
  
  '='           { TokenAssignment _ }
  
  word          { TokenString _ $$ }
  fileName      { TokenFileName _ $$ }
  var           { TokenVar _ $$ }


%left '+' '-' '='
%right '/' '*' '%'
%left '++' '--' 
%right x
%nonassoc '!=' '==' '>=' '<=' '>' '<'
%left '&&' '||'  
%right '!' 
    
%%     
Prog : Expr ';'             { Term $1 } 
     | Expr ';' Prog        { Terms $1 $3 } 

Expr : csv var '=' Query    { Init $2 $4 }
     | csv var              { UnInit $2 }
     | Query                { Expression $1 }
    
Query : CsvExpr             { PipeEnd $1 }
      | CsvExpr '|' Query   { PipeLine $1 $3 }
      | '(' Query ')'       { $2 }
     
CsvExpr : import fileName                   { Import $2 }
        | asc                               { Asc }
        | desc                              { Desc }
        | reform '[' Cols ']'               { Reform $3 }  
        | print                             { Print }
        | select '(' Conds ')'              { Select $3 }
        | update Col Col                    { Update $2 $3 }
        | var                               { VarName $1 }
        | write word                        { Write $2 }
        | if '(' Conds ')' '->' Query ';'   { If $3 $6 } 
        | CsvExpr x CsvExpr                 { FullBinary (Cross $1 $3) }
        | CsvExpr '++' CsvExpr              { FullBinary (Union $1 $3) }
        | CsvExpr '--' CsvExpr              { FullBinary (Diff $1 $3) }
        

Cols : Col {[$1]}
     | Col ',' Cols {$1 : $3}

Col : dollar int    {Index $2}
    | word   {Filler $1}

Conds : Cond             { Single $1 }
      | '!' Conds        { Neg $2 }
      | Conds '&&' Conds { And $1 $3 }
      | Conds '||' Conds { Or $1 $3 }
      | '(' Conds ')'    { $2 }

Cond : Col Operation Col {ColCond $1 $2 $3}
     | MathExpr Operation MathExpr {NumCond $1 $2 $3}
     | true   {Boolean True}
     | false  {Boolean False}
    
MathExpr : arity Query {Arity $2}
         | int {Number $1}
         | MathExpr '+' MathExpr {Calc $1 Add $3}
         | MathExpr '-' MathExpr {Calc $1 Subs $3}
         | MathExpr '/' MathExpr {Calc $1 Div $3}
         | MathExpr '*' MathExpr {Calc $1 Mul $3}
         | MathExpr '%' MathExpr {Calc $1 Mod $3}
         | '(' MathExpr ')' { $2 }
         

Operation : '==' {Equal}
          | '!=' {NotEqual}
          | '<'  {Less}
          | '>'  {Greater}
          | '>=' {GreaterEqual}
          | '<=' {LessEqual}

{     
parseError :: [Token] -> a
parseError [] = error "Unknown Parse Error" 
parseError ((TokenCSV al):_)        = printError "" al
parseError ((TokenImport al):_)     = printError "" al
parseError ((TokenPrint al):_)      = printError "" al
parseError ((TokenAsc al):_)        = printError "" al
parseError ((TokenDesc al):_)       = printError "" al
parseError ((TokenSelect al):_)     = printError "" al
parseError ((TokenReform al):_)     = printError "" al
parseError ((TokenUpdate al):_)     = printError "" al
parseError ((TokenWrite al):_)      = printError "" al
parseError ((TokenArity al):_)      = printError "" al
parseError ((TokenIf al):_)         = printError "" al
parseError ((TokenThen al):_)       = printError "" al
parseError ((TokenDollar al):_)     = printError "" al
parseError ((TokenInt al i):_)      = printError "" al
parseError ((TokenAssignment al):_) = printError "" al
parseError ((TokenCross al):_)      = printError "" al
parseError ((TokenUnion al):_)      = printError "" al
parseError ((TokenDiff al):_)       = printError "" al
parseError ((TokenLParen al):_)     = printError "" al
parseError ((TokenRParen al):_)     = printError "" al
parseError ((TokenLSquare al):_)    = printError "" al
parseError ((TokenRSquare al):_)    = printError "" al
parseError ((TokenAdd al):_)        = printError "" al
parseError ((TokenSubs al):_)       = printError "" al
parseError ((TokenDiv al):_)        = printError "" al
parseError ((TokenMul al):_)        = printError "" al
parseError ((TokenMod al):_)        = printError "" al
parseError ((TokenAnd al):_)        = printError "" al
parseError ((TokenOr al):_)         = printError "" al
parseError ((TokenNeg al):_)        = printError "" al
parseError ((TokenTrue al):_)       = printError "" al
parseError ((TokenFalse al):_)      = printError "" al
parseError ((TokenComma al):_)      = printError "" al
parseError ((TokenDot al):_)        = printError "" al
parseError ((TokenPipe al):_)       = printError "" al
parseError ((TokenEndLine al):_)    = printError "" al
parseError ((TokenNotEq al):_)      = printError "" al
parseError ((TokenEq al):_)         = printError "" al
parseError ((TokenLessEq al):_)     = printError "" al
parseError ((TokenGreaterEq al):_)  = printError "" al
parseError ((TokenLess al):_)       = printError "" al
parseError ((TokenGreater al):_)    = printError "" al
parseError ((TokenString al s):_)   = printError "" al
parseError ((TokenFileName al s):_) = printError "" al
parseError ((TokenVar al s):_)      = printError "" al
  
printError :: [Char] -> AlexPosn -> a
printError m (AlexPn _ l c) = error $ m ++ show(l) ++ ":" ++ show(c)

-- A program is a sequence of terms. Terms are separated by ';'
data Prog = Term Expr | Terms Expr Prog deriving Show
               
data Expr = UnInit String     -- Uninitialised var declaration
          | Init String Query -- Initialised var declaration
          | Expression Query  -- A query
          deriving Show

data Query = PipeEnd CsvExpr       -- single statement, which returns a CSV 
           | PipeLine CsvExpr Query -- sequence of pipes, separated by "|". Ends with a "PipeEnd"
           deriving Show

-- A CSV Expr is an expression which takes a CSV as input (if any) and returns a new CSV
data CsvExpr = Import String 
             | Asc 
             | Desc 
             | Reform Cols 
             | Print 
             | Select Conds 
             | Update Col Col 
             | VarName String 
             | Write String  
             | If Conds Query 
             | FullBinary (Binary CsvExpr CsvExpr)
             deriving Show


-- Binary operations between two CSVs
data Binary a b = Cross a b  -- Cartessian (Cross) Product
                | Diff a b   -- Difference
                | Union a b  -- Union
                | Inter a b  -- Intersection
                deriving Show


data Col = Index Int | Filler String deriving Show
type Cols = [Col]

data Conds = Single Cond | Neg Conds | And Conds Conds | Or Conds Conds deriving Show
data Cond = ColCond Col Operation Col  | NumCond MathExpr Operation MathExpr | Boolean Bool  deriving Show
data Operation = Equal | NotEqual | Less | Greater | LessEqual | GreaterEqual deriving Show

data MathOperation = Add | Subs | Mul | Div | Mod deriving Show
data MathExpr = Arity Query | Number Int | Calc MathExpr MathOperation MathExpr deriving Show
} 