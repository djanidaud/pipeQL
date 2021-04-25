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

outputPath, codePath :: FilePath
outputPath = "./test/output/"
codePath = "./test/code/"


tests :: IO [Test]
tests = do res1 <- evaluateTest "Code1.cql" "output1.csv" answer1 "Import/Export Failed"      
           res2 <- evaluateTest "Code2.cql" "output2.csv" answer2 "Ascend Failed"    
           res3 <- evaluateTest "Code3.cql" "output3.csv" answer3 "Descend Failed"
           res4 <- evaluateTest "Code4.cql" "output4.csv" answer4 "Unique Failed"
           res5 <- evaluateTest "Code5.cql" "output5.csv" answer5 "Select Failed"
           res6 <- evaluateTest "Code6.cql" "output6.csv" answer6 "Update Failed"
           res7 <- evaluateTest "Code7.cql" "output7.csv" answer7 "Reform Failed"
           res8 <- evaluateTest "Code8.cql" "output8.csv" answer8 "If Failed"
           res9 <- evaluateTest "Code9.cql" "output9.csv" answer9 "Union Failed"
           res10 <- evaluateTest "Code10.cql" "output10.csv" answer10 "Cross product Failed"
           res11 <- evaluateTest "Code11.cql" "output11.csv" answer11 "Subtraction Failed"
           res12 <- evaluateTest "Code12.cql" "output12.csv" answer12 "Arity Failed"

           res13 <- evaluateTest "pr1_1.cql" "output13.csv" answerpr1_1 "Problem 1 Example 1 of Coursework Failed"
           res14 <- evaluateTest "pr1_2.cql" "output14.csv" answerpr1_2 "Problem 1 Example 2 of Coursework Failed"
           res15 <- evaluateTest "pr1_3.cql" "output15.csv" answerpr1_3 "Problem 1 Example 3 of Coursework Failed"

           res16 <- evaluateTest "pr2_1.cql" "output16.csv" answerpr2_1 "Problem 2 Example 1 of Coursework Failed"
           res17 <- evaluateTest "pr2_2.cql" "output17.csv" answerpr2_2 "Problem 2 Example 2 of Coursework Failed"
           res18 <- evaluateTest "pr2_3.cql" "output18.csv" answerpr2_3 "Problem 2 Example 3 of Coursework Failed"

           res19 <- evaluateTest "pr3_1.cql" "output19.csv" answerpr3_1 "Problem 3 Example 1 of Coursework Failed"
           res20 <- evaluateTest "pr3_2.cql" "output20.csv" answerpr3_2 "Problem 3 Example 2 of Coursework Failed"
           res21 <- evaluateTest "pr3_3.cql" "output21.csv" answerpr3_3 "Problem 3 Example 3 of Coursework Failed"

           res22 <- evaluateTest "pr4_1.cql" "output22.csv" answerpr4_1 "Problem 4 Example 1 of Coursework Failed"
           res23 <- evaluateTest "pr4_2.cql" "output23.csv" answerpr4_2 "Problem 4 Example 2 of Coursework Failed"

           res24 <- evaluateTest "pr5.cql" "output24.csv" answerpr5 "Problem 5 of Coursework Failed"

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
                    createTest "Arity Test" res12,

                    createTest "Problem 1 Example 1 Test" res13,
                    createTest "Problem 1 Example 2 Test" res14,
                    createTest "Problem 1 Example 3 Test" res15,

                    createTest "Problem 2 Example 1 Test" res16,
                    createTest "Problem 2 Example 2 Test" res17,
                    createTest "Problem 2 Example 3 Test" res18,
                    createTest "Problem 3 Example 1 Test" res19,
                    createTest "Problem 3 Example 2 Test" res20,
                    createTest "Problem 3 Example 3 Test" res21,
                    createTest "Problem 4 Example 1 Test" res22,
                    createTest "Problem 4 Example 2 Test" res23,
                    createTest "Problem 5 Test" res24
                  ]
                                      
createTest name res = Test t 
                      where
                      t = TestInstance { run = return $ Finished res
                                       , name = name
                                       , tags = []
                                       , options = []
                                       , setOption = \_ _ -> Right t
                                       }   


evaluateTest :: FilePath -> FilePath -> [[String]] -> String -> IO Result
evaluateTest input output answer failM = do code1 <- readFile $ codePath ++ input 
                                            let parsedProg = parseCalc (alexScanTokens code1)
                                            evalProgLoop parsedProg Map.empty
                                            o <- tryToImport $ outputPath ++ output
                                            return $ if (answer == o) then Pass else Fail failM
                            


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
answerpr1_1 = []
answerpr1_2 = [["1","2","3","4"],["1","2","3","4"],["1","2","3","4"],["1","2","3","4"]] 
answerpr1_3 = []
answerpr2_1 = [["Carter","Gillian"],["Timms","Dudley"]]
answerpr2_2 = [["2","2"],["6","2"]]
answerpr2_3 = [["","1"],["1","5"],["2","1"],["5",""]]
answerpr3_1 = [["1","5","4","7"],["2","","2","1"],["2","8","2","3"],["4","8","2","3"]]
answerpr3_2 = [["Alice","L","AAW","LC"],["Bob","C","CC","CD"]]
answerpr3_3 = []
answerpr4_1 = [["Leonard","Hunt"],["Michael","Baker"],["Oscar","Walker"]]
answerpr4_2 = [["Cristiano","Ronaldo"],["David","Beckham"],["Diego","Maradona"]]
answerpr5 = [["Dudley","0","Dudley"],["Gillian","0","Gillian"],["Steven","0","Steven"]]

