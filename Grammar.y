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
  '>='          { TokenLessEq _ }
  '<='          { TokenMoreEq _ }
  '<'           { TokenLess _ }
  '>'           { TokenMore _ }
  
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
          | '>'  {More}
          | '>=' {LessEqual}
          | '<=' {MoreEqual}

{     
parseError :: [Token] -> a
parseError [] = error "Unknown Parse Error" 
parseError (t:ts) = error ("Parse error at line:column " ++ (tokenPosn t))

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
data Operation = Equal | NotEqual | Less | More | LessEqual | MoreEqual deriving Show

data MathOperation = Add | Subs | Mul | Div | Mod deriving Show
data MathExpr = Arity Query | Number Int | Calc MathExpr MathOperation MathExpr deriving Show
} 