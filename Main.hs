import Tokens
import Grammar
import System.Environment
import Control.Exception
import System.IO


-- update 
-- binary
-- boolean expr

main :: IO ()
main = catch main' noParse

main' = do (fileName : _ ) <- getArgs 
           sourceText <- readFile fileName
           putStrLn ("Parsing : " ++ sourceText)
           let parsedProg = parseCalc (alexScanTokens sourceText)
           putStrLn ("Parsed as " ++ (show parsedProg))

noParse :: ErrorCall -> IO ()
noParse e = do let err =  show e
               hPutStr stderr err
               return ()



--main :: IO ()
--main = catch main' noLex
--
--main'  = do (fileName : _ ) <- getArgs 
--            sourceText <- readFile fileName
--            putStrLn ("Lexing : " ++ sourceText)
--            let lexedProg = (alexScanTokens sourceText)
--            putStrLn ("lexed as " ++ (show lexedProg))
--
--noLex :: ErrorCall -> IO ()
--noLex e = do let err =  show e
--             hPutStr stderr ("Problem with lexing: " ++ err)
--             return ()