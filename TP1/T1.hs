module T1 where

import Data.Char
import Data.List
import System.IO

type Monomio = (Int, [Char], [Int])

type Poly = [Monomio]

remove0 :: Poly -> Poly --Remove os zeros do polinomio
remove0 [] = []
remove0 ((x, l1, l2) : xs)
  | x == 0 = xs
  | otherwise = (x, l1, l2) : remove0 xs

compFirst :: Monomio -> Monomio -> Ordering --Orderna por expoente maximo
compFirst (x1, [], []) (x2, [], []) = LT
compFirst (x1, lc1, ln1) (x2, [], []) = LT
compFirst (x1, [], []) (x2, lc2, ln2) = GT
compFirst (x1, lc1, x : xs) (x2, lc2, y : ys)
  | x > y = LT
  | x < y = GT
  | x == y = sortLength (x1, lc1, x : xs) (x2, lc2, y : ys)

sortLength :: Monomio -> Monomio -> Ordering --Orderna por numero de vaiaveis
sortLength (_, lc1, _) (_, lc2, _)
  | length lc1 < length lc2 = GT
  | length lc1 > length lc2 = LT
  | length lc1 == length lc2 = sortAlph (head lc1) (head lc2)

sortAlph :: Char -> Char -> Ordering --Orderna por ordem alfabetica
sortAlph a b
  | a > b = GT
  | otherwise = LT

orderPoly :: Poly -> Poly --Ordena o polinomio
orderPoly l = sortBy compFirst (convertTupleToPoly (orderExp l))

variable :: (Char, Int) -> (Char, Int) -> Ordering --Orderna as variaveis
variable (c1, n1) (c2, n2)
  | c1 < c2 = LT
  | otherwise = GT

orderVar :: Poly -> [(Int, ([Char], [Int]))] --Orderna o polinomio por variaveis
orderVar [] = []
orderVar ((a, lc, ln) : xs) = (a, unzip (sortBy variable (zip lc ln))) : orderVar xs

convertTupleToPoly :: [(Int, ([Char], [Int]))] -> Poly --Converte a forma que esta as ordenaçoes para Poly normal
convertTupleToPoly [] = []
convertTupleToPoly ((a, (lc, ln)) : xs) = (a, lc, ln) : convertTupleToPoly xs

expo :: (Char, Int) -> (Char, Int) -> Ordering --Orderna os expoente
expo (c1, n1) (c2, n2)
  | n1 > n2 = LT
  | otherwise = GT

orderExp :: Poly -> [(Int, ([Char], [Int]))] --Orderna o polinomio por expoentes
orderExp [] = []
orderExp ((a, lc, ln) : xs) = (a, unzip (sortBy expo (zip lc ln))) : orderExp xs

recursiveShow :: [(Char, Int)] -> String --Escreve em string a parte das variaveis do polinomio
recursiveShow [] = ""
recursiveShow ((a, 0) : xs) = recursiveShow xs
recursiveShow ((a, 1) : xs) = a : recursiveShow xs
recursiveShow ((a, b) : xs)
  | null xs = [a] ++ "^" ++ show b
  | otherwise = [a] ++ "^" ++ show b ++ recursiveShow xs

convert :: Poly -> Int -> String --Converte o polinomio em string
convert [] _ = ""
convert ((x, [], []) : xs) cnt
  | x > 0 = " + " ++ show x ++ convert xs (cnt + 1)
  | otherwise = " - " ++ show (abs x) ++ convert xs (cnt + 1)
convert ((x, l1, l2) : xs) 0
  --  | x == 0 = convert xs 1
  | x == 1 = recursiveShow (zip l1 l2) ++ convert xs 1
  | x == -1 = "-" ++ recursiveShow (zip l1 l2) ++ convert xs 1
  | otherwise = show x ++ recursiveShow (zip l1 l2) ++ convert xs 1
convert ((x, l1, l2) : xs) cnt
  | x == 1 = " + " ++ recursiveShow (zip l1 l2) ++ convert xs (cnt + 1)
  | x > 1 = " + " ++ show x ++ recursiveShow (zip l1 l2) ++ convert xs (cnt + 1)
  | x == 0 = convert xs (cnt + 1)
  | x == -1 = " - " ++ recursiveShow (zip l1 l2) ++ convert xs (cnt + 1)
  | otherwise = " - " ++ show (abs x) ++ recursiveShow (zip l1 l2) ++ convert xs (cnt + 1)

