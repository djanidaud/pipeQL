module Eval where
import Tokens ( alexScanTokens )
import Grammar
import PipeTypes
import System.Environment 
import Control.Exception
import System.IO 
import Data.List 
import Control.Monad
import Data.Maybe ( isNothing, fromJust )
import Data.List
import System.Directory

import qualified Data.Map as Map

type Entry = [String]
type CSV = IO [Entry]
data Variable = Value CSV | Procedure Query Environment
type Environment = Map.Map String Variable
type State = (CSV, Environment, Query)  


main :: IO ()
main = catch main' noParse
       where
       noParse :: ErrorCall -> IO ()
       noParse = hPutStr stderr.show


main' :: IO ()
main' = do (fileName : _) <- getArgs 
           sourceText <- readFile fileName
           
           let parsedProg = parseCalc (alexScanTokens sourceText)
           let f = isTypeSafe parsedProg [] 
           if (f == False) then error "Type Error" else evalProgLoop parsedProg Map.empty
           return ()


emptyCSV :: CSV
emptyCSV = pure []


-- Evaluates the program, one Query at a time. Each Query is evaluated one Pipe at a time
evalProgLoop :: Prog -> Environment -> IO ()
evalProgLoop [] _ = return () 
evalProgLoop (e:prog) env = do let (maybeVar, var) = evalStatement e env
                               var' <- strictlyEval var
                               let env1 = addEntry maybeVar var' env
                               evalProgLoop prog env1 
  
-- To escape from Haskell's lazyness, we strictly evaluate some of the expressions
strictlyEval :: Variable -> IO Variable
strictlyEval (Value mxs) = do xs <- mxs; return $ Value $ return xs
strictlyEval p = return p   


addEntry:: Maybe String -> Variable -> Environment -> Environment
addEntry Nothing _ env = env
addEntry (Just name) val env = Map.insert name val env

-- Types of Statements:
-- 
-- "csv <varName>;"              = uninitialised CSV variable
-- "csv <varName> = <Query>;"    = Initialised CSV variable. Captures and stores the value of a query.
-- "query <varName> = <Query>;"  = Query declaration. Stores a reference to a query.
-- "<Query>;""                   = Unassigned Query
evalStatement:: Expr -> Environment -> (Maybe String, Variable)          
evalStatement (UnInit name) _         = (Just name, Value emptyCSV)
evalStatement (Init name query) env   = (Just name, Value $ evalQuery (emptyCSV, env, query))
evalStatement (Method name query) env = (Just name, Procedure query env)
evalStatement (Expression query) env  = (Nothing, Value $ evalQuery (emptyCSV, env, query))     

-- Evaluates a Query, one Pipe at a time
evalQuery:: State -> CSV                
evalQuery (csv, env, PipeLine pipe query) = let csv1 = evalQuery (csv, env, pipe) in evalQuery (csv1, env, query) 
evalQuery (csv, env, PipeEnd pipe) = evalQuery1 pipe csv env                           
                    
-- Pipes and their functionality:
-- 
-- "asc" = Ascend pipe. Takes a CSV, orders it in ascening order and returns it to the next pipe.
-- "desc" = Descend pipe. Takes a CSV, orders it in descending order and returns it to the next pipe.
-- "unique" = Unique pipe. Takes a CSV and filters out all duplicate entries.
-- "import" = Import pipe. Returns a CSV. Expects a string / path to a ".csv" file. Throws an error if it fails to import the desired file.
-- "select" = Select pipe. Expects a predicate. Takes a CSV and filters it based on the predicate.
-- "update" = Update pipe. Expects two columns. Takes a CSV and updates the first column based on the second one.
-- "reform" = Reform pipe. Expects a list of colums. Takes a CSV and re-shapes it based on the list of columns.
-- "print" = Print pipe. Takes a CSV, prints it, and outputs it to the next pipe.
-- "write" = Write pipe. Expects a string / path to a ".csv" file. Takes a CSV and writes it in the desired location. Passes the CSV to the next pipe.
-- "note" = Note pipe. Expects a string. Prints a message to the console.
-- "error" = Error pipe. Expects a string. Terminates the program with an error message.
-- variable name = Returns the value of the variable stored in the environment
-- "x" = Cross-product pipe. Takes two queries and outputs their cartessian product.
-- "++" = Union pipe. Takes two queries and outputs their union.
-- "--" = Difference pipe. Takes two queries and outputs their difference.
-- "if <> -> query" = If contol. Takes a predicate and applies a query to all enntries that satisfy the predicate.
evalQuery1 :: CsvExpr -> CSV -> Environment -> CSV
evalQuery1 Asc csv _                = strictFilter sort csv
evalQuery1 Desc csv _               = strictFilter (sortBy (flip compare)) csv
evalQuery1 Unique csv _             = strictFilter (map head . group . sort) csv
evalQuery1 (Import name) _  _       = tryToImport name
evalQuery1 (Select conds) csv _     = strictFilter (select conds) csv
evalQuery1 (Update col1 col2) csv _ = strictFilter (\xs -> map (\x -> update x col1 col2) $ zip xs [0..]) csv
evalQuery1 (Reform cols) csv _      = strictFilter (resolveReform cols) csv
evalQuery1 Print csv _              = strictPipe   (putStrLn.toString) csv
evalQuery1 (Write name) csv _       = strictPipe   (writeFile name.toString) csv
evalQuery1 (Note message) csv _     = strictPipe   (\_ -> putStrLn message) csv
evalQuery1 (Error message) csv _    = strictPipe   (\_ -> error message) csv
evalQuery1 (VarName name) csv env   = getBinding name env csv
evalQuery1 (FullBinary b) _ env     = binaryEval b env
evalQuery1 (If conds query) csv env = resolveIf conds (csv, env, query) 

