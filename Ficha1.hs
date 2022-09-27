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
    | otherwise = "muito bom com distinção"

--1.10
classifica' :: Float -> Float -> String
classifica' p a 
    | l < 18.5 = "baixo peso"
    | l>=18.5 && l<25 ="peso normal"
    | l>=25 && l<30 = "excesso de peso"
    | otherwise = "obsesidade"
  where l= p / (a^2)


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

--1.16
converte100 :: (Integral a) => a -> String
converte100 1 = "um"
converte100 2 = "dois"
converte100 3 = "tres"
converte100 4 = "quatro"
converte100 5 = "cinco"
converte100 6 = "seis"
converte100 7 = "sete"
converte100 8 = "oito"
converte100 9 = "nove"
converte100 10 = "dez"
converte100 11 = "onze"
converte100 12 = "doze"
converte100 13 = "treze"
converte100 14 = "catorze"
converte100 15 = "quinze"
converte100 16 = "dezasseis"
converte100 17 = "dezassete"
converte100 18 = "dezoito"
converte100 19 = "dezanove"
converte100 20 = "vinte"
converte100 30 = "trinta"
converte100 40 = "quarenta"
converte100 50 = "cinquenta"
converte100 60 = "sessenta"
converte100 70 = "setenta"
converte100 80 = "oitenta"
converte100 90 = "noventa"
converte100 n
    | n <= 0 = error "Numero negativo ou nulo"
    | n >= 100 = error "Numero maior ou igual a 100"
    | otherwise = (converte100 (n - (mod n 10))) ++ " e " ++ (converte100 (mod n 10))

converte1000 :: (Integral a) => a -> String
converte1000 100 = "cem"
converte1000 200 = "duzentos"
converte1000 300 = "tresentos"
converte1000 400 = "quatrocentos"
converte1000 500 = "quinhentos"
converte1000 600 = "seicentos"
converte1000 700 = "setecentos"
converte1000 800 = "oitocentos"
converte1000 900 = "novecentos"
converte1000 n
    | n <= 0 = error "Numero negativo ou nulo"
    | n >= 1000 = error "Numero maior ou igual a 1000"
    | n < 100 = converte100 n
    | n < 200 = "cento e " ++ (converte100 (mod n 100))
    | otherwise = (converte1000 (n - (mod n 100))) ++ " e " ++ (converte100 (mod n 100))

converte :: (Integral a) => a -> String
converte n
    | n <= 0 = error "Numero negativo ou nulo"
    | n >= 1000000 = error "Numero maior ou igual a 1000000"
    | n < 1000 = converte1000 n
    | n < 2000 = "mil" ++ converteAux n1000
    | otherwise = (converte1000 (div n 1000)) ++ " mil" ++ converteAux n1000
    where n1000 = mod n 1000
          converteAux n1000 = if n1000 == 0
                                then ""
                                else (if (n1000 <= 100 || mod n1000 100 == 0) then " e " else " ") ++ converte1000 n1000

--IN-14
fact :: Int -> Int
fact 0 = 1
fact n
  | n > 0 = n * fact (n -1)
  | otherwise = error "argumento negativo"
