alwaysReturnTrue :: Bool
alwaysReturnTrue = True

main :: IO ()
main = do
  putStrLn $ if alwaysReturnTrue then "OK" else "FAILED"
  return()
