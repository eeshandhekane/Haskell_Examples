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
	We usually prefer to have 2-sized tuples, which can be accessed easily
	Multiple sized tuples can not be accessed like this
-}

tuple1 = (1, 'A', "Eeshan", 'b', -3.14)

-- Two-sized tuples can be accessed by special commands 'fst', 'snd'
tuple2 = ("Eeshan", 25)
firstOfTuple1 = fst tuple2
secondOfTuple1 = snd tuple2


{-
	Simple functions in the Haskell compiler ghc:
	let multiplyBy7 x = x * 7 -- This is how the function is defined inline
	let valX = 3
	multiplyBy7 valX -- Outputs 21
-}


{-
	We can write the main function, which chains all the inside stuff
	It is then automatically executed
	It needs to start with a "main = do"
-}


{-
	The ":t" that we dud inside the console was a type-declaration
	We can define a type by listing out the following:
	The types of the arguments that it inputs and the type of THE output
	The function definition is: <fn_name> <arg_1> ... <arg_n> = <processing>
-}

-- A new type 'addMe'. First two 'Int' represent types of 2 int inputs and the last is int output
addMe :: Int -> Int -> Int
-- After defining the type, we can define the function itself
addMe x y = x + y
-- Now, ":t addMe" in compiler works: "addMe :: Int -> Int -> Int"
-- We can do "addMe 3 4" in the compiler to get the answer of 7


{-
	However, type declaration is not required
	If we are clear in the definition, the type inference is going to be automatic
-}

sumMe x y = x + y
-- Now, "sumMe 3.14 (-1.14)" gives 2.0. Thus, the definition only works
-- The automatic type inference is there: ":t sumMe" gives "sumMe :: Num a => a -> a -> a"


{-
	We can declare types that are more complex
-}

add2DVectors :: (Double, Double) -> (Double, Double) -> (Double, Double)
add2DVectors (x1, y1) (x2, y2) = (x1 + x2, y1 + y2)
-- "add2DVectors (1, 2) (3, 4)" leads to "(4.0,6.0)"


{-
	We can perform if-else and switch with types!
-}

messager :: Int -> String

messager 16 = "You can drive"
messager 18 = "You can vote"
messager 21 = "You can drink"
messager _ = "Nothing special"


{-
	Recursion in Haskell
-}

-- type-declaration (for the sake of completeness and safe-code)
factorialType :: Int -> Int
factorialType 0 = 1 -- Base case
factorialType n = n*factorialType(n - 1) -- Recursion
-- It does not confuse that when 0 is passed, it does not perform 0*factorialType(-1)

-- Non-recursion way is to perform product for n >= 1
recursion1 n = foldl (*) 1 [1..n]
recursion2 n = foldr (*) 1 [1..n]
recursion3 n = product [1..n]


{-
	We need to have branching based on the inputs
	The earlier if-else and switch were not viable for inputs and conditions on it
	This is achieved via 'Guards'
	Guards hold conditions that can be combined
-}

-- Define odd/even type-declaration
isEven :: Int -> Bool
-- Define the function
isEven n
	| n `mod` 2 == 0 = True
	| n `mod` 2 == 1 = False

-- We can define with 'otherwise'
isOdd :: Int -> Bool
isOdd n 
	| n `mod` 2 == 1 = True
	| otherwise = False

-- Shortened versions without guards
isEvenShort n = n `mod` 2 == 0
isOddShort n = n `mod` 2 == 1

-- Schooling
getSchoolSystem :: Int -> String
getSchoolSystem n
	| n > 5 && n < 7 = "Go to Kindergarten"
	| otherwise = "Go to college"

 
{-
	Guards are evaluated from the top to the bottom
	Thus, we can write exclusive guards that act as exclusive else-if
	We can use auxiliary variables for the guards with 'while' clause
-}

-- Calculate K/D ratio of CSGO!
calculateKDRatio :: Double -> Double -> String
calculateKDRatio kills deaths
	| ration < 1 = "Okay"
	| ration < 1.5 = "Good"
	| otherwise = "Excellent"
	where ration = (kills)/(deaths + 0.001) -- It MUST be 0.001, not .001


{-
	The types of listed items for type-declaration are as follows
-}

-- Get a list of ints and show messages
listOfNumbersExample :: [Int] -> String
listOfNumbersExample [] = "The list is empty!"
listOfNumbersExample (x:[]) = "The list is a singleton with entry " ++ show x -- 'show' converts anything to String
listOfNumbersExample (x:y:[]) = "The list has two entries: " ++ show x ++ " and " ++ show y
listOfNumbersExample (x:xRest) = "The first item is: " ++ show x ++ " and the rest is:\n" ++ listOfNumbersExample xRest


{-
	The 'as' pattern is another option, which allows to capture certain patterns
-}