simplifyMonomial :: Monomio -> Poly -> Monomio --Junta todos os monomios iguals
simplifyMonomial a [] = a
simplifyMonomial (a, lc1, ln1) ((b, lc2, ln2) : xs2)
  | lc1 == lc2 && ln1 == ln2 = simplifyMonomial (a + b, lc1, ln1) xs2
  | otherwise = simplifyMonomial (a, lc1, ln1) xs2

deleteEqualMon :: Monomio -> Poly -> Poly --Apaga os monomios iguais
deleteEqualMon a [] = []
deleteEqualMon (a, lc1, ln1) ((b, lc2, ln2) : xs)
  | lc1 == lc2 && ln1 == ln2 = deleteEqualMon (a, lc1, ln1) xs
  | otherwise = (b, lc2, ln2) : deleteEqualMon (a, lc1, ln1) xs

normalizePoly :: Poly -> Poly --Normaliza o polinomio
normalizePoly p1 = convertTupleToPoly (orderVar (orderPoly (remove0 (convertTupleToPoly (joinVarsPoly (normalize (convertTupleToPoly (orderVar (remove0 p1)))))))))

normalize :: Poly -> Poly --Normaliza o polinomio
normalize [] = []
normalize (x : xs) = simplifyMonomial x xs : normalize a
  where
    a = deleteEqualMon (simplifyMonomial x xs) xs

addPoly :: Poly -> Poly -> Poly --Adiciona os 2 polinomios
addPoly poly1 poly2 = convertTupleToPoly (orderVar (orderPoly (remove0 (convertTupleToPoly (joinVarsPoly (normalize (convertTupleToPoly (orderVar poly1) ++ convertTupleToPoly (orderVar poly2))))))))

multiPoly :: Poly -> Poly -> Poly --Multiplicar os 2 polinomios
multiPoly poly1 poly2 = convertTupleToPoly (orderVar (orderPoly (remove0 (convertTupleToPoly (joinVarsPoly (normalize (convertTupleToPoly (orderVar (convertTupleToPoly (multiplyMono (generatePoly (normalize (remove0 poly1)) (normalize (remove0 poly2)))))))))))))

generatePoly :: Poly -> Poly -> [(Monomio, Monomio)] --Junta Monomios com Monomios
generatePoly p1 p2 = [(a, b) | a <- p1, b <- p2]

multiplyMono :: [(Monomio, Monomio)] -> [(Int, ([Char], [Int]))] --Percorre a lista de pares de monomios e junta-os num monomio
multiplyMono [] = []
multiplyMono ((m1, m2) : xs) = joinMono m1 m2 : multiplyMono xs

joinMono :: Monomio -> Monomio -> (Int, ([Char], [Int])) --Junta as listas de variaveis e expoentes dos monomios e multiplica coeficiente
joinMono (a, lc1, ln1) (b, lc2, ln2) = (a * b, unzip (joinVars (zip lc1 ln1 ++ zip lc2 ln2)))

joinVarsPoly :: Poly -> [(Int, ([Char], [Int]))] --Junta as variaveis repetidas
joinVarsPoly [] = []
joinVarsPoly ((x, lc, ln) : xs) = (x, unzip (joinVars (zip lc ln))) : joinVarsPoly xs

joinVars :: [(Char, Int)] -> [(Char, Int)] --Simplifica as variaveis
joinVars [] = []
joinVars (x : xs) = simplifyVar x xs : joinVars a
  where
    a = deleteEqualVar (simplifyVar x xs) xs

simplifyVar :: (Char, Int) -> [(Char, Int)] -> (Char, Int) --Junta todas as Variaveis iguais
simplifyVar a [] = a
simplifyVar (c1, n1) ((c2, n2) : xs)
  | c1 == c2 = simplifyVar (c1, n1 + n2) xs
  | otherwise = simplifyVar (c1, n1) xs

deleteEqualVar :: (Char, Int) -> [(Char, Int)] -> [(Char, Int)] --Apaga da lista pares com variavel igual à variavel do par
deleteEqualVar a [] = []
deleteEqualVar (c1, n1) ((c2, n2) : xs)
  | c1 == c2 = deleteEqualVar (c1, n1) xs
  | otherwise = (c2, n2) : deleteEqualVar (c1, n1) xs

derivePoly :: Poly -> Char -> Poly --Deriva um polinomio
derivePoly l c = convertTupleToPoly (orderVar (orderPoly (remove0 (convertTupleToPoly (joinVarsPoly (normalize (derive l c)))))))

derive :: Poly -> Char -> Poly --Deriva um polinomio
derive [] _ = []
derive (x : xs) y
  | getCoef (deriveMono x y) == 0 = derive xs y
  | otherwise = deriveMono x y : derive xs y

