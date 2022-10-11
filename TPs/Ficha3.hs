import Data.List

--3.1
mapFilter :: (a -> b) -> (a -> Bool) -> [a] -> [b]
mapFilter f p l = map f (filter p l)

--3.2
dec2int :: (Integral a) => [a] -> a
dec2int = foldl (\acc x -> acc * 10 + x) 0

--3.3
zipWith' :: (a -> b -> c) -> [a] -> [b] -> [c]
zipWith' _ [] _ = []
zipWith' _ _ [] = []
zipWith' f (x : xs) (y : ys) = f x y : zipWith' f xs ys

--3.4
isort :: Ord a => [a] -> [a]
isort = foldr insert []

--3.5
maximum' :: Ord a => [a] -> a
maximum' = foldl1 (\acc x -> if x > acc then x else acc)

minimum' :: Ord a => [a] -> a
minimum' = foldr1 (\x acc -> if x < acc then x else acc)

foldl1' :: (a -> a -> a) -> [a] -> a
foldl1' f x = foldl f (head x) (tail x)

foldr1' :: (a -> a -> a) -> [a] -> a
foldr1' f x = foldr f (last x) (init x)

--3.6
mdc :: Int -> Int -> Int
mdc a b = fst (until (\(a,b) -> b == 0) (\(a,b) -> (b,a`mod`b)) (a,b))

--3.7
--a)
(+++) :: [a] -> [a] -> [a]
xs +++ ys = foldr (:) ys xs

--b)
concat' :: [[a]] -> [a]
concat' = foldr (++) [] 

--c)
reverseRight :: [a] -> [a]
reverseRight = foldr (\x acc -> acc ++ [x]) []

--d)
reverseLeft :: [a] -> [a]
reverseLeft = foldl (\acc x -> x : acc) []

--e) 
elem' :: Eq a => a -> [a] -> Bool
elem' x = any (x ==)

--3.8


