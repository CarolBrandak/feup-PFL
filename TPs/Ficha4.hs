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

