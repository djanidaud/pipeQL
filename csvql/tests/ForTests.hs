module ForTests where 
    
import Tokens ( alexScanTokens )
import Grammar
import PipeTypes
import System.Environment 
import Control.Exception
import System.IO 
import Data.List 
import Control.Monad
import Data.Maybe
import Data.List
import qualified Data.Map as Map
import Main  

test = do code1 <- readFile "/Tests/Code1.cql"
          code2 <- readFile "/Tests/Code2.cql"
          code3 <- readFile "/Tests/Code3.cql"
          code4 <- readFile "/Tests/Code4.cql"
          code5 <- readFile "/Tests/Code5.cql"
          code6 <- readFile "/Tests/Code6.cql"
          code7 <- readFile "/Tests/Code7.txt"
          code8 <- readFile "/Tests/Code8.txt"
          code9 <- readFile "/Tests/Code9.txt"
          code10 <- readFile "/Tests/Cod10.txt"
          code11 <- readFile "/Tests/Code11.txt"
          code12 <- readFile "/Tests/Code12.cql"
          let parsedProg = parseCalc (alexScanTokens code1)
          evalProgLoop parsedProg Map.empty
          return ()