-- Get first item from a string
getFirstItemFromString :: String -> String
getFirstItemFromString [] = "The string is empty!"
getFirstItemFromString everything@(x:xRest) = "The string <" ++ everything ++ "> starts with " ++ show x ++ " and the rest is " ++ show xRest



{-
	Higher order functions can be composed with maps
	Higher order functions involves passing of functions as examples
-}

-- 'map' allows application of a function to all items of a list
multBy7 x = x * 7
tableOf7 = map multBy7 [1..10]

-- Making a map
multBy7Map :: [Int] -> [Int]
multBy7Map [] = []
multBy7Map (x:xRest) = multBy7 x : multBy7Map(xRest) -- ':' represents list concatenation


{-
	Strings can be considered as the list of characters
-}

-- Type-declaration
areStringsEqual :: [Char] -> [Char] -> Bool
areStringsEqual [] [] = True -- Base case
areStringsEqual (x1:x1Rest) (x2:x2Rest) = x1 == x2 && areStringsEqual x1Rest x2Rest
areStringsEqual _ _ = False -- Default


{-
	We can pass functions as arguments to another function!
	It is quite clear that how this can be done--
	We just need to parenthesize the correct types!
-}

-- A function that inputs a function that does the multiplication
-- Define the function that needs to be passed
multiplyBy11Fn :: Int -> Int
multiplyBy11Fn x = x*11
-- Define the complex function: It inputs a function that multiplies by 11 and the number to be multiplied with 11
doMultiplication :: (Int -> Int) -> Int
doMultiplication x = x 3 -- We want to multiply 3 with the function
-- Store the result
multiply3With11 = doMultiplication multiplyBy11Fn


{-
	Haskell also allows to return a function
	We just need to have the correct type-declaration for the inpts and the outputs
-}

-- We want to input an integer x and obtain a function that adds x to every input
getFunctionToAddX :: Int -> (Int -> Int)
-- Define a function to add a particular number to the input
getFunctionToAddXAndY x y = x + y
getFunctionToAddX x = getFunctionToAddXAndY x -- The trick is to define the total function and pass insufficient arguments!
-- Get a function to add 3
getFunctionToAdd3 = getFunctionToAddX 3
threeAddedToFour = getFunctionToAdd3 4 -- Outputs 7!

-- We can further map this function onto a list in order to extend it with map
add3ToList = map getFunctionToAdd3 [1..10]


{-
	Lambda's are functions with no-name!
	A lambda is defined inside the parentheses using dummy variable with a /
	Thus, an example is "(\x -> x**2)" for a lambda function for squaring
-}

-- Define a lambda
lambdaDoubleX = (\x -> x*2)
-- Map a lambda
double1To10 = map lambdaDoubleX [1..10]


{-
	The comparison/logical operators: >, <, ==, <=, >=, /= (not equal)
	'if' is available in Haskell, even tbough it is not used that much
	'if' has to have an 'else' and has the format: "if <condition> then <statements1> else <statements2>"
-}

-- Double only even numbers
doubleEvenNums :: Int -> Int
doubleEvenNums x = if (x `mod` 2 == 0) then x * 2 else x
doubleEvenNumsFrom1To10 = map doubleEvenNums [1..10]


{-
	We can also write 'switch' cases in Haskell
	A switch case has the format: "case <switch_var> of <val_1> -> <statements_1> <val_2> -> <statements_2> ..." 
-}

-- Get the class
getClass :: Int -> String
getClass n = case n of
	5 -> "Small"
	6 -> "Medium"
	_ -> "Big" -- default


{-
	Modules contain functions and can be included with 'import'
	At the top of this file, add the line--
	"module <module_name> (<fn_1>, <fn_2>, ...) where <definition_fn_1> <definition_fn_2> ..."
	In the current file, we add the line--	
	"import <module_name>"
-}


{-
	We can also create enumerated-type, which is a list of possible types
-}

-- This is achieved by creating data
data FootballPlayer = 	Attacker 
					|	Midfielder
					|	Defender
					|	Goalkeeper
					deriving Show

-- Now, we can create a type-declaration that can take values from above
christianoRonaldo :: FootballPlayer -> Bool
christianoRonaldo Attacker = True
christianoRonaldo _ = False
-- In compiler, we get "christianoRonaldo Attacker"->"True", "christianoRonaldo Midfielder"->"False", "christianoRonaldo Defender"->"False", "christianoRonaldo Goalkeeper"->"False"


{-
	Haskell allows for custom data-types, the types with different values
	It is similar to structs
-}

-- Define a customer type with name (String), address (String) and balance (Double)
data Customer = Customer String String Double
	deriving Show

eeshanDhekane :: Customer
eeshanDhekane = Customer "Eeshan Gunesh Dhekane" "3239, Av. Appleton" 20.00

-- Type-declare functions to get the name of the customer
getCustomerName :: Customer -> String
getCustomerAddress :: Customer -> String
getCustomerBalance :: Customer -> Double

