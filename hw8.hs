
-- Name: Carter Mooring
-- File: hw8.hs
-- Desc: This is a file containing functions written in the Haskell language that can be called 
--          and used in the terminal using the 'ghci' command to run Haskell, 'load hw8' to load 
--          this file, and the name of any function below accompanied by variables to run them.
--          (ex: midpoint (-2,1) (1,5))



-------------------------------------------
-- Part 1: Answers to 1-3 below
-------------------------------------------
--Q(1)
--(a) 3 * 5 + 8             Guess: 23                       Answer: 23
--(b) (+) ((*) 3 5) 8       Guess: 23                       Answer: 23
--(c) 2ˆ1000                Guess: error                    Answer: 10715086071862673209484250490600018105614048117055336074437503883703510511249361224931983788156958581275946729175531468251871452856923140435984577574698574803934567774824230985421074605062371141877954182153046474983581941267398767559165543946077062914571196477686542167660429831652624386837205668069376
--(d) even 9                Guess: False                    Answer: False
--(e) succ 6                Guess: 7                        Answer: 7
--(f) succ (pred 6)         Guess: 6                        Answer: 6
--(g) gcd 21 27             Guess: 3                        Answer: 3
--(h) gcd(21, 27)           Guess: 3                        Answer: error
--(i) [1..4]                Guess: [1,2,3,4]                Answer: [1,2,3,4]
--(j) [1..4] ++ [5..10]     Guess: [1,2,3,4,5,6,7,8,9,10]   Answer: [1,2,3,4,5,6,7,8,9,10]
--(k) 1 : [2,4 .. 10]       Guess: [1,2,4,6,8,10]           Answer: [1,2,4,6,8,10]
--(l) [1, "2"]              Guess: error                    Answer: error

--Q(2)
--(a) 3 * 5 + 8             :: Num a => a
--(b) (+) ((*) 3 5) 8       :: Num a => a
--(c) 2ˆ1000                :: Num a => a
--(d) even 9                :: Bool
--(e) succ 6                :: (Enum a, Num a) => a
--(f) succ (pred 6)         :: (Enum a, Num a) => a
--(g) gcd 21 27             :: Integral a => a
--(i) [1..4]                :: (Num a, Enum a) => [a]
--(j) [1..4] ++ [5..10]     :: (Num a, Enum a) => [a]
--(k) 1 : [2,4 .. 10]       :: (Num a, Enum a) => [a]

--Q(3)
--let zp = [1..]
--(a) zp :: (Num a, Enum a) => [a]
--(b) head zp = 1
--(c) head (tail zp) = 2
--(d) head (drop 100 zp) = 101
--(e) take 20 (filter even zp) = [2,4,6,8,10,12,14,16,18,20,22,24,26,28,30,32,34,36,38,40]
--(f) zp = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20, to infinity]




-------------------------------------------
-- Part 2: Answers to questions 4-14 below
-------------------------------------------

--Q(4)
--unordered3 :: Ord a => a -> a -> a -> Bool
unordered3 x y z = if(x <= y && y <= z) || (x > y && y > z)
                        then False
                        else True

--Q(5)
--distance :: Floating a => (a, a) -> (a, a) -> a
distance (x, y) (x2, y2) = sqrt(((x2 - x) * (x2 - x)) + ((y2 - y) * (y2 - y)))

--Q(6)
--midpoint :: (Fractional a, Fractional b) => (a, b) -> (a, b) -> (a, b)
midpoint (x, y) (x2, y2) = (((x + x2)/2), ((y + y2)/2))

--Q(7)
--addToEnd :: a -> [a] -> [a]
addToEnd x ys = (ys) ++ [x]

--Q(8)
--addFirstToEnd :: [a] -> [a]
addFirstToEnd xs = (tail xs) ++ [head xs]

--Q(9)
--addSecondToEnd :: [a] -> [a]
addSecondToEnd xs = [head xs] ++ (addFirstToEnd (tail xs))

--Q(10)
--median3 :: Ord a => a -> a -> a -> a
median3 x y z = if (x >= y && x <= z) || (x <= y && x >= z)
                    then x
                    else if (y >= x && y <= z) || (y <= x && y >= z)
                            then y
	                        else z

--Q(11)
--quadrant :: (Ord a1, Ord a2, Num a1, Num a2, Num p) => (a1, a2) -> p
quadrant (x1, y1) = if (x1 > 0 && y1 > 0)
                       then 1
                    else  
                       if (x1 < 0 && y1 > 0)
                          then 2
                       else
                          if (x1 < 0 && y1 < 0)
                             then 3
                          else 
                             if (x1 > 0 && y1 < 0)
                                then 4
                                else 0
--Q(12)
--lastElem :: [a] -> a
lastElem xs = head(drop ((length xs) - 1) xs)

--Q(13)
--earlierDate :: (Ord a1, Ord a2, Ord a3) => (a2, a3, a1) -> (a2, a3, a1) -> Bool
earlierDate (m, d, y) (m2, d2, y2) = if y < y2
                                        then True
                                        else (if m < m2 && y == y2
                                                then True
                                                else (if d < d2 && m == m2
                                                        then True
                                                        else False))