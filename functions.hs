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
