import Data.Time.Format.ISO8601 (yearFormat)
import DynFlags (xFlags)

maxpos :: [Int] -> Int
maxpos [] = 0
maxpos l = maxposAux l 0

maxposAux :: [Int] -> Int -> Int
maxposAux [] n = n
maxposAux (x : xs) n
  | x <= n = maxposAux xs n
  | otherwise = maxposAux xs x

maxpos' :: [Int] -> Int
maxpos' [] = 0
maxpos' (x : xs)
  | x < maxpos' xs = maxpos' xs
  | otherwise = x

dups :: [a] -> [a]
dups [] = []
dups [x] = [x, x]
dups (x : y : xs) = x : x : y : dups xs

transforma :: String -> String
transforma [] = []
transforma (x : xs)
  | x == 'a' || x == 'e' || x == 'i' || x == 'o' || x == 'u' = x : 'p' : x : transforma xs
  | otherwise = x : transforma xs

type Vector = [Int]

type Matriz = [[Int]]

transposta :: Matriz -> Matriz
transposta [] = []
transposta m = [head x | x <- m] : transposta [tail x | x <- m, tail x /= []]

prodInterno :: Vector -> Vector -> Int
prodInterno [] [] = 0
prodInterno l d = sum [x * y | (x, y) <- z]
  where
    z = zip l d

prodInterno1 :: Vector -> Vector -> Int
prodInterno1 [] [] = 0
prodInterno1 _ [] = 0
prodInterno1 [] _ = 0
prodInterno1 (x : xs) (y : ys) = x * y + prodInterno1 xs ys

prodMat :: Matriz -> Matriz -> Matriz
prodMat [] [] = []
prodMat _ [] = []
prodMat [] _ = []
prodMat (x : xs) y = getmat x y : prodMat xs y

getmat :: Vector -> Matriz -> Vector
getmat _ [] = []
getmat x y = product x + product [head a | a <- y] : getmat x (tail y)

data Arv a = F | N a (Arv a) (Arv a)
  deriving (Show)

alturas :: Arv a -> Arv Int
alturas F = F
alturas (N a l r) = N (alturasAux (N a l r)) (alturas l) (alturas r)

alturasAux :: Arv a -> Int
alturasAux F = 0
alturasAux (N a l r) = 1 + max (alturasAux l) (alturasAux r)

equilibrada :: Arv a -> Bool
equilibrada F = True
equilibrada (N a l r) = abs (alturasAux l - alturasAux r) < 2


f :: (a -> b -> c) -> b -> a -> c
f fun b a = fun a b