-- Unwraps syntax sugar such as [$1..$3, $5] into [$1, $2, $3, $5]
unwrapColItems:: Cols -> (Entry,Int) -> [Col]
unwrapColItems [] _  = []
unwrapColItems ((Column c):cs) entry = c : unwrapColItems cs entry
unwrapColItems (Range m1 m2:cs) entry | start <= end = (map (\s -> Index $ Number s) [start .. end]) ++ unwrapColItems cs entry
                                      | otherwise = reverse $ (map (\s -> Index $ Number s) [end .. start]) ++ unwrapColItems cs entry
                                          where
                                          start = mathCalc m1 entry
                                          end = mathCalc m2 entry


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

resolveReform :: Cols -> [Entry] -> [Entry]
resolveReform cols xs = map (\e -> reform (unwrapColItems cols e) e) zipped
                        where 
                        zipped = zip xs [0..]

reform :: [Col] -> (Entry, Int) -> Entry
reform cols (entry, i) = map (getEntryValue (entry,i)) cols


select :: Conds -> [Entry] -> [Entry]
select conds xs = [fst x | x <- zip xs [0..], conditions conds x]


update :: (Entry, Int) -> Col -> Col -> Entry 
update ([], _) _ _ = []
update (vs, id) (Filler f) col2 = map (\v -> if (v == f) then getEntryValue (vs, id) col2 else v) vs
update (vs, id) (Index i) col2 = beginning ++ [getEntryValue (vs,id) col2] ++ end
                           where
                           num = mathCalc i (vs,id) :: Int 
                           beginning = take num vs
                           end = drop (num + 1) vs


tryToImport:: String -> CSV
tryToImport name = do b <- doesFileExist name 
                      if (b) then strictFilter (fmap (fmap trim . splitOn ',').lines) $ readFile name
                      else error $ "Error: File " ++ name ++ " does not exist!"
                  
         

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
condition (ColCond col1 op col2) (entry, id) = boolOperation op (getEntryValue (entry, id) col1) (getEntryValue (entry, id) col2)
condition (NumCond a op b) e = boolOperation op (mathCalc a e) (mathCalc b e)                                               


mathCalc :: MathExpr -> (Entry, Int) -> Int
mathCalc ContextArity (csv, _) = length csv
mathCalc Id (_, index) = index
mathCalc (Number n) _ = n
mathCalc (Calc _ Div (Number 0)) _ = error "Error: Division by 0"
mathCalc (Calc mathExpr1 op mathExpr2) e = mathOperation op (mathCalc mathExpr1 e) (mathCalc mathExpr2 e)


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


getEntryValue:: (Entry, Int) -> Col -> String
getEntryValue _ (Filler f) = f
getEntryValue (entry, id) (Index expr) | 0 <= i && i < length entry = entry !! i
                                       | otherwise = error $ "Error: Cannot access index " ++ show i ++ " in " ++ show entry
                                         where
                                         i = mathCalc expr (entry, id)

isSpace :: Char -> Bool
isSpace ' ' = True 
isSpace '\r' = True 
isSpace _ = False

trim :: String -> String
trim xs = dropSpaceTail "" $ dropWhile isSpace xs

dropSpaceTail :: String -> String -> String
dropSpaceTail _ "" = ""
dropSpaceTail maybeStuff (x:xs) | isSpace x = dropSpaceTail (x:maybeStuff) xs
                                | null maybeStuff = x : dropSpaceTail "" xs
                                | otherwise       = reverse maybeStuff ++ x : dropSpaceTail "" xs