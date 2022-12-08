import Data.List
import System.IO
import Data.Char

-- Convert a string to uppercase
convertToUppercase :: String -> String
convertToUppercase str = map toUpper str

-- Convert all times in a list to uppercase
convertAllToUppercase :: [String] -> [String]
convertAllToUppercase strList = map convertToUppercase strList

-- Pass a function as an argument of a function
-- Use case: 
-- Function 1 receive a list and condition
-- Filter based on the condition
cars :: [String]
cars = ["ford", "chevy", "honda", "toyota", "bmw", "audi"]

isGermanCar :: String -> Bool
isGermanCar car = map toLower car `elem` ["bmw", "audi"]

filterGermanCars :: [String] -> [String]
filterGermanCars cars = filter isGermanCar cars

-- Alternative with HOC
filterCars :: [String] -> (String -> Bool) -> [String]
filterCars cars filterFunction = filter filterFunction cars

-- Filter german cars
germanCars = filterCars cars (\car -> map toLower car `elem` ["bmw", "audi"])

usCars = filterCars cars (\car -> map toLower car `elem` ["ford", "chevy"])

-- Returning a function
getAddFunc :: Int -> (Int -> Int)
getAddFunc x y = x + y
-- This is the same as:
-- getAddFunc x = (\y -> x + y)

add1 = getAddFunc 1
add3 = getAddFunc 3


logFunction :: String -> (String -> String)
logFunction logLevel
  | logLevel == "INFO" = \message -> "INFO: " ++ message
  | logLevel == "WARN" = \message -> "WARN: " ++ message
  | logLevel == "ERROR" = \message -> "ERROR: " ++ message

logInfo = logFunction "INFO"
logError = logFunction "ERROR"


