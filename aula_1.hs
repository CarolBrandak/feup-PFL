--1.1
testaTriangulo :: Float -> Float -> Float -> Bool
testaTriangulo a b c
  | a + b > c && a + c > b && b + c > a = True
  | otherwise = False

--1.2
areaTriangulo :: Float -> Float -> Float -> Float
areaTriangulo a b c = sqrt (s * (s - a) * (s - b) * (s - c))
  where
    s = (a + b + c) / 2

--1.3
metades :: [a] -> ([a], [a])
metades l = (take halflen l, drop halflen l)
  where
    halflen = div (length l) 2

--1.4
--a)
last' :: [a] -> a
last' l = head (reverse l)

--b)
init' :: [a] -> [a]
init' l = reverse (tail (reverse l))

--1.5
--a)
binom :: Integer -> Integer -> Integer
binom n k = div (product [1 .. n]) ((product [1 .. k]) * product [1 .. (n - k)])

--b)
--binom' :: Integer -> Integer -> Integer
--binom' n k =

--1.6
raizes :: Float -> Float -> Float -> (Float, Float)
raizes a b c = (x1 , x2)
  where 
    t = b ^ 2 -4 * a * c
    x1 = (- b - sqrt t) / (2 * a)
    x2 = (- b + sqrt t) / (2 * a)

--1.7
--a) Lista de char
--b) Tuplos de char
--c) Lista de tuplos com bool e char
--d) Tuplos de listas na esquerda bool e direita char
--e) Lista de funções
--f) Lisat de funções que retornam bool

--1.8
-- a) segundo :: [a] -> a
-- b) trocar :: (a,b) -> (b,a)
-- c) par :: a -> b -> (a,b)
-- d) dobro :: (Num a) => a -> a
-- e) metade :: (Fractional a) => a -> a
-- f) minuscula :: Char -> Bool
-- g) intervalo :: (Ord a) => a -> a -> a -> Bool
-- h) palindromo :: (Eq a) => [a] -> Bool
-- i) twice :: (a -> a) -> a -> a

--1.9
classifica :: Int -> String
classifica n
    | n<=9 = "reprovado"
    | n>=10 && n<=12 = "suficiente"
    | n>=13 && n<=15 = "bom"
    | n>=16 && n<=18 = "muito bom"
    | n>=19 && n<=20 = "muito bom com distinção"

--1.14
--a)
curta :: [a] -> Bool
curta l
  | length l <= 2 = True
  | otherwise = False

--b)
curta' :: [a] -> Bool
curta' [] = True
curta' [_] = True
curta' [_, _] = True
curta' _ = False

--IN-14
fact :: Int -> Int
fact 0 = 1
fact n
  | n > 0 = n * fact (n -1)
  | n < 0 = error "argumento negativo"
