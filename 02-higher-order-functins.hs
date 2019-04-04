{-==============================================================================
 = Higher Order Functions
 =============================================================================-}


{-------------------------------------------------------------------------------
 - Functions as Values
 ------------------------------------------------------------------------------}

-- Passed as function arguments
-- Create functions on the fly
--      Partial function application
--      Lambda expressions
--      Function composition
-- Higher-order functions

pass3 f = f 3
add1 x = x + 1

pass3 add1  -- 4

compose f g x = f (g x)

add1 x = x + 1
mult2 x =  2 * x

compose add1 mult2 4    -- 9

always7 x = 7
always7' = const 7

(const 7) 5 -- 7


{-------------------------------------------------------------------------------
 - Partial Application
 ------------------------------------------------------------------------------}

-- Arguments given in order

foo x y z = x + y + z
foo_1_2 = foo 1 2

foo_1_2 3  -- 6


pass x f = f x
pass3 = pass 3


{-------------------------------------------------------------------------------
 - Operators
 ------------------------------------------------------------------------------}

-- +, *, :, ++ are all functions
-- (+), (*), (:), (++)

(+) 5 3     -- 8

pass_3_4 f = f 3 4
pass_3_4 (+)    --7

-- Operator definitions
(a,b) .+ (c,d) = (a+c, b+d)

-- Partially applying operators
plus1   = (+) 1
plus1'  = (1+)
plus1'' = (+1)

-- Tuning functions into operators
mod 10 2    -- 0
10 `mod` 2  -- 0


{-------------------------------------------------------------------------------
 - Map
 ------------------------------------------------------------------------------}

-- Applies a function to every element in a list

map length ["hello", "abc", "1234"]     -- [5,3,4]
map (1+) [1,3,5,7]                      -- [2,3,4,6,8]

double = map (2*)

{-------------------------------------------------------------------------------
 - Filter
 ------------------------------------------------------------------------------}

-- Tests each element, keeps those that pass

notNull xs = not (null xs)
filter notNull ["", "abc", "hello", ""]     -- ["abc", "hello"]

isEven x = x `mod` 2 == 0
removeOdd = filter isEven

map snd (filter first [(True,1),(False,7),(True,11)]) -- [1,11]

{-------------------------------------------------------------------------------
 - Fold
 ------------------------------------------------------------------------------}

-- Combines all the values in a list
--      foldl
--      foldr

-- foldl
foldl (+) 0 [1,2,3,4,5]     -- 10

showPlus s x  = "(" ++ s ++ ")" ++ (show x) ++ ")"
showPlus "(1+2)" 3  -- "((1+2)+3)"

foldl showPlus "0" [1,2,3,4]    -- ((((0+1)+2)+3)+4)

-- foldr
foldr (+) 0 [1,2,3,4]   -- 10, 1+2+3+4+0

showPlus' x s = "(" ++ (show x) ++ "+" ++ s ++ ")"
foldr showPlus' "0" [1,2,3,4]   -- ((((0+1)+2)+3)+4)

-- foldl vs foldr
foldl (-) 0 [1,2,3]     -- ((0-1)-2)-3) ==> -6
foldr (-) 0 [1,2,3]     -- (1-(2-(3-0)) ==> 2

-- foldl: slightly faster
-- foldr: infinite lists


{-------------------------------------------------------------------------------
 - Zip
 ------------------------------------------------------------------------------}

zip [1,2,3] [4,5,6]    -- [(1,4),(2,5),(3,6)]
zip [1,2] [3,4,5,6]    -- [(1,3),(2,4)]

zipWith (+) [1,2,3] [4,5,6] -- [5,7,9]

plus x y z = x + y + y
zipWith3 plus3 [1,2,3] [4,5,6] [7,8,9]  -- [12,15,18]

{-------------------------------------------------------------------------------
 - Lambda Expressions
 ------------------------------------------------------------------------------}

plus3 x y z = x + y + z

zipWith (\ x y z -> x + y + z) [1,2,3] [4,5,6] [7,8,9]  -- [12,15,18]

map (\ x -> 2 * x) [1,2,3]      -- [2,4,6]
map (2*) [1,2,3]                -- [2,4,6]
map (\ x -> 2 * x + 1) [1,2,3]  -- [3,5,7]

-- When to use lambda expressions
--      Too simple: partial application
--      Too complex: named function



