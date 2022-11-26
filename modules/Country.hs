module Country
( filterCitiesByMinPopulation
  , getEuropeanCountries
  , getAsianCountries
  , allCities
) where

data City = City { name :: String, country :: String, population :: Int }
allCities :: [City] = [
  City "London" "England" 1000000, 
  City "Paris" "France" 2000000, 
  City "Berlin" "Germany" 3000000,
  City "Helsinki" "Finland" 500000,
  City "Hanoi" "Vietnam" 10000000
  ]
europeanCountries :: [String] = ["England", "France", "Germany"]
asianCountries :: [String] = ["Vietnam"]

-- Print all city names
-- mapM_ putStrLn $ map name allCities
-- putStrLn $ "All city names: " ++ show(map name allCities)

filterCitiesByMinPopulation :: Int -> [City]
filterCitiesByMinPopulation x = filter (\city -> population city > x) allCities

getEuropeanCountries :: [City]
getEuropeanCountries = filter (\city -> country city `elem` europeanCountries) allCities

getAsianCountries :: [City]
getAsianCountries = filter (\city -> country city `elem` asianCountries) allCities