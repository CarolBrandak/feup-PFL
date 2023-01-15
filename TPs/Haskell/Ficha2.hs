{-# OPTIONS_GHC -Wno-incomplete-patterns #-}
import Data.Char

--2.1
--a)
and' :: [Bool] -> Bool
and' [] = True
and' (x:xs) = x && and' xs

-- b)
or' :: [Bool] -> Bool
or' [] = False
or' (x:xs) = x || or' xs

--c)
concat' :: [[a]] -> [a]
concat' [] = []
concat' (x:xs) = x ++ concat' xs

--d)
replicate' :: (Integral a)=> a -> b -> [b]
replicate' 0 _ = []
replicate' n x
    | n > 0 = x:(replicate'(n-1) x)
    | otherwise = error "agrumento negativo"

--e)
(@@) :: (Integral b)=> [a] -> b -> a
[] @@ _ = error "lista vazia"
(x:_) @@ 0 = x
(_:xs) @@ n
    | n > 0 = xs @@ (n-1)
    | otherwise = error "agrumento inteiro negativo"

-- f)
elem' :: Eq a => a -> [a] -> Bool
elem' _ [] = False
elem' n (x:xs) = n == x || elem' n xs

--2.2
intersperse:: a -> [a] -> [a]
intersperse _ [] = []
intersperse _ [x] = [x]
intersperse c (x:xs)  = x:c:intersperse c xs 

-- 2.3
mdc :: Int -> Int -> Int
mdc a 0 = a
mdc a b = mdc b (mod a b)

-- 2.4 a)
insert :: Ord a => a -> [a] -> [a]
insert y [] = [y]
insert y (x:xs) 
    | x < y =  x:insert y xs
    | otherwise = y:x:xs

-- b)
isort :: Ord a => [a] -> [a]
isort [] =  []
isort (x:xs) = insert x (isort xs)

-- 2.5 a)
minimum' :: Ord a => [a] -> a
minimum' [x] = x
minimum' (x:xs) 
    | z < x = z
    | otherwise  = x
    where  z = minimum' xs

--b)
delete :: Eq a => a -> [a] -> [a]
delete n [] = []
delete n (x:xs)
    | n == x = xs
    | otherwise = x : delete n xs

-- c)
ssort :: Ord a => [a] -> [a] 
ssort [] = []
ssort xs = z:delete z xs where z = minimum' xs


--2.6
somaq:: Int
somaq = sum [x^2 | x <- [1 ..100]]

--2.7
--a)
aprox :: Int -> Double
aprox n = 4 *sum [((-1)**fromIntegral i ) / (2*fromIntegral i +1) | i<-[0..n]]

--b)
aprox' :: Int -> Double
aprox' k = sqrt(12 *sum [((-1)**fromIntegral i )/ (fromIntegral i +1)**2 | i<-[0..k]])

--2.8
dotprod :: [Float] -> [Float] -> Float
dotprod a b = sum[ x*y | (x, y)<- zip a b]

--2.9
divprop :: Integer -> [Integer ]
divprop n= [x | x<-[1..n-1], n `mod` x==0]

--2.10
perfeitos :: Integer -> [Integer ]
perfeitos n= [x | x<-[1..n-1], sum(divprop x)==x]

--2.11
pitagoricos :: Integer -> [(Integer ,Integer ,Integer)]
pitagoricos n=[(x, y, z) | x<-[1..n], y<-[1..n], z<-[1..n], x^2+y^2==z^2]

--2.12
primo :: Integer -> Bool
primo n
    | divprop n ==[1] =True
    | otherwise=False

--2.13
mersennes :: [Int]
mersennes = [fromIntegral x |n<-[0..30],let x=2^n-1, primo x]

--2.14
fact :: Integer -> Integer
fact n = product [1..n]

binom :: Integer -> Integer -> Integer
binom n k
    | k < n - k = div (product [n-k+1 .. n]) (fact k)
    | otherwise = div (product [k+1 .. n]) (fact (n-k))

