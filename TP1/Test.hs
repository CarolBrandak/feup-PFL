module Test where

import Polinomio
import T1

--Testes de normalizar
normalizeTest1 :: IO ()
normalizeTest1 = do
  putStrLn $ "(" ++ convert (remove0 p0) 0 ++ ")"
  putStrLn $ "Expected: " ++ convert [(7, "xy", [0, 2]), (3, "xy", [0, 1]), (5, "xyZ", [0, 0, 1])] 0
  putStrLn $ "Result:   " ++ outputNormalize p0 ++ "\n"

normalizeTest2 :: IO ()
normalizeTest2 = do
  putStrLn $ "(" ++ convert (remove0 p3) 0 ++ ")"
  putStrLn $ "Expected: " ++ convert [(2, "aewxz", [1, 1, 1, 1, 1]), (30, [], [])] 0
  putStrLn $ "Result:   " ++ outputNormalize p3 ++ "\n"

normalizeTest3 :: IO ()
normalizeTest3 = do
  putStrLn $ "(" ++ convert (remove0 p5) 0 ++ ")"
  putStrLn $ "Expected: " ++ convert [(9, "zxy", [3, 0, 0]), (2, "xyz", [1, 1, 2]), (-6, "xyz", [0, 1, 2])] 0
  putStrLn $ "Result:   " ++ outputNormalize p5 ++ "\n"

--Testes de adicionar
addTest1 :: IO ()
addTest1 = do
  putStrLn $ "(" ++ convert p1 0 ++ ") + (" ++ convert p2 0 ++ ")"
  putStrLn $ "Expected: " ++ convert [(2, ['x'], [2]), (1, ['x', 'y'], [1, 1]), (5, ['x'], [1]), (4, [], [])] 0
  putStrLn $ "Result:   " ++ outputAdd p1 p2 ++ "\n"

addTest2 :: IO ()
addTest2 = do
  putStrLn $ "(" ++ convert p3 0 ++ ") + (" ++ convert p4 0 ++ ")"
  putStrLn $ "Expected: " ++ convert [(1, "xyz", [2, 3, 4]), (2, "aewxz", [1, 1, 1, 1, 1]), (2, "x", [1]), (31, [], [])] 0
  putStrLn $ "Result:   " ++ outputAdd p3 p4 ++ "\n"

addTest3 :: IO ()
addTest3 = do
  putStrLn $ "(" ++ convert p0 0 ++ ") + (" ++ convert p5 0 ++ ")"
  putStrLn $ "Expected: " ++ convert [(9, "z", [3]), (7, "y", [2]), (2, "yxz", [1, 1, 2]), (-6, "yz", [1, 2]), (3, "y", [1]), (5, "z", [1])] 0
  putStrLn $ "Result:   " ++ outputAdd p0 p5 ++ "\n"

--Testes de multiplicar

multiTest1 :: IO ()
multiTest1 = do
  putStrLn $ "(" ++ convert p0 0 ++ ") + (" ++ convert p1 0 ++ ")"
  putStrLn $ "Expected: " ++ convert [(9, "xy", [2, 1]), (15, "xz", [2, 1]), (21, "xy", [2, 2]), (35, "xy", [1, 2]), (-42, "y", [2]), (15, "xy", [1, 1]), (-18, "y", [1]), (25, "xz", [1, 1]), (-30, "z", [1])] 0
  putStrLn $ "Result:   " ++ outputMulti p0 p1 ++ "\n"

multiTest2 :: IO ()
multiTest2 = do
  putStrLn $ "(" ++ convert p3 0 ++ ") + (" ++ convert p4 0 ++ ")"
  putStrLn $ "Expected: " ++ convert [(2, "aewxyz", [1, 1, 1, 3, 3, 5]), (30, "xyz", [2, 3, 4]), (4, "aewxz", [1, 1, 1, 2, 1]), (2, "aewxz", [1, 1, 1, 1, 1]), (60, "x", [1]), (30, "", [])] 0
  putStrLn $ "Result:   " ++ outputMulti p3 p4 ++ "\n"

multiTest3 :: IO ()
multiTest3 = do
  putStrLn $ "(" ++ convert p2 0 ++ ") + (" ++ convert p5 0 ++ ")"
  putStrLn $ "Expected: " ++ convert [(-2, "xyz", [3, 1, 2]), (-9, "xz", [2, 3]), (9, "xyz", [1, 1, 3]), (90, "z", [3]), (6, "xyz", [2, 1, 2]), (2, "xyz", [2, 2, 2]), (-6, "xyz", [1, 2, 2]), (20, "xyz", [1, 1, 2]), (-60, "yz", [1, 2])] 0
  putStrLn $ "Result:   " ++ outputMulti p2 p5 ++ "\n"

