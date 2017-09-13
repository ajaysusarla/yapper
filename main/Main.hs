module Main where

import Yapper.OptArgs (parseOptArgs)

import Network.Socket

main :: IO ()
main = do
  opts <- parseOptArgs
  putStrLn "Yapper, coming soon!"
