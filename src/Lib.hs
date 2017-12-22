module Lib
  ( Expr(..)
  , testExpr
  ) where

import Data.Text.Prettyprint.Doc

data Expr
  = Literal Integer
  | Sum [Expr]
  | Product [Expr]

testExpr :: Expr
testExpr =
  Sum
    [ Literal 300
    , Product [Literal 10, Literal 5, Literal 1, Literal 10, Literal 2]
    , Product
        [ Literal 2
        , Literal 2
        , Sum [Literal 1, Literal 1]
        , Literal 2
        , Literal 2
        , Literal 2
        ]
    , Literal 200
    ]

parens' :: [Doc ann] -> [Doc ann]
parens' xs = [pretty "("] `mappend` xs `mappend` [pretty ")"]

instance Pretty Expr where
  pretty (Literal x) = pretty x
  pretty (Sum xs) =
    align $ sep $ parens' $ punctuate (space <> pretty "+") (fmap pretty xs)
  pretty (Product xs) =
    align $ sep $ punctuate (space <> pretty "*") (fmap pretty xs)
