import Tokens
import Grammar
import System.Environment
import Control.Exception
import System.IO


import Data.List 
import Control.Monad
import Data.Maybe
import Data.Tuple
import Data.List
import qualified Data.Map as Map

-- update 
-- binary
-- boolean expr

type CSV = IO [[String]];
type Environment = [(String, CSV)] 
type QueryState  =  (CSV, Environment, Query)  

main :: IO ()
main = catch main' noParse
       where
       noParse :: ErrorCall -> IO ()
       noParse e = hPutStr stderr $ show e


main' :: IO ()
main' = do (fileName : _ ) <- getArgs 
           sourceText <- readFile fileName
    
           let parsedProg = parseCalc (alexScanTokens sourceText)
           evalProgLoop parsedProg []
           return ()


                              
evalProgLoop :: Prog -> Environment ->  IO ()
evalProgLoop [] _ = return () 
evalProgLoop (e:prog) env = do env1 <- evalProg1 e env
                               evalProgLoop prog env1 
                            

evalProg1:: Expr -> Environment -> IO Environment               
evalProg1 (UnInit name) env = return ((name, pure []):env)
evalProg1 (Expression query) env = do evalQuery ((pure []), env, query) 
                                      return env        
evalProg1 (Init name query) env = do (val, _, _) <- evalQuery ((pure []), env, query) 
                                     return ((name, val):env)

                              
evalQuery:: QueryState -> IO QueryState                  
evalQuery  (csv, env, PipeEnd csvExpr) = do csv <- evalQuery1 csvExpr csv env
                                            csv  
                                            return (csv , env, PipeEnd csvExpr)
                                        
evalQuery (csv, env, PipeLine csvExpr pipe) = do csv1 <- evalQuery1 csvExpr csv env
                                                 evalQuery (csv1, env, pipe) 


evalQuery1 :: CsvExpr -> CSV -> Environment -> IO CSV
evalQuery1 Asc mxs _ = return $! liftM sort mxs
evalQuery1 Desc mxs _ = return $! liftM (sortBy (flip compare)) mxs
evalQuery1 Print mxs _ = do xs <- mxs 
                            putStrLn $ intercalate "\n" (map (intercalate ",") xs) 
                            return mxs   

evalQuery1 (Import name) _ _ = do x <- readFile name
                                  (return.pure) $! fmap (splitOn ',') (lines x)      

evalQuery1 (Write name) mxs _ = do xs <- mxs
                                   let text = intercalate "\n" (map (intercalate ",") xs) 
                                   writeFile name text
                                   return mxs

evalQuery1 (FullBinary b) _ env = return $! binaryEval b env
evalQuery1 (VarName name) _ env | isNothing entry = error "Invalid variable"
                                | otherwise = return $! fromJust entry
                                  where 
                                  entry = lookup name env



unwrap :: Monad m => m (m b) -> m b
unwrap ma = do {a <- ma; a}


getCSV :: Query -> Environment -> CSV
getCSV a env = do (csv, _, _) <- evalQuery (pure [], env, a)
                  c <- csv
                  return c  


binaryEval :: Binary Query Query -> Environment -> CSV
binaryEval (Union eCSV1 eCSV2) env = liftM2 (++) (getCSV eCSV1 env) (getCSV eCSV2 env)
binaryEval (Diff eCSV1 eCSV2) env = liftM2 (\\) (getCSV eCSV1 env) (getCSV eCSV2 env)
binaryEval (Inter eCSV1 eCSV2) env = let csv1 = getCSV eCSV1 env in liftM2 (\\) csv1 (liftM2 (\\) csv1 (getCSV eCSV2 env))         
binaryEval (Cross eCSV1 eCSV2) env = do c1 <- getCSV eCSV1 env
                                        c2 <- getCSV eCSV2 env
                                        return [x ++ y | x <- c1, y <- c2]
                                        
                                        
splitOn :: Char -> String -> [String]
splitOn _ [] = []
splitOn c ls = (takeWhile (/=c) ls) : splitOn' c (dropWhile (/=c) ls)
                where splitOn' _ [] = []
                      splitOn' c (x:[]) | x == c = [[]]
                      splitOn' c (x:xs) | x == c = splitOn c xs
                                        | otherwise = []