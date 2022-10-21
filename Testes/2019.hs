import System.Win32 (COORD(x))
--1
-- a) [[1,2],[], [3, 4], 5]
-- b) [5]
-- c) 2
-- d) [16,20,24,28,32]
-- e) [(3,2),(4,3),(5,4),(5,6),(6,8),(7,12)]
-- f) [[2,8], [4,6],[]]
-- g) zip [0..6] [6,5..0]
-- h) 15
-- i) [(Char,String)]
-- j) (Num a,Ord a) => a->[a]->Bool
-- k) Eq a => [a]->Bool
-- l) Eq a => (a->a)->a->Bool

-- 2
-- a)
pitagoricos :: Int -> Int -> Int -> Bool
pitagoricos a b c
  | (a^2+b^2==c^2) || (c^2+b^2==a^2) || (a^2+c^2==b^2) = True
  | otherwise = False


--b)
hipotenusa :: Float -> Float -> Float
hipotenusa a b = sqrt (a^2+b^2)

-- 3
-- a)
diferentes :: Eq a=> [a] -> [a]
diferentes []=[]
diferentes [x]=[]
diferentes (x:y:xs)
    | x == y = diferentes (y:xs)
    | otherwise = x : diferentes(y:xs)

--b)
diferentes' :: Eq a=> [a] -> [a]
diferentes' l1= [x | (x,y) <- zip l1 (tail l1) , x/=y ]

--4
zip3 :: [a] -> [b] -> [c] -> [(a, b, c )]
zip3 l1 l2 l3= [(x, y, z) | (x, (y, z)) <- zip l1 (zip l2 l3)]

--5
partir :: Eq a => a -> [a] -> ([a],[a])
partir i []=([],[])
partir i (x:xs)
    | i == x = ([],x:xs)
    | otherwise = (x:y, z)
    where (y,z)=partir i xs

--6
parts :: [a]->[[[a]]]
parts []=[[]]
parts (l:ls) = [[l]:ps | ps<-parts ls] ++ [ (l:p):ps | (p:ps)<-parts ls]
    


