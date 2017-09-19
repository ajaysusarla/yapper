module Main where

import Yapper.OptArgs (parseOptArgs)

main :: IO ()
main = do
  opts <- parseOptArgs
  putStrLn "Yapper, coming soon!"
