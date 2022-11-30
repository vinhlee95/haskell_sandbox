import Prelude hiding (Just)
-- Employee data type
-- Using deriving (Show) to make the record printable
data Employee = 
  -- Name of the role | Employee name | Experience in years
  Developer String Int | 
  ProductManager String Int |
  Designer String Int
  deriving (Show)

johnDeveloper :: Employee
johnDeveloper = Developer "John" 5
janeDesigner = Designer "Jane" 3

-- Function to get the name of an employee
logEmployee :: Employee -> IO()
logEmployee (Developer name _) = putStrLn $ "Developer " ++ name
logEmployee (ProductManager name _) = putStrLn $ "Product Manager " ++ name
logEmployee (Designer name _) = putStrLn $ "Designer " ++ name


-- Record syntax
data Car = Car { manufacturer :: String, model :: String, releaseYear :: Int } deriving (Show)

-- Extract the manufacturer from a car from function parameters
logCarName :: Car -> IO()
logCarName Car { manufacturer = manufacturer, model = model } = putStrLn $ manufacturer ++ " " ++ model

firstCar :: Car
firstCar = Car "Audi" "R8" 2022
secondCar = Car "BMW" "M3" 2021

-- Function to print car info
logCarInfo :: Car -> IO()
logCarInfo car = putStrLn $ manufacturer car ++ " " ++ model car ++ " " ++ show (releaseYear car)

{-
  Type parameters
  Similar to generic in TS
  -}
data Phone a b = Phone { _manufacturer :: a, _model :: b } deriving (Show)
iPhone11 = Phone "Apple" "iPhone 11"
-- But this allows _model to have different type, which might not be a good thing
iPhone12 = Phone "Apple" 12

{-
  Derived instances
-}
data Person = Person { firstName :: String, lastName :: String, age :: Int } deriving (Show, Eq, Ord)
john :: Person = Person "John" "Doe" 30
jane :: Person = Person "Jane" "Doe" 25
-- john == jane -- False
-- john `elem` [john, jane] -- True