-- Employee data type
data Employee = 
  -- Name of the role | Employee name | Experience in years
  Developer String Int | 
  ProductManager String Int |
  Designer String Int

johnDeveloper :: Employee
johnDeveloper = Developer "John" 5
janeDesigner = Designer "Jane" 3

-- Function to get the name of an employee
logEmployee :: Employee -> IO()
logEmployee (Developer name _) = putStrLn $ "Developer " ++ name
logEmployee (ProductManager name _) = putStrLn $ "Product Manager " ++ name
logEmployee (Designer name _) = putStrLn $ "Designer " ++ name


-- Record syntax
data Car = Car { manufacturer :: String, model :: String, releaseYear :: Int }

firstCar :: Car
firstCar = Car "Audi" "R8" 2022
secondCar = Car "BMW" "M3" 2021

-- Function to print car info
logCarInfo :: Car -> IO()
logCarInfo car = putStrLn $ manufacturer car ++ " " ++ model car ++ " " ++ show (releaseYear car)
