module Main where

import Polinomio
import T1

main :: IO () --Menu
main = do
  putStrLn "1. Normalizar: "
  putStrLn "2. Adicionar: "
  putStrLn "3. Multiplicar: "
  putStrLn "4. Derivada: "
  nr <- getChar
  d <- getLine
  if nr == '1'
    then do
      putStrLn "Polinomio?"
      p <- getLine
      putStrLn $ outputNormalize (convertStringPoly p)
      main
    else
      if nr == '2'
        then do
          putStrLn "Polinomio 1?"
          p1 <- getLine
          putStrLn "Polinomio 2?"
          p2 <- getLine
          putStrLn $ outputAdd (convertStringPoly p1) (convertStringPoly p2)
          main
        else
          if nr == '3'
            then do
              putStrLn "Polinomio 1?"
              p1 <- getLine
              putStrLn "Polinomio 2?"
              p2 <- getLine
              putStrLn $ outputMulti (convertStringPoly p1) (convertStringPoly p2)
              main
            else
              if nr == '4'
                then do
                  putStrLn "Polinomio 1?"
                  p <- getLine
                  putStrLn "Variavel?"
                  c <- getChar
                  d <- getLine
                  putStrLn $ outputDerive (convertStringPoly p) c
                  main
                else do
                  return ()