-- Definition of the functions in a clever manner! We need to specify the customer, right!?
getCustomerName (Customer name _ _) = name
getCustomerAddress (Customer _ address _) = address
getCustomerBalance (Customer _ _ balance) = balance

-- Example
eeshanName = getCustomerName eeshanDhekane
eeshanAddress = getCustomerAddress eeshanDhekane
eeshanBalance = getCustomerBalance eeshanDhekane


{-
	Multiple versions of a type can also be achieved
-}

-- Define a shape
data Shape = Circle Float Float Float | Rectangle Float Float Float Float
	deriving Show

-- Define type-declaration for a function that compute the area of the shape
areaOfShape :: Shape -> Float
areaOfShape (Circle _ _ radius) = pi * radius ** 2
areaOfShape (Rectangle x1 y1 x2 y2) = ( abs (x2 - x1) )*( abs (y2 - y1) )
-- areaOfShape (Rectangle x1 y1 x2 y2) = ( abs $ x2 - x1 )*( abs $ y2 - y1 ) -- '$' is also used

rectangleEx = Rectangle 1 2 3 5
circleEx = Circle 1 2 3
areaOfRectangleEx = areaOfShape rectangleEx
areaOfCircleShape = areaOfShape circleEx


{-
	'.' operator allows chaining of functions, as in the usual COMPOSITION
	Also, '$' replaces lots of brackets
-}

-- Display 1 + 2
sumVal = putStrLn ( show (1 + 2) ) -- or, putStrLn ( show $ 1 + 2 )-- The content to the right of '$' is calculated first
-- OR, with '.' operator, we have--
sumValAnother = putStrLn . show $ 1 + 2


{-
	Type-classes: Num, Show etc. are examples
	They correspond to sets of types with pre-defined operations
-}

-- Create a custom data type
data Employee = Employee {
	name :: String,
	position :: String,
	idNumber :: Int
} deriving (Eq, Show) -- We want to check equality and show the employees.

-- Create examples
eeshanDhekaneEmployee = Employee {name = "Eeshan", position = "Researcher", idNumber = 10}
eeshanDhekaneEmployeeClone = Employee {name = "Eeshan", position = "Researcher", idNumber = 10}
sourishDhekaneEmployee = Employee {name = "Sourish", position = "Researcher/Scientist", idNumber = 11}

-- Check equality
isEeshanEqualToEeshanClone = eeshanDhekaneEmployee == eeshanDhekaneEmployeeClone
isEeshanEqualToSourish = eeshanDhekaneEmployee == sourishDhekaneEmployee

-- Show data!
eeshanData = show eeshanDhekaneEmployee
sourishData = show sourishDhekaneEmployee

-- Create data type
data OfficeSize = S | M | L -- 'officeHead' is malformed! 

-- We can override the equality
instance Eq OfficeSize where
	S == S = True
	M == M = True
	L == L = True
	_ == _ = False

-- We can override the show
instance Show OfficeSize where
	show S = "The office size is small"
	show M = "The office size is medium"
	show L = "The office size is large"

-- Examples 
isSmallOfficeAvailable = S `elem` [S, L, M] -- `elem` checks if the entry is an instance of the list
office1 = show S
office2 = show L
office3 = show M


{-
	Classes: We can define our own class
-}

-- Define an equality class by our own
class MyEqual a where

	-- 'a' is any type that implements 'areEqual'
	areEqual :: a -> a -> Bool

-- Create an instance of MyEqual inside OfficeSize
instance MyEqual OfficeSize where
	areEqual S S = True 
	areEqual L L = True 
	areEqual M M = True 
	areEqual _ _ = False 

isMEqualToMUnderMyEqual = areEqual M M
isSEqualToMUnderMyEqual = areEqual S M


{-
	IO allows us to input/output
	We will use 'do' that allows chaining
-}

dialogueFunction = do
	putStrLn "What is your name?"
	name <- getLine
	putStrLn ("Hello " ++ show name ++ "!")

-- In compiler, run this function!

-- To write to a file
writeToAFileFunction = do
	theFile <- openFile	"WriteFile.txt" WriteMode
	putStrLn "What is your name?"
	name <- getLine
	putStrLn ("Hello " ++ show name ++ "!")
	hPutStrLn theFile ("Example of content written to the file")
	hPutStrLn theFile ("Hello " ++ show name ++ "!")
	hClose theFile

-- To read a file
readFromAFileFunction = do
	theFile <- openFile "WriteFile.txt" ReadMode
	contents <- hGetContents theFile
	putStrLn contents
	hClose theFile


{-
	Example: Fibonacci Sequence
-}

aList = 1:2:3:4:[]
tailOfAList = tail aList
fibonacciSequence = 1 : 1 : [a + b | (a, b) <- zip fibonacciSequence (tail fibonacciSequence)]
first10FibonacciNumbers = take 10 fibonacciSequence