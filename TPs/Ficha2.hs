--2.1
--c)
concat' :: [[a]] -> [a] 
concat' [] = []
concat' (x:xs) = x ++ concat' xs

concat'' :: [[a]] -> [a] 
concat'' l=[x |xs<-l, x<-xs]

--d)
replicate' :: (Integral a)=> a -> b -> [b]
replicate' 0 _ = []
replicate' n x
    | n > 0 = x:(replicate'(n-1) x)
    | otherwise = error "agrumento negativo"

replicate'' :: (Integral a)=> a -> b -> [b]
replicate'' n x =[x | _ <-[1 .. n]]

--e)
(@@) :: (Integral b)=> [a] -> b -> a
[] @@ _ = error "lista vazia"
(x:_) @@ 0 = x
(_:xs) @@ n 
    | n > 0 = xs @@ (n-1)
    | otherwise = error "agrumento inteiro negativo"

(@@@) :: (Integral b)=> [a] -> b -> a
l @@@ n= head [x | (x,i) <- zip l [0 ..], i==n]  

--LI-4
reverse' :: [a]->[a]
reverse' []=[]
reverse' (x:xs) = (reverse' xs) ++ [x]

reverse'' :: [a]->[a]
reverse'' l= reverse''Aux l []

reverse''Aux :: [a]->[a]->[a]
reverse''Aux [] acc = acc
reverse''Aux (x:xs) acc = reverse''Aux xs (x:acc)

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


