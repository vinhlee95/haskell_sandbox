import System.Environment
import System.IO
import Data.Maybe (isNothing)
import Data.List (intercalate, delete)
import System.Directory


{-- 
  Program that can perform multiple actions on a list of todos.

  Example usage:
  Add a new todo
  - main add todos.txt "add a new todo"
  View todo list
  - main view todos.txt
--}

main = do
  (command:args) <- getArgs
  let action = lookup command dispatch
  case action of
    Nothing -> putStrLn $ "Invalid action. Supported actions are: " ++ show (intercalate ", " validActions)
    Just action -> action args

dispatch :: [(String, [String] -> IO ())]
dispatch = [
  ("view", viewTodosHandle),
  ("add", addTodosHandle),
  ("remove", removeTodosHandle)]
validActions :: [String] = map fst dispatch

viewTodosHandle :: [String] -> IO ()
viewTodosHandle args = do
  let fileName = head args
  viewTodos fileName

viewTodos :: String -> IO ()
viewTodos fileName  = do 
  contents <- readFile fileName
  -- Insert order number before each todo
  let todos = zipWith (\n line -> show n ++ " - " ++ line) [0..] (lines contents)
  putStrLn "Here are your todos:"
  -- Print all todos
  putStrLn $ unlines todos

addTodosHandle :: [String] -> IO ()
addTodosHandle args = do
  [fileName, todo] <- return args
  addTodo fileName todo
  putStrLn "Todo added."
  viewTodos fileName

addTodo :: String -> String -> IO ()
addTodo fileName todo = do
  -- get all current todos
  contents <- readFile fileName
  -- append new todo to the end of the list
  let currentTodos = lines contents
  let newTodos = currentTodos ++ [todo]
  -- create temporary file
  (tempName, tempHandle) <- openTempFile "." "temp"
  -- write new todos to temporary file
  hPutStr tempHandle $ unlines newTodos
  -- close temporary file
  hClose tempHandle
  -- remove original file
  removeFile fileName
  -- rename temporary file to original file
  renameFile tempName fileName
  

removeTodosHandle :: [String] -> IO ()
removeTodosHandle args = do
  [fileName, todoNumber] <- return args
  removeTodo fileName (read todoNumber)
  putStrLn "Todo removed."
  viewTodos fileName

removeTodo :: String -> Int -> IO ()
removeTodo fileName todoNumber = do
  -- get all current todos
  contents <- readFile fileName
  -- remove todo at given index
  let currentTodos = lines contents
  -- delete todo at given index
  let newTodos = delete (currentTodos !! todoNumber) currentTodos
  -- create temporary file
  (tempName, tempHandle) <- openTempFile "." "temp"
  -- write new todos to temporary file
  hPutStr tempHandle $ unlines newTodos
  -- close temporary file
  hClose tempHandle
  -- remove original file
  removeFile fileName
  -- rename temporary file to original file
  renameFile tempName fileName