import Tokens ( alexScanTokens )
import Grammar
import System.Environment 
import Control.Exception
import System.IO 
import Data.List 
import Control.Monad
import Data.Maybe
import Data.List
import qualified Data.Map as Map

type Entry = [String];
type CSV = IO [Entry];
data Variable = Value CSV | Procedure Query Environment
type Environment = Map.Map String Variable
type State = (CSV, Environment, Query)  


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
evalProgLoop (e:prog) env = do let (maybeVar, var) = evalStatement e env
                               var' <- strictlyEval var
                               let env1 = addEntry maybeVar var' env
                               evalProgLoop prog env1 
  

strictlyEval :: Variable -> IO Variable
strictlyEval (Value mxs) = do xs <- mxs; return $ Value $ return xs
strictlyEval p = return p   


addEntry:: Maybe String -> Variable -> Environment -> Environment
addEntry Nothing _ env = env
addEntry (Just name) val env = Map.insert name val env


evalStatement:: Expr -> Environment -> (Maybe String, Variable)          
evalStatement (UnInit name) _         = (Just name, Value emptyCSV)
evalStatement (Init name query) env   = (Just name, Value $ evalQuery (emptyCSV, env, query))
evalStatement (Method name query) env = (Just name, Procedure query env)
evalStatement (Expression query) env  = (Nothing, Value $ evalQuery (emptyCSV, env, query))     


evalQuery:: State -> CSV                
evalQuery (csv, env, PipeLine pipe query) = let csv1 = evalQuery (csv, env, pipe) in evalQuery (csv1, env, query) 
evalQuery (csv, env, PipeEnd pipe) = evalQuery1 pipe csv env                           
                    

evalQuery1 :: CsvExpr -> CSV -> Environment -> CSV
evalQuery1 Asc csv _                = strictFilter sort csv
evalQuery1 Desc csv _               = strictFilter (sortBy (flip compare)) csv
evalQuery1 Unique csv _             = strictFilter (map head . group . sort) csv
evalQuery1 (Import name) _  _       = strictFilter (fmap (splitOn ',').lines) (readFile name)
evalQuery1 (Select conds) csv _     = strictFilter (select conds) csv
evalQuery1 (Update col1 col2) csv _ = strictFilter (map (\x -> update x col1 col2)) csv
evalQuery1 (Reform cols) csv _      = strictFilter (reform cols) csv
evalQuery1 Print csv _              = strictPipe   (putStrLn.toString) csv
evalQuery1 (Write name) csv _       = strictPipe   (writeFile name.toString) csv
evalQuery1 (Note message) csv _     = strictPipe   (\_ -> putStrLn message) csv
evalQuery1 (Error message) csv _    = strictPipe   (\_ -> error message) csv
evalQuery1 (VarName name) csv env   = getBinding name env csv
evalQuery1 (FullBinary b) _ env     = binaryEval b env
evalQuery1 (If conds query) csv env = resolveIf conds (csv, env, query) 


isValue :: Variable -> Bool
isValue (Value _) = True
isValue _ = False


getBinding:: String -> Environment -> CSV -> CSV
getBinding varName env csv | isNothing entry = error $ varName ++ " is undefined!"
                           | isValue var = val
                           | otherwise = evalQuery (csv, env1, query)
                             where
                             entry = Map.lookup varName env
                             var = fromJust entry
                             (Value val) = var
                             (Procedure query env1) = var


resolveIf :: Conds -> State -> CSV
resolveIf conds (csv, env, query) = do xs <- csv
                                       let indexed = zip xs [0..]
                                       let mapped = map (\(x,i) -> 
                                                        if(conditions conds (x,i)) 
                                                        then liftM concat (evalQuery (pure [x], env, query)) 
                                                        else pure x 
                                                    ) indexed
                                       sequence mapped

reform :: [Col] -> [Entry] -> [Entry]
reform cols = map (\entry -> map (getEntryValue entry) cols)


select :: Conds -> [Entry] -> [Entry]
select conds xs = [fst x | x <- zip xs [0..], conditions conds x]


update :: Entry -> Col -> Col -> Entry 
update [] _ _ = []
update vs (Filler f) col2 = map (\v -> if (v == f) then getEntryValue vs col2 else v) vs
update vs (Index i) col2 = beginning ++ [getEntryValue vs col2] ++ end
                           where
                           num = mathCalc i vs :: Int 
                           beginning = take num vs
                           end = drop (num + 1) vs
         

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


toString :: [Entry] -> String
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


getArity :: [Entry] -> Int 
getArity = length.head


conditions :: Conds -> (Entry, Int) -> Bool
conditions (Single cond) entry = condition cond entry
conditions (Neg conds) entry = not $ conditions conds entry
conditions (And conds1 conds2) entry = conditions conds1 entry && conditions conds2 entry
conditions (Or conds1 conds2) entry = conditions conds1 entry || conditions conds2 entry


condition :: Cond -> (Entry, Int) -> Bool
condition (Boolean bool) _ = bool 
condition (IdCond op expr) (entry, id) = boolOperation op id (mathCalc expr entry) 
condition (ColCond col1 op col2) (entry, _) = boolOperation op (getEntryValue entry col1) (getEntryValue entry col2)
condition (NumCond a op b) (entry, _) = boolOperation op (mathCalc a entry) (mathCalc b entry)                                               


mathCalc :: MathExpr -> Entry -> Int
mathCalc ContextArity csv = length csv
mathCalc (Number n) _ = n
mathCalc (Calc mathExpr1 op mathExpr2) csv = mathOperation op (mathCalc mathExpr1 csv) (mathCalc mathExpr2 csv)


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


getEntryValue:: Entry -> Col -> String
getEntryValue entry (Index i) = entry !! mathCalc i entry
getEntryValue _ (Filler f) = f