module Lib ( getLineOrDefault ) where

getLineOrDefault :: String -> IO String
getLineOrDefault defaultValue = 
  (\input -> if null input then defaultValue else input)
  <$> 
  getLine