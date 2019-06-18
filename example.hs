-- This is a single line comment

{-
	This is a multi-line comment
-}


-- Import modules, which are a bunch of functions!
import Data.List
import System.IO


{-
	Haskell uses type-inference
	It decides data-type based on the value stored
	Once a type is decided, we can not change: Static Typing
	We can define the type of the data
-}


{-
	Int: Whole numbers from -2^63 to 2^63
	Integer: Unbounded whole number (as big as the memory can hold)
	Flaot: Single precision floating point numbers
	Double: Double precision floating point with 11 point precision
		Add 0 before the floating point if no integer component
	Bool: True or False
	Char: Single unicode chars denoted with ''
	Tuple: List made of different data-types. Mostly contains 2 values
-}

-- Checking max/min of Int
maxInt = maxBound :: Int
minInt = minBound :: Int


{-
	Permanantly assigned values:
		always5 :: Int
		always5 = 5
	This will never change the value with the defined type
-}

always5 :: Int
always5 = 5


{-
	Sum of numbers from 1 to 10 and 1..10 is automatically a list
	Basic math is included
-}

sumOfNums = sum [1..10]
addNums = 3 + 4
subNums = 3 - 4
mulNums = 3 * 4
divNums = 3 / 4

-- Adding of negative numbers requires brackets if at second argument
addNegNums1 = 3 + (-4) -- -1
addNegNums2 = (-3) + 4 -- 1
addNegNums3 = -3 + 4 -- 1


{-
	Some functions are included as prefix functions
	An example is the modulus/remainder operator
	However, we add back-ticks to convert it to 'standard' use
	This is called the in-fix operator
-}

remNums = mod 3 4
remNumsAnother = 3 `mod` 4


{-
	To check on a function, type ":t <name_fn>" in the compiler
	A message pops up showing the details of the function
	E.g. ":t mod" leads to "mod :: Integral a => a -> a -> a"
	E.g. ":t sqrt" leads to "sqrt :: Floating a => a -> a"
-}

-- Square-rooting an integer
num9 = 9::Int
sqrtOfNum9Float = sqrt(fromIntegral num9)


{-
	There are a lot of in-built math functionality
	The - signed operands are inside parentheses if at non-first place
	Other functionality: sin/cos/tan/asin/acos/atan/sinh/cosh/tanh/
		asinh/acosh/atanh
-}

res1 = pi
res2 = exp 1
res3 = log 9
res4 = 2**4
res5 = truncate 9.9999
res6 = round 9.9999
res7 = ceiling 9.9999
res8 = floor 9.9999
res9 = truncate (-9.9999)
res10 = round (-9.9999)
res11 = ceiling (-9.9999)
res12 = floor (-9.9999)


{-
	There are in-build logical operators
-}

trueAndFalse = True && False
trueOrFalse = True || False
notTrue = not(True)


{-
	":t" for basic functions is achieved by parenthesization
	E.g.: ":t (+)" leads to "(+) :: Num a => a -> a -> a"
	E.g.: ":t truncate" leads to "truncate :: (RealFrac a, Integral b) => a -> b"
-}


{-
	Lists are crucial
	They can be constructed, concatenated, and manipulated  as follows
-}

-- Concatenation
primeList = [2, 3, 5, 7]
addPrimeList = [11, 13]
netPrimeList = primeList ++ addPrimeList

-- Construction with [] to show end of list
myPrimeList = 43 : 47 : []

-- List appending
newPrimeList = [netPrimeList, myPrimeList]

-- List length
lenNewPrimeList = length newPrimeList

-- List reverse
revNewPrimeList = reverse newPrimeList

-- Indexing
elt0OfNewPrimeList = newPrimeList !! 0
elt1OfNewPrimeList = newPrimeList !! 1
-- elt2OfNewPrimeList = newPrimeList!!2 -- *** Exception: Prelude.!!: index too large

-- First/last of the list
elt00 = head elt0OfNewPrimeList
elt11 = last elt1OfNewPrimeList

-- Taking and removing (NOT INPLACE!)
first4OfElt00 = take 3 elt0OfNewPrimeList
lastOfElt00 = drop 3 elt0OfNewPrimeList
allButLastOfElt00 = init elt0OfNewPrimeList

