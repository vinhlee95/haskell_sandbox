import System.IO
import Data.Char
import System.Directory (removeFile, renameFile)

{--
  Using appendFile to append stuffs into a file.
  Following program append new todo (input from terminal) to todos.txt file.
--}
_main = do
  todo <- getLine
  appendFile "todos.txt" (todo ++ "\n")

{--
  Using writeFile to override the file (truncate then add new content)
  Following program override todos.txt with whatever content that we want.
--}
main = do
  existingTodos <- readFile "todos.txt"
  -- Write content to the new file
  writeFile "new_todos.txt" (map toUpper existingTodos) 
  -- Remove existing todos
  removeFile "todos.txt"
  -- Rename new todo file
  renameFile "new_todos.txt" "todos.txt"



