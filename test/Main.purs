module Test.Main where

import Prelude

import Cardano.Wallet.Cip95 (WalletName, enable, getPubDrepKey, getRegisteredPubStakeKeys, getUnregisteredPubStakeKeys)
import Data.Newtype (wrap)
import Effect (Effect)
import Effect.Aff (delay, launchAff_)
import Effect.Class (liftEffect)
import Effect.Class.Console (log)

-- | This test suite must be bundled and run in the browser.
-- | Use `make test` to run it.
main :: Effect Unit
main = launchAff_ do
  -- wait for all extensions to inject their API entry points
  delay (wrap 2000.0)
  walletName <- liftEffect getWallet
  api <- enable walletName
  do
    pubDrepKey <- getPubDrepKey api
    log $ "getPubDrepKey(): " <> show pubDrepKey
  do
    registeredPubStakeKeys <- getRegisteredPubStakeKeys api
    log $ "getRegisteredPubStakeKeys(): " <> show registeredPubStakeKeys
  do
    unregisteredPubStakeKeys <- getUnregisteredPubStakeKeys api
    log $ "getUnregisteredPubStakeKeys(): " <> show unregisteredPubStakeKeys
  pure unit

foreign import getWallet :: Effect WalletName
