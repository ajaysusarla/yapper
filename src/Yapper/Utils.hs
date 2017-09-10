{-# LANGUAGE TemplateHaskell #-}

module Yapper.Utils (
  -- Functions
  getYapperVersion
  ) where

import Prelude (String, (++), (==), take)

import Development.GitRev
import Data.Version (showVersion)
import Paths_yapper (version)

getYapperVersion :: String
getYapperVersion = "Yapper Version: " ++ showVersion version ++ suffix
  where
    suffix = if $(gitHash) == "UNKNOWN" then "" else "-" ++ take 7 $(gitHash)
