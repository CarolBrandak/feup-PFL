--1.1
testaTriangulo :: Float -> Float -> Float -> Bool
testaTriangulo a b c | a + b > c && a + c > b && b + c > a = True
                     | otherwise = False

--1.2
areaTriangulo :: Float -> Float -> Float -> Float
areaTriangulo a b c = sqrt(s*(s-a)*(s-b)*(s-c))
    where s = (a+b+c)/2

--1.3
metades :: [a] -> ([a], [a])
metades l = (take halflen l, drop halflen l)
    where halflen =div (length l) 2

--1.4
--a)
last' :: [a] -> a
last' l = head(reverse l)
--b)
init' :: [a] -> [a]
init' l = reverse(tail(reverse l))

--1.5






