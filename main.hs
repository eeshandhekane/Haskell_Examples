-- Import modules, which are a bunch of functions!
import Data.List
import System.IO


{-
	We can write the main function, which chains all the inside stuff
	It is then automatically executed
	It needs to start with a "main = do"
-}


main = do

	-- Display message
	putStrLn "What is your name?"

	-- Get input
	name <- getLine

	-- Display message
	putStrLn ("Hello " ++ name ++ "!!")

	{-
		We need to compile first
		Quit from ghc as ":q"
		Compile with "ghc --make <program_name>"
		The output file name is the program_name without .hs. Call it <name>
		Run as "./<name>"
	-}