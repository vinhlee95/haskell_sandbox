import System.IO
import Data.List (delete)
import System.Directory (removeFile, renameFile, removeDirectory)

{-- 
  Program to:
  - Print out all todos from a file with ordering
  - Ask which todo should be deleted
  - Delete the todo from the file
--}
main = do
  {--
    First, read todos file and print all todos
  --}
  contents <- readFile "todos.txt"
  let allTodos = lines contents

  putStrLn "Here are all your todos:"
  putStrLn $ unlines $ formatTodosWithOrder allTodos
  -- Equivalent to:
  -- putStrLn (unlines (formatTodosWithOrder (lines contents)))

  putStrLn "Which todo would you like to delete (enter the number)?"
  deletingIndexString <- getLine
  let deletingIndex = read deletingIndexString
      newTodoItems = delete (allTodos !! deletingIndex) allTodos

  -- Create a new temp file
  (tempName, tempHandle) <- openTempFile "." "temp"
  -- Write updated todos to temp file
  hPutStr tempHandle $ unlines newTodoItems
  -- Close temp file
  hClose tempHandle
  
  -- Remove existing file
  removeFile "todos.txt"
  renameFile tempName "todos.txt"
  

formatTodosWithOrder :: [String] -> [String]
formatTodosWithOrder = zipWith (\n line -> show n ++ " - " ++ line) [0..]