-- Find max value of a list
maximum' :: (Ord a) => [a] -> a
maximum' [] = error "maximum of empty list"
maximum' [x] = x
maximum' (x:xs)
  | x > maxTail = x
  | otherwise = maxTail
  where maxTail = maximum' xs


-- Revert a list
revert' :: [a] -> [a]
revert' [] = error "cannot revert an empty list"
revert' [x] = [x]
revert' (x:xs) = revert' xs ++ [x]

-- Take element with index from a list
-- Example: take 3 [5, 4, 3, 2] -> [5, 4, 3]
take' :: (Num i, Ord i) => i -> [a] -> [a] 
-- Early-exit cases
take' n _  
    | n <= 0   = []  
take' _ []     = []
-- Recursion  
take' n (x:xs) = x : take' (n-1) xs  