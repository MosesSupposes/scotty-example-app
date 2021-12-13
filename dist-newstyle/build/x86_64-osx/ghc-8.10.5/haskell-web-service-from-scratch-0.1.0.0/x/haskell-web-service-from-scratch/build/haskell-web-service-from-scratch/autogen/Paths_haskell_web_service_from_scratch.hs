{-# LANGUAGE CPP #-}
{-# LANGUAGE NoRebindableSyntax #-}
{-# OPTIONS_GHC -fno-warn-missing-import-lists #-}
{-# OPTIONS_GHC -Wno-missing-safe-haskell-mode #-}
module Paths_haskell_web_service_from_scratch (
    version,
    getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir,
    getDataFileName, getSysconfDir
  ) where

import qualified Control.Exception as Exception
import Data.Version (Version(..))
import System.Environment (getEnv)
import Prelude

#if defined(VERSION_base)

#if MIN_VERSION_base(4,0,0)
catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
#else
catchIO :: IO a -> (Exception.Exception -> IO a) -> IO a
#endif

#else
catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
#endif
catchIO = Exception.catch

version :: Version
version = Version [0,1,0,0] []
bindir, libdir, dynlibdir, datadir, libexecdir, sysconfdir :: FilePath

bindir     = "/Users/moses/.cabal/bin"
libdir     = "/Users/moses/.cabal/lib/x86_64-osx-ghc-8.10.5/haskell-web-service-from-scratch-0.1.0.0-inplace-haskell-web-service-from-scratch"
dynlibdir  = "/Users/moses/.cabal/lib/x86_64-osx-ghc-8.10.5"
datadir    = "/Users/moses/.cabal/share/x86_64-osx-ghc-8.10.5/haskell-web-service-from-scratch-0.1.0.0"
libexecdir = "/Users/moses/.cabal/libexec/x86_64-osx-ghc-8.10.5/haskell-web-service-from-scratch-0.1.0.0"
sysconfdir = "/Users/moses/.cabal/etc"

getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath
getBinDir = catchIO (getEnv "haskell_web_service_from_scratch_bindir") (\_ -> return bindir)
getLibDir = catchIO (getEnv "haskell_web_service_from_scratch_libdir") (\_ -> return libdir)
getDynLibDir = catchIO (getEnv "haskell_web_service_from_scratch_dynlibdir") (\_ -> return dynlibdir)
getDataDir = catchIO (getEnv "haskell_web_service_from_scratch_datadir") (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "haskell_web_service_from_scratch_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "haskell_web_service_from_scratch_sysconfdir") (\_ -> return sysconfdir)

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir ++ "/" ++ name)
