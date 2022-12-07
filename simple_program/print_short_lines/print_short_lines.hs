-- A simple program that prints the lines of a file that are shorter than 10 characters.
-- Usage: cat print_short_lines_input.txt | runghc print_short_lines
-- Expected output: The lines of the file that are shorter than 10 characters.

_main = do
  contents <- getContents
  putStr (shortLinesOnly contents)

{--
  Using interact:
  interact takes a function of type String -> String as a parameter 
  and returns an I/O action that will take some input, 
  run that function on it and then print out the function's result.

  Signature: 
    interact String -> String :: IO ()
--}
__main = interact shortLinesOnly

shortLinesOnly :: String -> String
shortLinesOnly input = 
  let allLines = lines input
      linedWithValidLength = filter (\line -> length line < 10) allLines
      result = unlines linedWithValidLength
  in result

-- Extreme version using function composition
-- https://wiki.haskell.org/Function_composition
main = interact $ unlines . filter ((<10) . length) . lines