getCoef :: Monomio -> Int --Mostra o coeficiente de um monimio
getCoef (x, _, _) = x

deriveMono :: Monomio -> Char -> Monomio --Deriva um monomio
deriveMono (a, lc, ln) y = (deriveCoef a y lc ln, lc, zipWith (deriveDegree y) lc ln)

deriveCoef :: Int -> Char -> [Char] -> [Int] -> Int --Altera o coeficiente de um monomio
deriveCoef x y lc ln = x * sum (zipWith (findDegree y) lc ln)

findDegree :: Char -> Char -> Int -> Int --Encontra o grau de uma certa variavel num monomio
findDegree c x y
  | c == x = y
  | otherwise = 0

deriveDegree :: Char -> Char -> Int -> Int --Altera o grau para derivar
deriveDegree x y c
  | x == y = c -1
  | otherwise = c

outputNormalize :: Poly -> String --Output de normalizar
outputNormalize l = convert (normalizePoly l) 0

outputAdd :: Poly -> Poly -> String --Output de adicionar polinomios
outputAdd poly1 poly2 = convert (addPoly poly1 poly2) 0

outputMulti :: Poly -> Poly -> String --Output de multiplicar polinomios
outputMulti poly1 poly2 = convert (multiPoly poly1 poly2) 0

outputDerive :: Poly -> Char -> String --Output de derivar 1 polinomio conforme a variavel
outputDerive l c = convert (derivePoly l c) 0

convertStringPoly :: String -> Poly --Divide a string em strings de monomios e converte em polinomios
convertStringPoly [] = []
convertStringPoly (x : xs)
  | x == '-' = convertStringMonoCoef (x : takeWhile (\x -> (x /= '+') && (x /= '-')) xs) (0, [], []) : convertStringPoly (dropWhile (\x -> (x /= '+') && (x /= '-')) xs)
  | x == '+' = convertStringMonoCoef (takeWhile (\x -> (x /= '+') && (x /= '-')) xs) (0, [], []) : convertStringPoly (dropWhile (\x -> (x /= '+') && (x /= '-')) xs)
  | otherwise = convertStringMonoCoef (x : takeWhile (\x -> (x /= '+') && (x /= '-')) xs) (0, [], []) : convertStringPoly (dropWhile (\x -> (x /= '+') && (x /= '-')) (x : xs))

convertStringMonoCoef :: String -> Monomio -> Monomio --Converte o coeficiente
convertStringMonoCoef [a] t
  | isAlpha a = (1, [a], [1])
convertStringMonoCoef ('-' : a : xs) t 
  | isDigit a = convertStringMonoCoef xs (digitToInt a - (2 * digitToInt a), [], [])
  | isAlpha a = convertStringMonoCoef (a:xs) (-1, [], [])
convertStringMonoCoef (a : b : xs) (x, l1, l2)
  | isDigit a && isDigit b && x >= 0 = convertStringMonoCoef (b : xs) (x * 10 + digitToInt a, [], [])
  | isDigit a && isDigit b && x < 0 = convertStringMonoCoef (b : xs) (x * 10 - digitToInt a, [], [])
  | isAlpha a && b == '^' = convertStringMonoVars (a:b:xs) (1, l1, l2)
convertStringMonoCoef (a : xs) (x, _, _)
  | isDigit a && x >= 0 = convertStringMonoVars xs (x * 10 + digitToInt a, [], [])
  | isDigit a && x < 0 = convertStringMonoVars xs (x * 10 - digitToInt a, [], [])
  | x < 0 = convertStringMonoVars (a : xs) (x, [], [])
  | xs == "" = (digitToInt a, [], [])
  | otherwise = convertStringMonoVars xs (1, [], [])
convertStringMonoCoef "" (x, _, _)
  | x < 0 = convertStringMonoVars "" (x, [], [])


convertStringMonoVars :: String -> Monomio -> Monomio --Converte as variaveis
convertStringMonoVars "" m1 = m1
convertStringMonoVars [a] (x, lc, ln) = (x, lc ++ [a], ln ++ [1])
convertStringMonoVars (a : b : xs) (x, lc, ln)
  | isAlpha a && isAlpha b = convertStringMonoVars (b : xs) (x, lc ++ [a], ln ++ [1])
convertStringMonoVars (a : b : c : xs) (x, lc, ln)
  | isAlpha a && b == '^' && isDigit c = convertStringMonoVars xs (x, lc ++ [a], ln ++ [digitToInt c])
