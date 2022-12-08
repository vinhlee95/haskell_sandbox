import Data.List
import System.IO

-- funcName param1 param2 = operations (returned value)
addMe :: Int -> Int -> Int
addMe x y = x + y
sumOf1And2 = addMe 1 2

-- Guards
isOdd :: Int -> Bool
isOdd n
  | n `mod` 2 == 0 = False
  | otherwise = True

validChoices :: [String]
validChoices = ["rock", "paper", "scissors"]

isValidChoice :: String -> Bool
isValidChoice choice = choice `elem` validChoices

alertBatteryLevel :: Int -> String
alertBatteryLevel battery
  | battery <= 10 = "Please charge now!"
  | battery <= 20 = "Please charge soon!"
  | (battery > 2) && (battery <= 50) = "Battery level is moderate"
  | (battery > 50) && (battery <= 80) = "Battery level is good"
  | otherwise = "Battery level is great. You don't need to charge."

-- Where 
informConversionRate :: Double -> Double -> String
informConversionRate usd eur
  | usdToEurRate <= 0.8 = "You are getting a good deal!"
  | usdToEurRate <= 0.9 = "The exchange rate is fair."
  | otherwise = "You are getting a bad deal!"
  where usdToEurRate = usd / eur

-- Accessing arguments in a function
sayHello :: [String] -> String
sayHello [] = "Hello there"
sayHello (x:[]) = "Hello " ++ x
sayHello (x:y:[]) = "Hello " ++ x ++ " and " ++ y
sayHello (x:xs) = "Hello " ++ x ++ " and " ++ show xs

-- Function with if/else statement
validateNumber :: Int -> String
validateNumber x = if x > 10 then "Greater than 10" else "Less than 10"


-- Pattern matching
factorial :: (Integral a) => a -> a
factorial 0 = 1
factorial n = n * factorial (n - 1)

-- Pattern matching and list comprehensions
myListOfTuple :: [(Int, Int)]
myListOfTuple = [(1, 2), (3, 4), (5, 6)]

sumItems :: [Int]
sumItems = [a + b | (a, b) <- myListOfTuple] -- [3, 7, 11]

-- Pattern matching and tuples
addVectors :: (Num a) => (a, a) -> (a, a) -> (a, a)
addVectors (x1, y1) (x2, y2) = (x1 + x2, y1 + y2)

myVector = addVectors (1, 2) (3, 4) -- (4, 6)

-- Reimplement sum function
sum' :: (Num a) => [a] -> a
sum' [] = 0
sum' (x:xs) = x + sum' xs

-- Reimplement compare function
myCompare :: (Ord a) => a -> a -> Ordering
a `myCompare` b
  | a > b = GT
  | a == b = EQ
  | otherwise = LT

-- Where keyword
bmiTell :: (RealFloat a) => a -> a -> String
bmiTell weight height
  | bmi <= skinny = "You're underweight"
  | bmi <= normal = "You're normal"
  | bmi <= fat = "You're overweight"
  | otherwise = "You're good"
  where bmi = weight / height ^ 2
        skinny = 18.5
        normal = 25.0
        fat = 30.0

{-
  Let bindings
-}
square3 = let x = 3 in x * x
total = (let (x, y, z) = (1, 2, 3) in x * y * z) * 100 -- 600

{-
  Case expression
  Syntax: case expression of pattern -> result
                           pattern -> result
                           pattern -> result
                           ...
-}
-- Typical pattern matching
head' :: [a] -> a
head' [] = error "Can't call head on an empty list!"
head' (x:_) = x

-- Case expression
head'' :: [a] -> a
head'' xs = case xs of [] -> error "No head for empty list!"
                       (x:_) -> x

-- Add typeclass for a
describeList :: [a] -> String
describeList xs = case xs of [] -> "Empty list"
                             [x] -> "A singleton list"
                             xs -> "A longer list of " ++ show (length xs) ++ "elements"
