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
#if MIN_VERSION_text(2,0,2)
takeWord16 n t = undefined
#else
takeWord16 n t = UText.takeWord16 n t
#endif

dropWord16 :: Int -> Text -> Text
#if MIN_VERSION_text(2,0,2)
dropWord16 n t = undefined
#else
dropWord16 n t = UText.takeWord16 n t
#endif
