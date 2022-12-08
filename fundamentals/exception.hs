{-- 
  This module shows how to handle exceptions in Haskell.
--}
import Control.Exception
import System.IO.Error

main :: IO ()
main = do
  {--
    If readFile raises an exception, try function cathces that
    and returns a Left value. Otherwise, it returns a Right value.
  --}
  result <- try (readFile "not_found.txt")
  case result of
    Left e -> errorHandler e
    Right contents -> putStrLn contents

{--
  Error handler function that can handle different types of errors.
--}
errorHandler :: IOError -> IO ()
errorHandler e
  | isDoesNotExistError e = putStrLn "The file doesn't exist!"
  | otherwise = putStrLn "Unknown error!"