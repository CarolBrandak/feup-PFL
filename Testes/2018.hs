import Data.List

{-
1
a) [[1,2,3], [], [4], [5]]
b) 5
c) [8, 6, 4, 2, 0]
d) 9
e) [(1, 1), (1, 2), (1, 3), (1, 4), (2, 2), (2, 3), (2, 4)]
f) [2,4,8,16,32]
g) [2^x-1 | x<-[1..10]]
h) 15
i) ([Bool],[Char])
j) p: a->b->(a,b)
k) h :: Eq a = [a]-> [a] -> [a]
l) feql :: Eq a => [a] -> Bool
-}

--2
--a)
distancia :: (Float, Float) -> (Float, Float) -> Float
distancia (x1, y1) (x2, y2) = sqrt((x2-x1)^2+(y2-y1)^2)

--b)
colineares :: (Float, Float) -> (Float, Float) -> (Float, Float) -> Bool
colineares (x1, y1) (x2, y2) (x3, y3) = d1 == d2
    where d1 = y1-y2 / x1-x2
          d2 = y2-y3 / x2-y3

--3
--a)
niguais :: Int -> a -> [a]
niguais n x
    | n <= 0 = []
    | otherwise = x:niguais (n-1) x

niguais' :: Int -> a -> [a]
niguais' n x 
    | n <= 0 = []
    | otherwise = [ x | z<-[1..n]]

--4
merge :: Ord a => [a] -> [a] -> [a]
merge l1 l2 = sort l
    where l=l1 ++ l2

--5
lengthZip :: [a] -> [(Int, a)]
lengthZip val = zip (reverse (take (length val) [1 ..])) val

--6
