-- Exports the csvql library, which we use for the interpreter + testing
module Lib ( mainFunction ) where
import Eval ( main )

mainFunction :: IO ()
mainFunction = main