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
allCities = [City "London" 1000000, City "Paris" 2000000, City "Berlin" 3000000]


-- Filter cities with population greater than 1000000
bigCities = filter (\city -> population city > 1000000) allCities

-- Function to print names of all cities in a list
printCities :: [City] -> IO ()
printCities [] = return ()
printCities (x:xs) = do
  -- Print city name and population
  putStrLn $ name x ++ " has " ++ show (population x) ++ " people"
  printCities xs

