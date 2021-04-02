import Tokens
import Grammar
import System.Environment
import Control.Exception
import System.IO


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

addEntry:: Maybe String -> [[String]] -> Environment -> Environment
addEntry Nothing _ env = env
addEntry (Just name) val env = Map.insert name val env

getBinding:: String -> Environment -> CSV
getBinding varName env | isNothing entry = error "Undefined Variable"
                       | otherwise = return $!fromJust entry
                         where
                         entry :: Maybe [[String]]
                         entry = Map.lookup varName env



                              
evalProgLoop :: Prog -> Environment -> IO ()
evalProgLoop [] _ = return () 
evalProgLoop (e:prog) env = do let (maybeVar, csv) = evalStatement e env
                               v <- csv
                               let env1 = addEntry maybeVar v env
                               evalProgLoop prog env1 
                               
                              
                            
                           
evalStatement:: Expr -> Environment ->  (Maybe String, CSV)          
evalStatement (UnInit name) _ = (Just name, emptyCSV)
evalStatement (Expression query) env = (Nothing, evalQuery (emptyCSV, env, query))      
evalStatement (Init name query) env = (Just name, evalQuery (emptyCSV, env, query))

                              
evalQuery:: QueryState -> CSV                
evalQuery  (csv, env, PipeEnd pipe) = evalQuery1 pipe csv env        
evalQuery (csv, env, PipeLine pipe query) = let csv1 = evalQuery (csv, env, pipe) in evalQuery (csv1, env, query) 
                                          
                                          
evalQuery1 :: CsvExpr -> CSV -> Environment -> CSV
evalQuery1 (VarName name) _ env = getBinding name env
evalQuery1 (FullBinary b) _ env = binaryEval b env
evalQuery1 Asc mxs _ = liftM sort mxs
evalQuery1 Desc mxs _ = liftM (sortBy (flip compare)) mxs
evalQuery1 Print mxs _ = do xs <- mxs 
                            putStrLn $ intercalate "\n" $ map (intercalate ",") xs
                            return xs   

evalQuery1 (Import name) _ _ = do x <- readFile name
                                  (return) $! fmap (splitOn ',') (lines x)      

evalQuery1 (Write name) mxs _ = do xs <- mxs
                                   let text = intercalate "\n" (map (intercalate ",") xs) 
                                   writeFile name text
                                   return xs




binaryEval :: Binary Query Query -> Environment -> CSV
binaryEval (Union eCSV1 eCSV2) env = liftM2 (++) (getCSV eCSV1 env) (getCSV eCSV2 env)
binaryEval (Diff eCSV1 eCSV2) env = liftM2 (\\) (getCSV eCSV1 env) (getCSV eCSV2 env)
binaryEval (Inter eCSV1 eCSV2) env = let csv1 = getCSV eCSV1 env in liftM2 (\\) csv1 (liftM2 (\\) csv1 (getCSV eCSV2 env))         
binaryEval (Cross eCSV1 eCSV2) env = do c1 <- getCSV eCSV1 env
                                        c2 <- getCSV eCSV2 env
                                        return [x ++ y | x <- c1, y <- c2]
                                        
-- Helper function
getCSV :: Query -> Environment -> CSV
getCSV a env = evalQuery (emptyCSV, env, a)

splitOn :: Char -> String -> [String]
splitOn _ [] = []
splitOn c ls = (takeWhile (/=c) ls) : splitOn' c (dropWhile (/=c) ls)
                where splitOn' _ [] = []
                      splitOn' c (x:[]) | x == c = [[]]
                      splitOn' c (x:xs) | x == c = splitOn c xs
                                        | otherwise = []