pascal :: Integer -> [[Integer]]
pascal n = [[x | i<-[0..k], let x= binom k i ] | k<-[0..n] ]

--2.15
cifraLetra :: Int -> Data.Char.Char -> Data.Char.Char
cifraLetra k x
    | Data.Char.isLetter x && Data.Char.isUpper x = Data.Char.chr (mod (Data.Char.ord x +k - Data.Char.ord 'A' ) 26 + Data.Char.ord 'A' )
    | Data.Char.isLetter x && Data.Char.isLower x = Data.Char.chr (mod (Data.Char.ord x +k - Data.Char.ord 'a' ) 26 + Data.Char.ord 'a' )
    | otherwise  = x

cifrar :: Int -> String -> String
cifrar k xs = [cifraLetra k x| x <- xs]

--2.16
concat'' :: [[a]] -> [a]
concat'' l=[x |xs<-l, x<-xs]

replicate'' :: (Integral a)=> a -> b -> [b]
replicate'' n x =[x | _ <-[1 .. n]]

(@@@) :: (Integral b)=> [a] -> b -> a
l @@@ n= head [x | (x,i) <- zip l [0 ..], i==n]

--2.17
forte :: String -> Bool
forte xs = (length xs >= 8) && letraMaiuscula xs && letraMinuscula xs  && algarismo xs
    where
        peloMenosUm criterio lista = length [x | x <- lista ,criterio x] > 0
        letraMaiuscula = peloMenosUm Data.Char.isUpper
        letraMinuscula = peloMenosUm Data.Char.isLower
        algarismo = peloMenosUm Data.Char.isDigit

--2.18
--a)
mindiv :: Int -> Int
mindiv n
    | null x = n
    | otherwise = head x
    where x=[i | i <-[2..floor (sqrt(fromIntegral n))], mod n i ==0]

--b)
primo':: Int -> Bool
primo' n = n>1 && (n == mindiv n)

--2.19
nub :: Eq a => [a] -> [a]
nub []=[]
nub (x:xs)= x:nub [y | y<-xs ,y /=x] 

-- 2.20
transpose :: [[a]] ->[[a]]
transpose xss  = [ [xs !! i | xs <- xss] | i<- [0..(z-1)]  ]
    where z = length (head xss)

--2.21
algarismos :: Int -> [Int]
algarismos n
    |n<10 =[n]
    |otherwise = algarismos (div n 10) ++ [mod n 10]

--2.22
toBits :: Int -> [Int]
toBits 0 = [0]
toBits 1 = [1]
toBits n = toBits(div n 2) ++ [mod n 2] 

-- 2.23
fromBits :: [Int] -> Int 
fromBits xs = sum [x*y | (x,y)<- zip xs (iterate (`div` 2) (2^(length xs - 1)))]

--2.24
--a)
merge :: Ord a => [a] -> [a] -> [a]
merge xs [] = xs
merge [] ys = ys
merge (x:xs) (y:ys) 
    | x < y = x:merge xs (y:ys)
    | otherwise = y:merge (x:xs) ys

--b)
metades :: [a] -> ([a],[a]) 
metades [] = ([],[])
metades [x] = ([x],[])
metades (x:x1:xs) = (x:z,x1:z1)
    where (z,z1) = metades xs

mSort :: Ord a => [a] -> [a]
mSort [] = []
mSort [x] = [x]
mSort xs = merge (mSort left) (mSort right)
    where  (left,right) = metades xs

--LI-4 
reverse' :: [a]->[a]
reverse' []=[]
reverse' (x:xs) = (reverse' xs) ++ [x]

reverse'' :: [a]->[a]
reverse'' l= reverse''Aux l []

reverse''Aux :: [a]->[a]->[a]
reverse''Aux [] acc = acc
reverse''Aux (x:xs) acc = reverse''Aux xs (x:acc)