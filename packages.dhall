let upstream =
      https://github.com/purescript/package-sets/releases/download/psc-0.15.4-20221013/packages.dhall
        sha256:21000b190e1ef14c92feb1400816022319bc40a30280d20f24c0dcacfb85e966

let additions =
      { cip30 =
        { dependencies =
          [ "aff"
          , "aff-promise"
          , "arrays"
          , "console"
          , "effect"
          , "literals"
          , "maybe"
          , "newtype"
          , "nullable"
          , "prelude"
          , "untagged-union"
          ]
        , repo = "https://github.com/mlabs-haskell/purescript-cip30"
        , version = "8f1b34b48825fcec5e9c67f33e255770b1e0bc45"
        }
      }

in upstream // additions
