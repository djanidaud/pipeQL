module PipeTypes (isTypeSafe) where 
import Grammar

data PipeType = TyCSV | TyCol | TyBool | TyInt | TyString | TyVoid deriving Eq
type TypeEnvironment = [(String, PipeType)]


getBinding :: String -> TypeEnvironment -> PipeType
getBinding _ [] = error "Variable binding not found"
getBinding x ((y,t):tenv) | x == y = t
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
                                         where 
                                         t1 = typeOfQuery pipe tenv
                                         t2 = typeOfQuery query tenv

typeOfCSVExpr:: CsvExpr -> TypeEnvironment -> PipeType
typeOfCSVExpr (Reform cols) env | True  = TyCSV
                                  where 
                                  --areColsWellTyped = all (\c -> typeOfCol c env == TyCol) cols

typeOfCSVExpr (Update col1 col2) env | t1 == t2 && t1 == TyCol = TyCSV
                                       where 
                                       (t1, t2) = (typeOfCol col1 env, typeOfCol col2 env)

typeOfCSVExpr (Select conds) env | t1 == TyBool = TyCSV
                                   where
                                   t1 = typeOfConds conds env
                               
typeOfCSVExpr (If conds query) env | t1 == TyBool = typeOfQuery query env
                                     where
                                     t1 = typeOfConds conds env

typeOfCSVExpr (FullBinary binary) env = typeOfBinary binary env
typeOfCSVExpr (VarName name) env | TyCSV == getBinding name env = TyCSV
typeOfCSVExpr _ _ = TyCSV


typeOfBinary :: Binary Query Query -> TypeEnvironment -> PipeType
typeOfBinary (Cross a b) env | t1 == t2 && t1 == TyCSV = t1
                               where
                               (t1,t2) = (typeOfQuery a env,typeOfQuery b env )

typeOfBinary (Union a b) env  | t1 == t2 && t1 == TyCSV = t1
                               where
                               (t1,t2) = (typeOfQuery a env,typeOfQuery b env )

typeOfBinary (Diff a b) env  | t1 == t2 && t1 == TyCSV = t1
                               where
                               (t1,t2) = (typeOfQuery a env,typeOfQuery b env )

typeOfBinary (Inter a b) env | t1 == t2 && t1 == TyCSV = t1
                               where
                               (t1,t2) = (typeOfQuery a env,typeOfQuery b env )

typeOfCol:: Col -> TypeEnvironment -> PipeType
typeOfCol (Index _) _ = TyCol
typeOfCol (Filler _) _ = TyCol

typeOfCond:: Cond -> TypeEnvironment -> PipeType 
typeOfCond (Boolean _) _ = TyBool 
typeOfCond (ColCond col1 _ col2) env | t1 == t2 && t1 == TyCol = TyBool 
                                        where
                                        (t1, t2) = (typeOfCol col1 env, typeOfCol col2 env)
                                        
typeOfCond (NumCond mathExpr1 _ mathExpr2) env | t1 == t2 && t1 == TyInt = TyBool 
                                                 where
                                                 (t1, t2) = (typeOfMath mathExpr1 env, typeOfMath mathExpr2 env)

typeOfCond (IdCond _ mathExpr) env | t1 == TyInt = TyBool 
                                     where
                                     t1 = typeOfMath mathExpr env


typeOfConds :: Conds -> TypeEnvironment -> PipeType 
typeOfConds (Single cond) env = typeOfCond cond env
typeOfConds (Neg conds) env = typeOfConds conds env
typeOfConds (And conds1 conds2) env | t1 == t2 && t1 == TyBool = TyBool 
                                      where
                                      (t1, t2) = (typeOfConds conds1 env, typeOfConds conds2 env)
                                 
typeOfConds (Or conds1 conds2) env | t1 == t2 && t1 == TyBool = TyBool 
                                     where
                                     (t1, t2) = (typeOfConds conds1 env, typeOfConds conds2 env)


typeOfMath:: MathExpr -> TypeEnvironment -> PipeType 
typeOfMath ContextArity _ = TyInt
typeOfMath (Number _) _ = TyInt
typeOfMath (Calc mathExpr1 _ mathExpr2) env | t1 == t2 && t1 == TyInt = t1
                                              where
                                              (t1, t2) = (typeOfMath mathExpr1 env, typeOfMath mathExpr2 env)
