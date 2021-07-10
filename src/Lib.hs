module Lib where

getLineOrDefault :: String -> IO String
getLineOrDefault defaultValue = getLine >>=
  (\input -> pure $ if null input then defaultValue else input)