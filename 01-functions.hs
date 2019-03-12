{--------------------------------------
   Basic Functions
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


{-------------------------------------- 
   Pure Functions
--------------------------------------}

-- All Haskell functions are pure.
--    Cannot modify state
--    Cannot depend on state
--    Given th same arguments, always returns the same output


{-------------------------------------- 
   Recurstion
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

{--------------------------------------
   Lists
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


{--------------------------------------
   List Functions
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

{--------------------------------------
   Tuples
--------------------------------------}

-- Tuples
x = (1 , "hello")
y = ("pi", 3.14159, [1,2,3], "four")

-- Returning tuples
headAndLenght list = (head list, length list)

-- Accessing tuples
fst (1, "hello")  -- 1
snd (1, "hello")  -- "hello"  

