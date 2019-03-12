{--------------------------------------
 -  Basic Functions
 --------------------------------------}

-- Calling a function
--    No parenthesis
sqrt 3   -- 1.73205080757  
max 5 7  -- 7
max (5+2) (sqrt 17)  -- 7

-- Defining functions
--    No parentheses around parameters
--    No "return" keyword
square x = x * x

-- Defining functions with multiple parameters
-- multiplies the largest of a and b by x
multMax a b x = (max a b) * x

-- Simple Conditionals
--    No parentheses around condition
--    No return statements
posOrNeg x =
   if x >= 0
   then "Positive"
   else "Negative"


{--------------------------------------- 
 -  Pure Functions
 --------------------------------------}

-- All Haskell functions are pure.
--    Cannot modify state
--    Cannot depend on state
--    Given th same arguments, always returns the same output


{--------------------------------------- 
 -  Recurstion
 --------------------------------------}

-- pow2 n = 2 to the power of n
pow2 n = 
   if n == 0
   then 1
   else 2 * (pow2 (n-1))

-- More recursion
repeatString str n =
   if n == 0
   then ""
   else str ++ (repeatString str (n-1))

-- Recurstion replaces loops
pow2 n = pow2loop n 1 0
pow2loop n x i =
   if i < n
   then pow2loop n (x*2) (i+1)
   else x

{---------------------------------------
 - Lists
 --------------------------------------}
x = [1,2,3]
empty = []

y = 0 : x   -- [0,1,2,3]

x'  = 1 : (2 : (3 : [] ))  -- [0,1,2,3]
x'' = 1 : 2 : 3 : []       -- [0,1,2,3]

-- Strings
str = "abcde"
str' = 'a' : 'b' : 'c' : 'd' : 'e' : []

-- Concatenate Lists
[1,2,3] ++ [4,5]     -- [1,2,3,4,5]
"hello" ++ "world"   -- "hello world"

-- Homogeneous Lists
--    error = [1, "hello", 2]


{---------------------------------------
 - List Functions
 --------------------------------------}

-- Accessing Lists
head [1,2,3]         -- 1
tail [1,2,3]         -- [2,3]
head (tail [1,2,3])  -- 2

-- Testing for empty list
null []     -- True
null [1,2]  -- False

--  List functions
double nums =
   if null nums
   then []
   else (2 * (head nums) : (double (tail nums)))

removeOdd nums = 
   if null nums
   then []
   else
      if (mod (head nums) 2) == 0
      then (head nums) : (removeOdd (tail nums))
      else removeOdd (tail nums)

{---------------------------------------
 - Tuples
 --------------------------------------}

-- Tuples
x = (1 , "hello")
y = ("pi", 3.14159, [1,2,3], "four")

-- Returning tuples
headAndLenght list = (head list, length list)

-- Accessing tuples
fst (1, "hello")  -- 1
snd (1, "hello")  -- "hello"  

{-
 - Pattern Matching 
 -}

-- Pattern Matching
fst' (a,b) = a
snd' (a,b) = b

-- Pattern Matching Lists
null' [] = True
null' (x : xs) = False

head' (x : xs) = x
head' [] = error "head of empty list"

-- Using Pattern Matching 
double nums = 
   if null nums
   then []
   else (2 * (head nums)) : (double (tail nums)))

double [] = []
double (x : xs) = (2 * x) : (double xs)


{---------------------------------------
 - Guards
 --------------------------------------}

-- Guards
--    No "=" before guards
--    "|" before each guard
pow2 n
   | n == 0    = 1
   | otherwise = 2 * (pow2 (n-1))

removeOdd nums =
   if null nums
   then []
   else
      if (mod (head nums) 2) == 0
      then (head nums) : (removeOdd (tail nums))
      else removeOdd (tail nums)

removeOdd [] = []
removeOdd (x : xs)
   | mod x 2 == 0 = x : (removeOdd xs)
   | otherwise    = removeOdd xs   


{---------------------------------------
 - Case Expressions
 --------------------------------------}

-- Case expressions
--    No guards in case expressions
double nums = case nums of
   []       -> []
   (x : xs) -> (2 * x) : (doulbe xs)

anyEven nums = case (removeOdd nums) of
   []       -> False
   (x : xs) -> True


{---------------------------------------
 - Let and Where
 --------------------------------------}

-- Let Binding
fancySeven = 
   let a = 3
   in 2 * a + 1

fancyNine = 
   let x = 4
       y = 5
   in x + y

numEven nums =
   let evenNums = removeOdd nums
   in length evenNums

-- Where Binding
fancySeven = 2 * a + 1
   where a = 3

fancyNine = x + y
   where x = 4
         y = 5

-- Where vs Let binding
--    "where" goes with a function definition

-- fancyTen = 2 * (a + 1 where a = 4)  -- error
fancyTen = 2 * (let a = 4 in a + 1)    -- ok

--    where - top down
--    let   - bottom up

{-
 - Lazy Function Evaluation
 - -}

-- No order of execution
-- Function can not finish execution

-- Lazy infinite lists
intsFrom n = n : (intsFrom (n+1))
ints = intsFrom 1

null ints      -- False
head ints      -- 1
take 10 ints   -- [1,2,3,4,5,6,7,8,9,10]
-- length ints -- hangs

evenInts = removeOdd ints
take 10 evenInts  -- [2,4,6,8,10,12,14,16,18,20]

