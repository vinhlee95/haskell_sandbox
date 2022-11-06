import Data.List
import System.IO

-- Int
maxInt :: Int
maxInt = minBound

sumOfNums :: Integer
sumOfNums = sum [1..3] -- 6

-- Some math functions
floorVal = floor 9.999 -- 9
ceilingVal = ceiling 9.6666 -- 10
roundVal = round 9.6666 -- 10

-- Boolean
trueAndFalse = True && False -- False
trueOrFalse = True || False -- True

-- List
oddNumbers = [1, 3, 5, 7]
evenNumbers = [2, 4, 6, 8]
allNumbers = oddNumbers ++ evenNumbers -- [1, 3, 5, 7, 2, 4, 6, 8]

-- Bind items to a list
bindOddNumbers = 1 : 3 : 5 : 7 : []

-- Revert
revertOddNumbers = reverse oddNumbers -- [7, 5, 3, 1]

-- Check if a list is empty
isEmpty = null oddNumbers -- False

-- Get the first item of a list
firstItem = head oddNumbers -- 1

-- Get the last item of a list
lastItem = last oddNumbers -- 7

-- Get the second item of a list
secondItem = oddNumbers !! 1 -- 3

-- Get the third item of a list
thirdItem = oddNumbers !! 2 -- 5

-- Get the first 2 items of a list
firstTwoItems = take 2 oddNumbers -- [1, 3]

-- Check if a number is in a list
is2InList = 2 `elem` oddNumbers -- False

-- Get max value of a list
maxNumber = maximum oddNumbers -- 7
minNumber = minimum oddNumbers -- 1

-- Get the sum of a list
sumOfNumbers = sum oddNumbers -- 16

-- Get the product of a list
productOfNumbers = product oddNumbers -- 105

listTimes2 = [x * 2 | x <- oddNumbers] -- [2, 6, 10, 14]

-- Multiple filters
listTimes2AndLessThan20 = sort [x * 2 | x <- [1, 3, 5, 11, 9, 7, 13], x * 2 <= 20]

-- Tuple
fooDetails = ("Foo", 12)
fooName = fst fooDetails
fooAge = snd fooDetails

-- Zip
names = ["Foo", "Bar", "Baz"]
ages = [20, 22, 18]
nameAndAge = zip names ages
_fooName = fst (nameAndAge !! 0)
_fooAge = snd (nameAndAge !! 0)

-- Tuple
myTuple = [(1,2),(3,4),(5,6)]
-- This would fail:
-- my_tuple = [(1,2),(3,4),(5,6,7)]

-- This also fails:
_myTuple = [(1, 2),(3,4),(5,"six")]