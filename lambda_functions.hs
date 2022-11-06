-- Lambda aka anonymous functions
-- https://wiki.haskell.org/Anonymous_function

-- Resources: 
-- https://www.youtube.com/watch?v=iSz2q_reDTA


double :: Int -> Int
double = \x -> x * 2
-- This is the same as:
-- double x = x * 2 (normal function declaration)

doubleItemInList :: [Int] -> [Int]
doubleItemInList = map double
-- This is the same as:
-- _doubleItemInList list = map (\x -> x * 2) list

doubleOneToThree = doubleItemInList [1..3] -- [2, 4, 6]