import Tokens ( alexScanTokens )
import Grammar
import System.Environment ( getArgs )
import Control.Exception ( ErrorCall, catch )
import System.IO ( stderr, hPutStr )


import Data.List 
import Control.Monad
import Data.Maybe
import Data.List
import qualified Data.Map as Map

-- update 
-- binary
-- boolean expr

type CSV = IO [[String]];
type Environment = Map.Map String [[String]] 
type QueryState  =  (CSV, Environment, Query)  

main :: IO ()
main = catch main' noParse
       where
       noParse :: ErrorCall -> IO ()
       noParse = hPutStr stderr.show

main' :: IO ()
main' = do (fileName : _ ) <- getArgs 
           sourceText <- readFile fileName
           
           let parsedProg = parseCalc (alexScanTokens sourceText)
           evalProgLoop parsedProg Map.empty
           return ()


emptyCSV :: CSV
emptyCSV = pure []

                              
evalProgLoop :: Prog -> Environment -> IO ()
evalProgLoop [] _ = return () 
evalProgLoop (e:prog) env = do let (maybeVar, csv) = evalStatement e env
                               v <- csv
                               let env1 = addEntry maybeVar v env
                               evalProgLoop prog env1 


addEntry:: Maybe String -> [[String]] -> Environment -> Environment
addEntry Nothing _ env = env
addEntry (Just name) val env = Map.insert name val env
                               
                              
evalStatement:: Expr -> Environment -> (Maybe String, CSV)          
evalStatement (UnInit name) _        = (Just name, emptyCSV)
evalStatement (Init name query) env  = (Just name, evalQuery (emptyCSV, env, query))
evalStatement (Expression query) env = (Nothing, evalQuery (emptyCSV, env, query))     


evalQuery:: QueryState -> CSV                
evalQuery (csv, env, PipeEnd pipe) = evalQuery1 pipe csv env        
evalQuery (csv, env, PipeLine pipe query) = let csv1 = evalQuery (csv, env, pipe) in evalQuery (csv1, env, query) 
                                          
                                          
evalQuery1 :: CsvExpr -> CSV -> Environment -> CSV
evalQuery1 (VarName name) _ env     = getBinding name env
evalQuery1 (FullBinary b) _ env     = binaryEval b env
evalQuery1 Asc mxs _                = strictFilter sort mxs
evalQuery1 Desc mxs _               = strictFilter (sortBy (flip compare)) mxs
evalQuery1 Print mxs _              = strictPipe   (putStrLn.toString) mxs
evalQuery1 (Import name) _ _        = strictFilter (fmap (splitOn ',').lines) (readFile name)
evalQuery1 (Write name) mxs _       = strictPipe   (writeFile name.toString) mxs
evalQuery1 (Select conds) mxs _     = strictFilter (filter (conditions conds)) mxs
evalQuery1 (Update col1 col2) mxs _ = strictFilter (map (\x -> change x col1 col2)) mxs
evalQuery1 (Reform cols) mxs _      = strictFilter (reform cols) mxs
evalQuery1 (If conds query) mxs env   = do xs <- mxs
                                           let mapped = map (\x -> 
                                                  if(conditions conds x) then (evalQuery (pure [x], env, query)) else pure [x]
                                                  ) xs
                                           mm <- sequence mapped
                                           return $ map concat mm

                                           
                                        
             

getBinding:: String -> Environment -> CSV
getBinding varName env | isNothing entry = error "Undefined Variable"
                       | otherwise = return $!fromJust entry
                         where
                         entry :: Maybe [[String]]
                         entry = Map.lookup varName env


reform :: [Col] -> [[String]] -> [[String]]
reform cols = map (\entry -> map (getEntryValue entry) cols)



-- A strict pipe is a pipe which doesn't modify the input CSV, it only performs some side-effects.
-- It is 'strict' because it strictly evaluates the input csv before outputting it to the next pipe.
strictPipe :: Monad m => (b -> m a) -> m b -> m b
strictPipe f mxs = do xs <- mxs
                      f xs
                      return xs


-- A strict filter is a filter which modifies the input CSV.
-- It is 'strict' because it strictly evaluates and modifies the input csv before outputting it to the next pipe.
strictFilter :: (a1 -> r) -> IO a1 -> IO r
strictFilter f mxs = do xs <- mxs
                        return $! f xs


toString :: [[String]] -> String
toString = intercalate "\n".map (intercalate ",")                                


binaryEval :: Binary Query Query -> Environment -> CSV
binaryEval (Union eCSV1 eCSV2) env = liftM2 (++) (getCSV eCSV1 env) (getCSV eCSV2 env) 
binaryEval (Diff eCSV1 eCSV2) env = liftM2 (\\) (getCSV eCSV1 env) (getCSV eCSV2 env)
binaryEval (Inter eCSV1 eCSV2) env = let csv1 = getCSV eCSV1 env in liftM2 (\\) csv1 (liftM2 (\\) csv1 (getCSV eCSV2 env))         
binaryEval (Cross eCSV1 eCSV2) env = do c1 <- getCSV eCSV1 env
                                        c2 <- getCSV eCSV2 env
                                        return [x ++ y | x <- c1, y <- c2]


-- Helper functions
getCSV :: Query -> Environment -> CSV
getCSV a env = evalQuery (emptyCSV, env, a)


splitOn :: Char -> String -> [String]
splitOn _ [] = []
splitOn c ls = (takeWhile (/=c) ls) : splitOn' c (dropWhile (/=c) ls)
                where splitOn' _ [] = []
                      splitOn' c (x:[]) | x == c = [[]]
                      splitOn' c (x:xs) | x == c = splitOn c xs
                                        | otherwise = []


getArity :: [[String]] -> Int 
getArity = length.head


conditions :: Conds -> [String] -> Bool
conditions (Single cond) entry = codition cond entry 
conditions (Neg conds) entry = not $ conditions conds entry
conditions (And conds1 conds2) entry = conditions conds1 entry && conditions conds2 entry
conditions (Or conds1 conds2) entry = conditions conds1 entry || conditions conds2 entry


codition :: Cond -> [String] ->  Bool
codition (Boolean bool) _  = bool 
codition (ColCond col1 operation col2) entry = boolOperation operation (getEntryValue entry col1) (getEntryValue entry col2)
codition (NumCond a operation b) _ = boolOperation operation (mathCalc a) (mathCalc b)                                               


boolOperation :: Ord a => Operation -> a -> a -> Bool
boolOperation Equal = (==)
boolOperation NotEqual = (/=)
boolOperation Less = (<)
boolOperation Greater = (>)
boolOperation LessEqual = (<=)
boolOperation GreaterEqual = (>=)


mathOperation :: Integral a => MathOperation -> a -> a -> a
mathOperation Add = (+)
mathOperation Subs = (-)
mathOperation Mul = (*)
mathOperation Div = div
mathOperation Mod = mod


mathCalc :: MathExpr -> Int
mathCalc (Number n) = n
mathCalc (Calc mathExpr1 op mathExpr2) = mathOperation op (mathCalc mathExpr1) (mathCalc mathExpr2)
 

getEntryValue:: [String] -> Col -> String
getEntryValue entry (Index i) = entry !! mathCalc i
getEntryValue _ (Filler f) = f


change :: [String] -> Col -> Col -> [String]    
change [] _ _ = []
change vs (Index i) col2 = let num = mathCalc i in (take num vs) ++ [getEntryValue vs col2] ++ (drop (num + 1) vs)
change vs (Filler f) col2 = map (\v -> if (v == f) then getEntryValue vs col2 else v) vs