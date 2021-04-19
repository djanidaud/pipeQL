module ForTests(tests) where


import Tokens ( alexScanTokens )
import Grammar

import System.Environment 
import Control.Exception
import System.IO 
import Data.List 
import Control.Monad
import Data.Maybe
import Data.List
import System.Directory
import qualified Data.Map as Map
import System.Exit (exitFailure, exitSuccess)

import Distribution.TestSuite

import Eval (evalProgLoop, tryToImport)  



type TestName = String
type FailMessage = String

answer1 = [["Andrew", "Andrewson"],["Beans", "Beanson"],["Charles", "Charleson"]]
answer2 = [["Andrew", "Andrewson"],["Beans", "Beanson"],["Charles", "Charleson"]]


tests :: IO [Test]
tests = do res1 <- evaluateTest "./test/Code1.cql" "./test/output.csv" answer1 "Import/Export Failed"      
           res2 <- evaluateTest "<CQL input>" "<CQL output>" answer2 "Fail message"    

           return [ 
                    createTest "Import/Export Test" res1,
                    createTest "<TestName>" res2 
                  ]
                                      
createTest name res = Test t 
                      where
                      t = TestInstance { run = return $ Finished res
                                       , name = name
                                       , tags = []
                                       , options = []
                                       , setOption = \_ _ -> Right t
                                       }   


evaluateTest :: FilePath ->  FilePath -> [[String]] -> String -> IO Result
evaluateTest input g answer failM = do  code1 <- readFile input
                                        let parsedProg = parseCalc (alexScanTokens code1)
                                        evalProgLoop parsedProg Map.empty
                                      
                                        output <- tryToImport g
                                        return $ if (answer == output) then Pass else Fail failM
                            