-- Checking entry
is8inList = elem 8 elt0OfNewPrimeList
is8inListAnother = 8 `elem` elt0OfNewPrimeList
is7inList = elem 7 elt0OfNewPrimeList
is7inListAnother = 7 `elem` elt0OfNewPrimeList

-- Maximum/minimum/sum/product
maxOfElt0OfNewPrimeList = maximum elt0OfNewPrimeList
minOfElt0OfNewPrimeList = minimum elt0OfNewPrimeList
sumOfElt0OfNewPrimeList = sum elt0OfNewPrimeList
prdOfElt0OfNewPrimeList = product elt0OfNewPrimeList

-- Ranges
zeroToTenList = [0..10] -- BOTH ENDS INCLUSIVE. Y U DO DIS!???
arithmeticProgressionList = [-5,4..7] -- DOES NOT WORK
evenNumList = [2,4..20] -- Gives arithmetic progression
allLettersList = ['A'..'Y']
allOtherLettersList = ['A','C'..'Y']


{-
	Haskell is lazy implemented and thus, allows infinite lists
	It only calculates them as and when they are needed
-}

infiniteArithmeticList = [10,30..] -- Upon running in the compiler, it flies off!
elt7000OfInfiniteArithmeticList = infiniteArithmeticList !! 7000 -- 140010
repeatValueList = take 10 (repeat 7) -- List of 10 number of 7's
repeatValueListAnother = replicate 10 7 -- Same as the above
chunkFromCycle = take 10 (cycle [1, 2, 3, 4, 5, 6, 7]) -- cycle repeats the given list indefinitely


{-
	Haskell allows functional creation of lists from other lists
-}

squaredElementsList = [x ** 2 | x <- [2, 4..10]]
squaredElementsSmallerThan50List = [x ** 2 | x <- [2, 4..10], x ** 2 <= 50] -- Multiple conditions!
elementsDivisibleBy7And13List = [x | x <- [1..1000],  x `mod` 7 == 0 && x `mod` 13 == 0]


{-
	We can sort lists
-}

randomList = [323, 4453, 52345, 23, -45354]
sortedRandomList = sort randomList


{-
	Haskell provides with a very powerful function called 'zipWith'
	One of the usage is to process two input lists with the provided operator
	We have: ":t zipWith" leads to "zipWith :: (a -> b -> c) -> [a] -> [b] -> [c]"
-}

-- Sum of lists
myList11 = [1..5] -- Note that the shapes do not match!!
myList12 = [10..15] -- Note that the shapes do not match!!
addList1 = zipWith (+) myList11 myList12 -- [11.0,13.0,15.0,17.0,19.0]
subList1 = zipWith (-) myList11 myList12 -- [-9.0,-9.0,-9.0,-9.0,-9.0]
mulList1 = zipWith (*) myList11 myList12 -- [10.0,22.0,36.0,52.0,70.0]
divList1 = zipWith (/) myList11 myList12 -- [0.1,0.18181818181818182,0.25,0.3076923076923077,0.35714285714285715]


{-
	Haskell provides 'filter' to filter a list based on condition
-}

myList2 = [1..20]
largerThan10List = filter (>10) myList2


{-
	Haskell allows for while loop on a list based on a condition
	The loop tries to run on the list till the condition holds true
	As soon as the condition fails, it stops
-}

myList3 = [80..100]
smallerThan90List = takeWhile (<90) myList3


{-
	Haskell provides 'foldl' and 'foldr' for folding a list
	This refers to applying some function on all the elements of the list
-}

myList4 = [1..5]
allElementsProductStartingFrom1 = foldl (*) 1 myList4 -- 120
allElementsProductStartingFrom2 = foldl (*) 2 myList4 -- 240


{-
	List comprehension
-}

allPowersOfMinus1ListWrong = [-1^n | n <- [1..]] -- WRONG! Check it out! Always add parentheses to negative stuff
allPowersOfMinus1ListRight = [(-1)^n | n <- [1..]] 


{-
	Lists can be nested!
-}

oneToTenMultTable = [ [ x * y | y <- [1..10] ] | x <- [1..10] ]
oneToTenMultTableModified = [ [ x * y | y <- [1..x] ] | x <- [1..10] ]


{-
	Tuples are collections of random stuff
	We usually prefer to have 2-sized tuples
-}

tuple1 = (1, 'A', "Eeshan", 'b', -3.14)