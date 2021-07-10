module Lib where

getLineOrDefault :: String -> IO String
getLineOrDefault defaultValue = do
  input <- getLine
  if input == ""
    then pure defaultValue
    else pure input