{- Programma Haskell che implementa gli algoritmi di ordinamento Insert Sort, Select Sort e Bubble Sort. -}

import Data.Time  -- necessario per usare getCurrentTime e diffUTCTime, usati per misurare il tempo di esecuzione
import Data.List  -- necessario per usare delete

main :: IO ()
main = do putStrLn "Inserire la lista di numeri interi da ordinare racchiusa tra parentesi quadre:"
          input <- getLine
          let lista1 = read input :: [Int]
          let lista2 = read input :: [Int]
          let lista3 = read input :: [Int]
          putStrLn "\nLista ordinata con Insert Sort:"
          start1 <- getCurrentTime
          putStrLn $ show (insertSort lista1)
          stop1 <- getCurrentTime
          putStrLn "Tempo di esecuzione di Insert Sort:"
          putStrLn $ show (diffUTCTime stop1 start1)
          putStrLn "\nLista ordinata con Select Sort:"
          start2 <- getCurrentTime          
          putStrLn $ show (selectSort lista2)
          stop2 <- getCurrentTime          
          putStrLn "Tempo di esecuzione di Select Sort:"
          putStrLn $ show (diffUTCTime stop2 start2)
          putStrLn "\nLista ordinata con Bubble Sort:"
          start3 <- getCurrentTime 
          putStrLn $ show (bubbleSort lista3)
          stop3 <- getCurrentTime           
          putStrLn "Tempo di esecuzione di Bubble Sort:"
          putStrLn $ show (diffUTCTime stop3 start3)


{- La funzione insertSort implementa l'algoritmo di ordinamento Insert Sort. 
   Il suo unico argomento è la lista da ordinare. 
   Ad ogni step il primo elemento della lista viene rimosso dalla sequenza 
   non ordinata e viene inserito nella posizione corretta nella sequenza ordinata. -}

insertSort :: (Ord a) => [a] -> [a]
insertSort []                       = []
insertSort (x : xs)                 = insert $ insertSort xs
    where  
      insert []                     = [x]
      insert (y : ys) | x < y       = x : y : ys
                      | otherwise   = y : insert ys

{- La funzione selectSort implementa l'algoritmo di ordinamento Select Sort.
   Il suo unico argomento è la lista da ordinare. 
   Ad ogni step l'elemento minimo viene posizionato alla fine della sequenza ordinata. -}

selectSort :: (Ord a) => [a] -> [a]  
selectSort []      = []  
selectSort xs      = min : selectSort (delete min xs)  
      where 
        min        = minimum xs

{- La funzione bubbleSort implementa l'algoritmo di ordinamento Bubble Sort.
   Il suo unico argomento è la lista da ordinare. 
   Ad ogni step vengono effettuati confronti e scambi a due a due 
   fino a posizionare l'elemento minimo alla fine della sequenza ordinata. -}

bubbleSort :: (Ord a) => [a] -> [a]
bubbleSort []                                    = []
bubbleSort xs                                    = bubble id [] xs
     where
       bubble next xs (x : y : ys) | x <= y      = bubble next (x : xs) (y : ys)
                                   | otherwise   = bubble bubbleSort (y : xs) (x : ys)
       bubble next xs ys                         = next (reverse xs ++ ys) 
