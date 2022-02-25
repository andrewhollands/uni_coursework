import System.IO

--1. Without looking at the standard tools, define the following library functions using recursion:
--i. Decide if all logical values in a list are true:
and' :: [Bool] -> Bool
and' [] = True
and' (x : xs) = x && and' xs
{-
and' [True, False, True]
False
and' [True, True]
True
-}

--ii. Concatenate a list of strings:
concat' :: [[a]] -> [a]
concat' [] = []
concat' (x : xs) = x ++ concat' xs
{-
concat' [[1,2,3],[4,5]]
[1,2,3,4,5]
concat' [[1,2],[3,4],[5,6]]
[1,2,3,4,5,6]
-}

--iii. Produce a list with n identical elements:
replicate' :: Int -> a -> [a]
replicate' 0 _ = []
replicate' 1 x = [x]
replicate' n x | n > 0 = x : replicate' (n - 1) x | otherwise = []
{-
replicate' 3 5
[5,5,5]
replicate' 10 1
[1,1,1,1,1,1,1,1,1,1]
-}

--iv. Select the nth element of a list:
nth' :: [a] -> Int -> a
[] `nth'` _ = error "empty list"
(x : xs) `nth'` n | n == 0 = x | n > 0 = xs `nth'` (n - 1) | otherwise = error "negative num"
{-
[1,2,3,4,5] `nth'` 0
1
[1,2,3,4,5] `nth'` 2
3
-}

--v. Decide if a value is an element of a list:
elem' :: Eq a => a -> [a] -> Bool
elem' _ [] = False
elem' n (x : xs) | n == x = True | otherwise = elem' n xs
{-
elem' 7 [1,2,3,4,5,6,8]
False
elem' 3 [1,2,3,4,5]
True
-}

--2. Define a recursive function that merges two sorted lists of values to give a single sorted list.
merge' :: Ord a => [a] -> [a] -> [a]
merge' [] [] = []
merge' [] ys = ys
merge' xs [] = xs
merge' list1@(x : xs) list2@(y : ys) | x <= y = x : merge' xs list2 | otherwise = y : merge' list1 ys
{-
merge' [2,5,6] [1,3,4]
[1,2,3,4,5,6]
-}

--3. Define a recursive function that implements merge sort, which can be specified by the following two rules:
--i. Lists of length ≤ 1 are already sorted;
--ii. Other lists can be sorted by sorting the two halves and merging the resulting lists.
halve' :: [a] -> ([a], [a])
halve' xs = splitAt (length xs `div` 2) xs
msort' :: Ord a => [a] -> [a]
msort' [] = []
msort' [x] = [x]
msort' xs = merge' (msort' f) (msort' s) where (f, s) = halve' xs
{-
msort' [2, 5, 6, 1, 3, 4]
[1,2,3,4,5,6]
-}
