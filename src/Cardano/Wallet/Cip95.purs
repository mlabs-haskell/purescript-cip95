-- | Interact with the wallet over CIP-95 interface
-- | description: https://cips.cardano.org/cip/CIP-0095
-- |
-- | This code works by inspecting the `window.cardano` object, which
-- | should be injected by the wallet to the window.
module Cardano.Wallet.Cip95
  ( Api
  , PubDrepKey
  , PubStakeKey
  , WalletName
  , enable
  , getPubDrepKey
  , getRegisteredPubStakeKeys
  , getUnregisteredPubStakeKeys
  , signData
  , signTx
  ) where

import Prelude

import Control.Promise (Promise, toAffE)
import Effect (Effect)
import Effect.Aff (Aff)

----------------------------------------------------------------------
-- Data Types

-- | A datatype representing a CIP-95 connection object.
foreign import data Api :: Type

type WalletName = String

-- | A hex-encoded string representing 32-byte Ed25519 DRep public
-- | key, as described in CIP-0105.
type PubDrepKey = String

-- | A hex-encoded string representing 32-byte Ed25519 public key
-- | used as a staking credential.
type PubStakeKey = String

-- | A hex-encoded string of the corresponding bytes.
type Bytes = String

-- | A hex-encoded string representing CBOR.
type Cbor = String

type DataSignature =
  { key :: Cbor
  , signature :: Cbor
  }

----------------------------------------------------------------------
-- API

-- | Enables wallet and reads CIP-95 API if the wallet is available.
enable :: WalletName -> Aff Api
enable = toAffE <<< _getWalletApi

-- | Get the public DRep key associated with the connected wallet.
getPubDrepKey :: Api -> Aff PubDrepKey
getPubDrepKey = toAffE <<< _getPubDrepKey

-- | Get the registered public stake keys associated with the
-- | connected wallet.
getRegisteredPubStakeKeys :: Api -> Aff (Array PubStakeKey)
getRegisteredPubStakeKeys = toAffE <<< _getRegisteredPubStakeKeys

-- | Get the unregistered public stake keys associated with the
-- | connected wallet.
getUnregisteredPubStakeKeys :: Api -> Aff (Array PubStakeKey)
getUnregisteredPubStakeKeys = toAffE <<< _getUnregisteredPubStakeKeys

-- | Request the wallet to inspect and provide a cryptographic
-- | signature for the supplied data.
signData :: Api -> String -> Bytes -> Aff DataSignature
signData api addrOrDrepId payload = toAffE (_signData api addrOrDrepId payload)

-- | Request the wallet to inspect and provide appropriate witnesses
-- | for the supplied transaction.
signTx :: Api -> Cbor -> Boolean -> Aff Cbor
signTx api tx isPartialSign = toAffE (_signTx api tx isPartialSign)

----------------------------------------------------------------------
-- FFI

foreign import _getWalletApi :: WalletName -> Effect (Promise Api)
foreign import _getPubDrepKey :: Api -> Effect (Promise PubDrepKey)
foreign import _getRegisteredPubStakeKeys :: Api -> Effect (Promise (Array PubStakeKey))
foreign import _getUnregisteredPubStakeKeys :: Api -> Effect (Promise (Array PubStakeKey))
foreign import _signData :: Api -> String -> Bytes -> Effect (Promise DataSignature)
foreign import _signTx :: Api -> Cbor -> Boolean -> Effect (Promise Cbor)
