module Main (main) where

import System.Random
import Control.Monad(when)  

main :: IO ()
main = do  
  gen <- getStdGen  
  askForNumber gen  
  
askForNumber :: StdGen -> IO ()  
askForNumber gen = do  
  {--
  gen: a RandomGen value (i.e. a value that can be used as a random number generator). 
  randomR returns a tuple containing the generated random value and a new RandomGen value.
  --}
  let (randNumber, newGen) = randomR (1,10) gen :: (Int, StdGen)  
  putStr "Which number in the range from 1 to 10 am I thinking of? "  

  numberString <- getLine  
  
  when (not $ null numberString) $ do  
    let number = read numberString  
    if randNumber == number   
      then putStrLn "You are correct!"  
      else putStrLn $ "Sorry, it was " ++ show randNumber  

    askForNumber newGen  