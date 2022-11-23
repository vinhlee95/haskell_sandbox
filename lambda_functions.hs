-- Lambda aka anonymous functions
-- https://wiki.haskell.org/Anonymous_function

-- Resources: 
-- https://www.youtube.com/watch?v=iSz2q_reDTA

doubleNumbersInTheList :: (Integral a) => [a] -> [a]
{--
  💡 This is similar as following, because of currying
    doubleNumbersInTheList xs = map (\x -> x * 2) xs
  
  Generally, if you have a function like foo a = bar b a, 
  you can rewrite it as foo = bar b, because of currying,
  aka "bar b" returns a function that take a list as argument
--}
doubleNumbersInTheList = map (*2)

-- Shorten syntaxes:
-- doubleNumbersInTheList xs = map (*2) xs

doubleNumbersInTupleList :: (Integral a) => [(a, a)] -> [(a, a)]
doubleNumbersInTupleList = map (\(a, b) -> (a*2, b*2))

{--
  ===== FOLD =====
--}
{--
  LEFT FOLD
  - Fold the list from left side, aka from head - starting value -> tail
--}
sum' :: (Num a) => [a] -> a
sum' = foldl (\acc x -> acc + x) 0

-- Using foldl1 -> NOT having to provide initial value
-- sum' = foldl1 (\acc x -> acc + x)

-- Recursive version
sum'' (x:xs) = x + sum xs

-- Crazier syntax
sum''' :: (Num a) => [a] -> a
sum''' = foldl (+) 0

{--
  RIGHT FOLD
--}
revertAndPlus2 :: (Num a) => [a] -> [a]
-- accumulation is the 2nd argument while current value is the 1st one
revertAndPlus2 = foldr (\x acc -> acc ++ [x + 2]) []

{--
  FUNCTION APPLICATION WITH $
--}
amountOfNumbersBiggerThan10 = length (filter (>10) (map (\x -> x * x) [1..10]))
-- Using function application 
_amtBiggerThan10 :: Int
_amtBiggerThan10 = length $ filter (>10) $ map (\x -> x * x) [1..10]

{--
  FUNCTION COMPOSITION
--}
absThenPlus2 :: [Integer] -> [Integer]
absThenPlus2 = map ((+2) . abs)
-- absThenPlus2 [-3, -10] -> [5, 12]