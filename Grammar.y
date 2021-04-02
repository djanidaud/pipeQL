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

%left '++' '--' '|'
%left x

%left '('
%right ')'

%left '+' '-' '=' 
%right '/' '*' '%'

%nonassoc '!=' '==' '>=' '<=' '>' '<'
%left '&&' '||'  
%right '!' 
    
%%     
Prog : {[]}
     | Expr ';' Prog {$1 : $3}      

Expr : csv var '=' Query    { Init $2 $4 }
     | csv var              { UnInit $2 }
     | Query                { Expression $1 }
     
Query : CsvExpr             { PipeEnd $1 }
      | Query '|' Query     { PipeLine $1 $3 }
      | '(' Query  ')'      {  $2 }

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
        
        | Query x Query                     { FullBinary (Cross $1 $3) }
        | Query '++' Query                  { FullBinary (Union $1 $3) }
        | Query '--' Query                  { FullBinary (Diff $1 $3) }

    

Cols : Col {[$1]}
     | Col ',' Cols {$1 : $3}

Col : dollar int    {Index $2}
    | word          {Filler $1}

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
parseError ((TokenCSV al):_)        = printError "a 'csv' declaration" al
parseError ((TokenImport al):_)     = printError "an 'import' statement" al
parseError ((TokenPrint al):_)      = printError "a 'print' statement" al
parseError ((TokenAsc al):_)        = printError "an 'asc' statement" al
parseError ((TokenDesc al):_)       = printError "a 'desc' statement" al
parseError ((TokenSelect al):_)     = printError "a 'select' statement" al
parseError ((TokenReform al):_)     = printError "a 'reform' statement" al
parseError ((TokenUpdate al):_)     = printError "an 'update' statement" al
parseError ((TokenWrite al):_)      = printError "a 'write' statement" al
parseError ((TokenArity al):_)      = printError "an 'arity' statement" al
parseError ((TokenIf al):_)         = printError "an 'if' statement" al
parseError ((TokenThen al):_)       = printError "a '->' notation" al
parseError ((TokenDollar al):_)     = printError "a '$' notation" al
parseError ((TokenInt al i):_)      = printError ("a number " ++ show i) al
parseError ((TokenAssignment al):_) = printError "an assignment '='" al
parseError ((TokenCross al):_)      = printError "a cartesian product 'x'" al
parseError ((TokenUnion al):_)      = printError "a union '++'" al
parseError ((TokenDiff al):_)       = printError "a diff '--'" al
parseError ((TokenLParen al):_)     = printError "a '('" al
parseError ((TokenRParen al):_)     = printError "a ')'" al
parseError ((TokenLSquare al):_)    = printError "a '['" al
parseError ((TokenRSquare al):_)    = printError "a ']'" al
parseError ((TokenAdd al):_)        = printError "an addition '+'" al
parseError ((TokenSubs al):_)       = printError "a substraction '-'" al
parseError ((TokenDiv al):_)        = printError "a division '/'" al
parseError ((TokenMul al):_)        = printError "a multiplication '*'" al
parseError ((TokenMod al):_)        = printError "a modulo operator '%'" al
parseError ((TokenAnd al):_)        = printError "an AND '&&'" al
parseError ((TokenOr al):_)         = printError "an OR '||'" al
parseError ((TokenNeg al):_)        = printError "a negation '!'" al
parseError ((TokenTrue al):_)       = printError "a 'true' statement" al
parseError ((TokenFalse al):_)      = printError "a 'false' statement" al
parseError ((TokenComma al):_)      = printError "a comma ','" al
parseError ((TokenDot al):_)        = printError "a dot '.'" al
parseError ((TokenPipe al):_)       = printError "a pipe '|'" al
parseError ((TokenEndLine al):_)    = printError "a semicolon ';" al
parseError ((TokenNotEq al):_)      = printError "a not-equal '!=' operator" al
parseError ((TokenEq al):_)         = printError "an equal '==' operator" al
parseError ((TokenLessEq al):_)     = printError "a less-or-equal '<=' operator" al
parseError ((TokenGreaterEq al):_)  = printError "a greater-or-equal '>=' operator" al
parseError ((TokenLess al):_)       = printError "a less '<' operator" al
parseError ((TokenGreater al):_)    = printError "a greater '>' operator" al
parseError ((TokenString al s):_)   = printError ("a string " ++ s) al
parseError ((TokenFileName al s):_) = printError ("a file name " ++ s) al
parseError ((TokenVar al s):_)      = printError ("a variable " ++ s) al

printError :: [Char] -> AlexPosn -> a
printError m (AlexPn _ line col) = error $ concat [ "Wasn't Expecting ", m, " (at: line ", show line, " , column ", show col, ")"]

-- A program is a sequence of terms. Terms are separated by ';'
-- data Prog = ProgEnd | Term Expr | Terms Expr Prog deriving Show
type Prog = [Expr]
               
data Expr = UnInit String     -- Uninitialised var declaration
          | Init String Query -- Initialised var declaration
          | Expression Query  -- A query
          deriving Show

data Query = PipeEnd CsvExpr       -- single statement, which returns a CSV 
           | PipeLine Query Query  -- sequence of pipes, separated by "|". Ends with a "PipeEnd"
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
             | FullBinary (Binary Query Query)
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