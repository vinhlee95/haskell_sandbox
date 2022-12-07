-- Simple program to detect palidrome words and print them
-- Usage: cat input.txt | runghc main
main = interact $ unlines . map(\word -> if isPalindrome word then "palindrome: " ++ word else "not palindrome: " ++ word) . lines
  where isPalindrome word = word == reverse word