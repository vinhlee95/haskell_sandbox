-- The Eq typeclass provides an interface for testing for equality. 
checkEqual :: (Eq a) => a -> a -> Bool
checkEqual a b = a == b

result = checkEqual 1 1

-- Use case: add an integral and a floating point number
myIntegralNumber :: Integral a => a
myIntegralNumber = 2

-- This would fail:
-- sum = myIntegralNumber + 2.5
mySum :: Double
mySum = fromIntegral myIntegralNumber + 2.5

-- About fromIntegral:
-- fromIntegral :: (Num b, Integral a) => a -> b



