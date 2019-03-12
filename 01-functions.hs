-- Calling a function

sqrt 3 
-- No parenthesis

max 5 7
-- 7

max (5+2) (sqrt 17)
-- 7

-- Defining functions

-- No parentheses around parameters
-- No "return" keyword
square x = x * x

-- Defining functions with multiple parameters

-- multiplies the largest of a and b by x
multMax a b x = (max a b) * x


-- Simple Conditionals
-- No parentheses around condition
-- No return statements
posOrNeg x =
   if x >= 0
   then "Positive"
   else "Negative"

--
-- Pure Functions
--

-- All Haskell functions are pure.
--    Cannot modify state
--    Cannot depend on state
--    Given th same arguments, always returns the same output


-- Recurstion

-- pow2 n = 2 to the power of n
pow2 n = 
   if n == 0
   then 1
   else 2 * (pow2 (n-1))

-- more recursions
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


-- Lists
x = [1,2,3]
empty = []

y = 0 : x -- [0,1,2,3]

x' = 1 : (2 : (3 : [] ))
x'' =  1 : 2 : 3 : []

-- Strings
str = "abcde"
str' = 'a' : 'b' : 'c' : 'd' : 'e' : []

-- Concatenate Lists
[1,2,3] ++ [4,5]     -- [1,2,3,4,5]
"hello" ++ "world"   -- "hello world"


-- Homogeneous Lists
error = [1, "hello", 2]

