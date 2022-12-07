import System.IO

-- Simple program to read content of a file
-- Usage runghc main.hs

-- Using openFile
_main = do 
  {--
    Form an IO Handle and bind it to "handle" variable.
    data IOMode = ReadMode | WriteMode | AppendMode | ReadWriteMode  
  --}
  handle <- openFile "input.txt" ReadMode
  {--
    hGetContents takes in a Handle, to tell it which file to read from,
    and return an IO String.
    Similar to getContents, hGetContents won't attempt to read the file at once 
    and store it in memory, but it will read it when needed -> avoid choking up memory.

    hGetContents :: Handle -> IO String
  --}
  contents <- hGetContents handle
  putStr contents
  -- close the file after printing the content
  hClose handle

-- Using withFile
__main = do 
  withFile "input.txt" ReadMode (\handle -> do
    contents <- hGetContents handle
    putStrLn contents
    hClose handle)

-- Handier solution using readFile
-- where we don't have to manually close the file
main = do
  contents <- readFile "input.txt"
  putStrLn contents