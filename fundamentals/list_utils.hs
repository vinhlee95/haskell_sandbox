import Data.List
import Data.Maybe (isNothing, fromMaybe)

-- Flatten a list
nestedList = [[1, 2], [3, 4]]
flattenList = concat nestedList -- [1, 2, 3, 4]

-- Check if all items in the list match the condition
-- Similar to .every() in JS
isAllGreaterThan10 = and $ map (>10) [9..20] -- False
_isAllGreaterThan10 = all (>10) [9..20]

-- Check if at least 1 item match the condition
-- Similar to .some() in JS
hasFooInTheList = or $ map (=="foo") ["foo", "bar", "baz"]
_hasFooInTheList = any (=="foo") ["foo", "bar", "baz"]

-- Find item in the list
printIfGreaterThan :: Integer -> [Integer] -> IO ()
printIfGreaterThan x xs
  | isNothing result  = putStrLn $ "no item greater than " ++ show x
  | otherwise         = putStrLn $ "first item in the list greater than " ++ show x ++ " is " ++ show result
  where result = find (>x) xs

-- Union 2 list and remove duplicated items
from1To10 = [1..7] `union` [5..10]
