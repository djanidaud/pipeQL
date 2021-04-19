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

answer1 = [["Beans", "Beanson"],["Andrew", "Andrewson"],["Charles", "Charleson"],["Andrew", "Andrewson"]]
answer2 = [["Andrew", "Andrewson"],["Andrew", "Andrewson"],["Beans", "Beanson"],["Charles", "Charleson"]]
answer3 = [["Charles", "Charleson"],["Beans", "Beanson"],["Andrew", "Andrewson"],["Andrew", "Andrewson"]]
answer4 = [["Andrew", "Andrewson"],["Beans", "Beanson"],["Charles", "Charleson"]]
answer5 = [["Beans", "Beanson"],["Charles", "Charleson"]]
answer6 = [["Beans", "Beans"],["Andrew", "Andrew"],["Charles", "Charles"],["Andrew", "Andrew"]]
answer7 = [["Beans", "Beanson","Beanson"],["Andrew", "Andrewson","Andrewson"],["Charles", "Charleson","Charleson"],["Andrew", "Andrewson","Andrewson"]]
answer8 = [["Beans", "Beanson"],["Andrew", "Andrewson","Andrewson"],["Charles", "Charleson"],["Andrew", "Andrewson","Andrewson"]]
answer9 = [["Beans", "Beanson"],["Andrew", "Andrewson"],["Charles", "Charleson"],["Andrew", "Andrewson"],["Beans", "Beanson"],["Andrew", "Andrewson"],["Charles", "Charleson"],["Andrew", "Andrewson"]]
answer10 = [["Beans","Beanson","Beans","Beanson"],["Beans","Beanson","Andrew","Andrewson"],["Beans","Beanson","Charles","Charleson"],["Beans","Beanson","Andrew","Andrewson"],["Andrew","Andrewson","Beans","Beanson"],["Andrew","Andrewson","Andrew","Andrewson"],["Andrew","Andrewson","Charles","Charleson"],["Andrew","Andrewson","Andrew","Andrewson"],["Charles","Charleson","Beans","Beanson"],["Charles","Charleson","Andrew","Andrewson"],["Charles","Charleson","Charles","Charleson"],["Charles","Charleson","Andrew","Andrewson"],["Andrew","Andrewson","Beans","Beanson"],["Andrew","Andrewson","Andrew","Andrewson"],["Andrew","Andrewson","Charles","Charleson"],["Andrew","Andrewson","Andrew","Andrewson"]]
answer11 = []
answer12 = [[ "Beanson","Beans"], ["Andrewson","Andrew"],[ "Charleson","Charles"], ["Andrewson","Andrew"]]
answerpr1 = [["1","2","3","4"],["1","2","3","4"],["1","2","3","4"],["1","2","3","4"]] 
answerpr2 = [["2","2"],["6","2"]]






--answerpr3 =
--answerpr4 =
--answerpr5 =


tests :: IO [Test]
tests = do res1 <- evaluateTest "./test/Code1.cql" "./test/output1.csv" answer1 "Import/Export Failed"      
           res2 <- evaluateTest "./test/Code2.cql" "./test/output2.csv" answer2 "Ascend Failed"    
           res3 <- evaluateTest "./test/Code3.cql" "./test/output3.csv" answer3 "Descend Failed"
           res4 <- evaluateTest "./test/Code4.cql" "./test/output4.csv" answer4 "Unique Failed"
           res5 <- evaluateTest "./test/Code5.cql" "./test/output5.csv" answer5 "Select Failed"
           res6 <- evaluateTest "./test/Code6.cql" "./test/output6.csv" answer6 "Update Failed"
           res7 <- evaluateTest "./test/Code7.cql" "./test/output7.csv" answer7 "Reform Failed"
           res8 <- evaluateTest "./test/Code8.cql" "./test/output8.csv" answer8 "If Failed"
           res9 <- evaluateTest "./test/Code9.cql" "./test/output9.csv" answer9 "Union Failed"
           res10 <- evaluateTest "./test/Code10.cql" "./test/output10.csv" answer10 "Cross product Failed"
           res11 <- evaluateTest "./test/Code11.cql" "./test/output11.csv" answer11 "Subtraction Failed"
           res12 <- evaluateTest "./test/Code12.cql" "./test/output12.csv" answer12 "Arity Failed"
           --res13 <- evaluateTest "./test/pr1.cql" "./test/output13.csv" answerpr1 "Problem 1 of Coursework Failed"
           --res14 <- evaluateTest "./test/pr2.cql" "./test/outputpr2.csv" answerpr2 "Problem 2 of Coursework Failed"

           return [ 
                    createTest "Import/Export Test" res1,
                    createTest "Ascend Test" res2, 
                    createTest "Descend Test" res3,
                    createTest "Unique Test" res4,
                    createTest "Select Test" res5,
                    createTest "Update Test" res6,
                    createTest "Reform Test" res7,
                    createTest "If Test" res8,
                    createTest "Union Test" res9,
                    createTest "Cross Product Test" res10,
                    createTest "Subtraction Test" res11,
                    createTest "Arity Test" res12
                    --createTest "Problem 1 Test" res13
                    --createTest "Problem 2 Test" res14

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
                            