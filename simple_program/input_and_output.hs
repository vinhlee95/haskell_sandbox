main = do  
  putStrLn "Hello, what's your first name?"
  firstName <- getLine
  putStrLn "What's your last name?"
  lastName <- getLine
  let fullName = firstName ++ " " ++ lastName
  putStrLn $ "Hey " ++ formatName fullName ++ ", you rock!"

formatName :: String -> String
formatName name = "Super " ++ name