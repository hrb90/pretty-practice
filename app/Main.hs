module Main where

import Data.Text.Prettyprint.Doc
import Data.Text.Prettyprint.Doc.Util (putDocW)
import Lib (testExpr)

checkWidth w = do
  putStrLn $ "width " <> show w
  putDocW w $ pretty testExpr
  putStrLn ""

main :: IO ()
main = do
  checkWidth 10
  checkWidth 20
  checkWidth 40
