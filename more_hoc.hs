import Data.List ( map )
import Data.Char (toUpper)

-- Compare a value to 10
compareWithTen :: (Ord a, Num a) => a -> Ordering
-- compareWithTen x = compare 10 x
compareWithTen = compare 10

result :: Ordering
result = compareWithTen 20 -- LT

-- Function to divide by 2
divideByTwo :: (Floating a) => a -> a
-- divideByTwo x = x / 2
-- Shorter version
divideByTwo = (/2)

-- Function to check if the item is among a list
isInsideList :: (Eq a) => a -> [a] -> Bool
isInsideList x xs = x `elem` xs

stringToUpper :: String -> String
stringToUpper = map toUpper

-- Map function to uppercase all the strings in a list
upperCaseList :: [String] -> [String]
-- upperCaseList = map stringToUpper
-- Shorter version
-- Outer map: for each string inside the list, execute the inner map
-- Inner map: for each character inside the string, execute the toUpper function
upperCaseList = map (map toUpper)

-- Map
-- Type signature
map' :: (a -> b) -> [a] -> [b]
map' _ [] = []
-- : is to prepend an element to a list
map' f (x:xs) = f x : map' f xs


-- Filter
-- Type signature
filter' :: (a -> Bool) -> [a] -> [a]
filter' _ [] = []
filter' f (x:xs)
  | f x       = x : filter' f xs
  | otherwise = filter' f xs

notFooElems = filter (`notElem` ["foo"]) ["foo", "bar", "baz"] -- ["bar","baz"]
greaterThanTen = filter (>10) [1, 2, 12, 20] -- [12, 20]

-- a bit more complex data structure
-- a list of cities, with name and population
data City = City { name :: String, population :: Int }
allCities = [
  City "London" 1000000, 
  City "Paris" 2000000, 
  City "Berlin" 3000000,
  City "Helsinki" 500000
  ]


-- Filter cities with population greater than 1000000
bigCities :: [City] = filter (\city -> population city > 1000000) allCities
biggerCities :: [City] = filter p allCities
  where p city = population city > 2000000

-- Function to print names of all cities in a list
printCities :: [City] -> IO ()
printCities [] = return ()
printCities (x:xs) = do
  -- Print city name and population
  putStrLn $ name x ++ " has " ++ show (population x) ++ " people"
  printCities xs

-- Find a list of all countries names having population more than 750000
bigCityNames = [name city | city <- allCities, population city > 750000]
_bigCityNames = map name (filter popBiggerThan750k allCities)
  where popBiggerThan750k city = population city > 750000


-- Find the sum of all odd squares that are smaller than 10,000
mySum :: Integer = sum (takeWhile (<10) (filter odd (map (^2) [1..])))
-- Alternative
-- sum (takeWhile (<10000) [n^2 | n <- [1..], odd (n^2)])

{--
  Collatz sequences. 
  We take a natural number. 
    - If that number is even, we divide it by two. 
    - If it's odd, we multiply it by 3 and then add 1 to that.

  We take the resulting number and apply the same thing to it, 
  which produces a new number and so on. 
  In essence, we get a chain of numbers
--}
chain :: (Integral a) => a -> [a]
chain 1 = [1]
chain n
  | even n = n:chain (n `div` 2)
  | odd n = n:chain (n*3 + 1)

-- for all starting numbers between 1 and 100, 
-- how many chains have a length greater than 15
startingNumbers = [1..100]
longChains = length [c | c <- map chain startingNumbers, length c > 15]
-- Alternative
_longChains = length (filter isLongChain (map chain startingNumbers))
  where isLongChain chain = length chain > 15
