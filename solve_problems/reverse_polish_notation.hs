{--
  This module implements a function that evaluates a reverse polish
--}

import Data.List

-- | Evaluates a reverse polish notation
{--
  evalRPN "10 4 3 + 2 * -" -> -4
  evalRPN "1 + 2 3 + 2 * - 1" -> 1
--}
evalRPN :: (Num a, Read a) => String -> a
evalRPN expression = head $ foldl foldingFunction [] $ words expression
    where foldingFunction (x:y:ys) "*" = (x * y):ys  
          foldingFunction (x:y:ys) "+" = (x + y):ys  
          foldingFunction (x:y:ys) "-" = (y - x):ys  
          foldingFunction xs numberString = read numberString:xs 