--Testes de derivar
deriveTest1 :: IO ()
deriveTest1 = do
  putStrLn $ "Derive: " ++ convert p5 0 ++ " from x"
  putStrLn $ "Expected: " ++ convert [(2, ['y', 'z'], [1, 2])] 0
  putStrLn $ "Result:   " ++ outputDerive p5 'x'

deriveTest2 :: IO ()
deriveTest2 = do
  putStrLn $ "Derive: " ++ convert p5 0 ++ " from y"
  putStrLn $ "Expected: " ++ convert [(2, "xz", [1, 2]), (-6, "z", [2])] 0
  putStrLn $ "Result:   " ++ outputDerive p5 'y'

deriveTest3 :: IO ()
deriveTest3 = do
  putStrLn $ "Derive: " ++ convert p5 0 ++ " from z"
  putStrLn $ "Expected: " ++ convert [(27, "z", [2]), (-12, "yz", [1, 1]), (4, "xyz", [1, 1, 1])] 0
  putStrLn $ "Result:   " ++ outputDerive p5 'z'

--Testar ordenação por expoente
orderExpTest1 :: IO ()
orderExpTest1 = do
  putStrLn $ "(" ++ convert p5 0 ++ ")"
  putStrLn $ "Expected: " ++ convert [(9, "zxy", [3, 0, 0]), (2, "zyx", [2, 1, 1]), (-6, "zyx", [2, 1, 0])] 0
  putStrLn $ "Result:   " ++ convert (orderPoly (convertTupleToPoly (orderVar (remove0 p5)))) 0

orderExpTest2 :: IO ()
orderExpTest2 = do
  putStrLn $ "(" ++ convert p0 0 ++ ")"
  putStrLn $ "Expected: " ++ convert [(7, "yzx", [2, 0, 0]), (2, "yzx", [1, 0, 0]), (1, "yzx", [1, 0, 0]), (5, "zyx", [1, 0, 0])] 0
  putStrLn $ "Result:   " ++ convert (orderPoly (convertTupleToPoly (orderVar (remove0 p0)))) 0

orderExpTest3 :: IO ()
orderExpTest3 = do
  putStrLn $ "(" ++ convert p4 0 ++ ")"
  putStrLn $ "Expected: " ++ convert [(1, "zyx", [4, 3, 2]), (2, "x", [1]), (1, "", [])] 0
  putStrLn $ "Result:   " ++ convert (orderPoly (convertTupleToPoly (orderVar (remove0 p4)))) 0

--Testar ordenação por variavel
orderVarTest1 :: IO ()
orderVarTest1 = do
  putStrLn $ "(" ++ convert p5 0 ++ ")"
  putStrLn $ "Expected: " ++ convert [(9, "zxy", [3, 0, 0]), (2, "xyz", [1, 1, 2]), (-6, "xyz", [0, 1, 2])] 0
  putStrLn $ "Result:   " ++ convert (convertTupleToPoly (orderVar (orderPoly (remove0 p5)))) 0

orderVarTest2 :: IO ()
orderVarTest2 = do
  putStrLn $ "(" ++ convert p0 0 ++ ")"
  putStrLn $ "Expected: " ++ convert [(7, "yzx", [2, 0, 0]), (2, "yzx", [1, 0, 0]), (1, "yzx", [1, 0, 0]), (5, "zyx", [1, 0, 0])] 0
  putStrLn $ "Result:   " ++ convert (convertTupleToPoly (orderVar (orderPoly (remove0 p0)))) 0

orderVarTest3 :: IO ()
orderVarTest3 = do
  putStrLn $ "(" ++ convert p4 0 ++ ")"
  putStrLn $ "Expected: " ++ convert [(1, "xyz", [2, 3, 4]), (2, "x", [1]), (1, "", [])] 0
  putStrLn $ "Result:   " ++ convert (convertTupleToPoly (orderVar (orderPoly (remove0 p4)))) 0

--Testar ordenação por numero de variaveis
orderLengthTest1 :: IO ()
orderLengthTest1 = do
  putStrLn $ "(" ++ convert p6 0 ++ ")"
  putStrLn $ "Expected: " ++ convert [(-6, "xyz", [1, 1, 1]), (2, "yz", [1, 1]), (9, "z", [1])] 0
  putStrLn $ "Result:   " ++ convert (convertTupleToPoly (orderVar (orderPoly (remove0 p6)))) 0

--Testar ordenação por ordem alfabetica
orderAlphaTest1 :: IO ()
orderAlphaTest1 = do
  putStrLn $ "(" ++ convert p7 0 ++ ")"
  putStrLn $ "Expected: " ++ convert [(1, "a", [1]), (1, "b", [1]), (1, "c", [1]), (1, "d", [1]), (1, "g", [1]), (1, "k", [1]), (1, "r", [1]), (1, "s", [1])] 0
  putStrLn $ "Result:   " ++ convert (convertTupleToPoly (orderVar (orderPoly (remove0 p7)))) 0
