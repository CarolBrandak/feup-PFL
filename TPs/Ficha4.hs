data Arv a = Vazia | No a (Arv a) (Arv a)

type Pair a b = (a, b)

myArv = No 3 (No 2 (No 1 Vazia Vazia) Vazia) (No 4 Vazia Vazia)

--4.1
sumArv :: Num a => Arv a -> a
sumArv Vazia = 0
sumArv (No x l r) = x + sumArv l + sumArv r

--4.2
listar :: Arv a -> [a]
listar Vazia=[]
listar (No x esq dir) = listar esq ++ [x] ++ listar dir

--4.3
nivel :: Int -> Arv a -> [a]
nivel _ Vazia=[]
nivel 0 (No x _ _) = [x]
nivel n (No x left right) = nivel (n - 1) left ++ nivel (n - 1) right

--4.4
mapArv :: (a -> b) -> Arv a -> Arv b
mapArv _ Vazia = Vazia
mapArv f (No x l r) = No (f x) (mapArv f l) (mapArv f r)

--4.5
--a)
construir :: Ord a =>  [a] -> Arv a
construir [] = Vazia
construir [x] = No x Vazia Vazia
construir xs = No elementoMeio (construir primeiraMetade) (construir segundaMetade)
    where 
        meio = length xs `div` 2
        elementoMeio = xs !! meio
        primeiraMetade = take meio xs
        segundaMetade = drop (meio+1) xs

--b)
inserir :: Ord a =>  a -> Arv a -> Arv a
inserir x Vazia = No x Vazia Vazia
inserir x (No y left right) 
    | x == y = No y left right
    | x < y = No y (inserir x left) right
    | otherwise = No y left (inserir x right)

construirLinear :: Ord a => [a] -> Arv a
construirLinear = foldr inserir Vazia

altura :: Arv a -> Int
altura Vazia = 0
altura (No _ Vazia Vazia) = 0
altura (No _ left right) = 1 + max(altura left) (altura right)

testHeight :: ([Int] -> Arv Int) -> [Int] -> [Int]
testHeight constructTree xs = [(altura . constructTree)[1..x] | x <-xs]

--4.6
--a)
maisDir :: Arv a -> a
maisDir Vazia = error "Arvore vazia :/ "
maisDir (No x _ Vazia) = x
maisDir (No _ _ right) = maisDir right

-- b)
remover :: Ord a => a -> Arv a -> Arv a
remover _ Vazia = Vazia
remover x (No y left right) 
    | x < y = No y (remover x left) right
    | x > y = No y left (remover x right)
    | otherwise = removerNo (No y left right)

removerNo :: Ord a=> Arv a  -> Arv a
removerNo Vazia = error "Nao tem nos para remover"
removerNo (No _ Vazia right) = right
removerNo (No _  left Vazia) = left
removerNo (No _  left right) = No n (remover n left) right
    where n = maisDir left
