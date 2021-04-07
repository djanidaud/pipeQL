module PipeTypes (isTypeSafe) where 
import Grammar

data PipeType = TyCSV | TyInt | TyString | TyVoid deriving Eq
type TypeEnvironment = [(String, PipeType)]


getBinding :: String -> TypeEnvironment -> PipeType
getBinding _ [] = error "Variable binding not found"
getBinding x ((y,t):tenv) | x == y  = t
                          | otherwise = getBinding x tenv


addBinding :: String -> PipeType -> TypeEnvironment -> TypeEnvironment
addBinding x t tenv = (x,t):tenv

isTypeSafe :: Prog -> TypeEnvironment -> Bool
isTypeSafe [] _ = True
isTypeSafe ((UnInit name): xs) tenv = isTypeSafe xs (addBinding name TyCSV tenv) 
isTypeSafe ((Expression query): xs) tenv = typeOfQuery query tenv == TyCSV && isTypeSafe xs tenv
isTypeSafe ((Init name d): xs) tenv = t1 == TyCSV && isTypeSafe xs (addBinding name t1 tenv) 
                                      where t1 = typeOfQuery d tenv
isTypeSafe ((Method name query): xs) tenv = t1 == TyCSV && isTypeSafe xs (addBinding name t1 tenv) 
                                            where t1 = typeOfQuery query tenv 

                                   
typeOfQuery:: Query -> TypeEnvironment -> PipeType
typeOfQuery (PipeEnd csvExpr) tenv | t1 == TyCSV = t1
                                   where t1 = typeOfCSVExpr csvExpr tenv

       
typeOfQuery (PipeLine pipe query) tenv | t1 == TyCSV && t2 == TyCSV = TyCSV
                                     where t1 = typeOfQuery pipe tenv
                                           t2 = typeOfQuery query tenv




typeOfCSVExpr:: CsvExpr -> TypeEnvironment -> PipeType
typeOfCSVExpr (Reform cols) env = TyCSV
                                  where colsType = map (\c -> typeOfCol c env) cols

typeOfCSVExpr (Update col1 col2) env = TyCSV
                                       where (t1, t2) = (typeOfCol col1 env, typeOfCol col2 env)

typeOfCSVExpr (Select conds) _ = TyCSV
typeOfCSVExpr (If conds query) _ = TyCSV
typeOfCSVExpr (FullBinary binary) _ = TyCSV
typeOfCSVExpr (VarName name) env | TyCSV == getBinding name env = TyCSV
typeOfCSVExpr _ _ = TyCSV


typeOfCol:: Col -> TypeEnvironment -> PipeType
typeOfCol (Index _) _ = TyInt
typeOfCol (Filler _) _ = TyString


-- -- Binary operations between two CSVs
-- data Binary a b = Cross a b  -- Cartessian (Cross) Product
--                 | Diff a b   -- Difference
--                 | Union a b  -- Union
--                 | Inter a b  -- Intersection
--                 deriving Show
-- data Col = Index MathExpr | Filler String deriving Show
-- type Cols = [Col]
-- data Conds = Single Cond | Neg Conds | And Conds Conds | Or Conds Conds deriving Show
-- data Cond = ColCond Col Operation Col  | NumCond MathExpr Operation MathExpr | IdCond Operation MathExpr | Boolean Bool  deriving Show
-- data Operation = Equal | NotEqual | Less | Greater | LessEqual | GreaterEqual deriving Show

-- data MathOperation = Add | Subs | Mul | Div | Mod deriving Show
-- data MathExpr = ContextArity | Arity Query | Number Int | Calc MathExpr MathOperation MathExpr deriving Show




-- typeOf tenv (TmInt _ )  = TyInt

-- typeOf tenv (TmTrue ) = TyBool

-- typeOf tenv (TmFalse ) = TyBool

-- typeOf tenv (TmUnit ) = TyUnit

-- typeOf tenv (TmCompare e1 e2) = TyBool
--   where (TyInt,TyInt) = (typeOf tenv e1, typeOf tenv e2)

-- typeOf tenv (TmPair e1 e2) = TyPair t1 t2 
--   where (t1,t2) = (typeOf tenv e1, typeOf tenv e2) 

-- typeOf tenv (TmFst e1) = t1 
--   where (TyPair t1 t2) = typeOf tenv e1

-- typeOf tenv (TmSnd e2) = t2
--   where (TyPair t1 t2) = typeOf tenv e2

-- typeOf tenv (TmAdd e1 e2) = TyInt 
--   where (TyInt,TyInt) = (typeOf tenv e1, typeOf tenv e2)

-- typeOf tenv (TmVar x) = getBinding x tenv

-- typeOf tenv (TmIf e1 e2 e3) | t2 == t3 = t2
--   where (TyBool,t2,t3) = (typeOf tenv e1, typeOf tenv e2, typeOf tenv e3)

-- typeOf tenv (TmLambda x t e) = TyFun t u 
--   where u = typeOf (addBinding x t tenv) e

-- typeOf tenv (TmApp e1 e2) | t1 == t3 = t2
--   where ((TyFun t1 t2),t3) = (typeOf tenv e1, typeOf tenv e2)

-- typeOf tenv (TmLet x t e1 e2) | t == t1 = typeOf (addBinding x t tenv) e2
--   where t1 = typeOf tenv e1

