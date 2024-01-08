{-# LANGUAGE CPP #-}

module Duckling.Compat
  ( KM.insert
  , KM.delete
  , fromText
  , takeWord16
  , dropWord16
  ) where

import Data.Text (Text)
import qualified Data.Text.Internal.Unsafe.Char as UText
import qualified Data.Text.Compat as Compat

# if MIN_VERSION_aeson(2, 0, 0)
import qualified Data.Aeson.KeyMap as KM
# else
import qualified Data.HashMap.Strict as KM
# endif

# if MIN_VERSION_aeson(2, 0, 0)
import Data.Aeson.Key (fromText)
# else
fromText :: Text -> Text
fromText = id
# endif

takeWord16 :: Int -> Text -> Text
takeWord16 = Compat.takeWord16

dropWord16 :: Int -> Text -> Text
dropWord16 = Compat.dropWord16
