import Data.Char

-- Usage: echo "hello world" | runghc capslocker.hs
-- Expected output: HELLO WORLD
main = do
  contents <- getContents
  putStrLn (map toUpper contents)
