{ name = "cip95"
, dependencies =
  [ "aff"
  , "aff-promise"
  , "cip30"
  , "console"
  , "effect"
  , "newtype"
  , "prelude"
  ]
, packages = ./packages.dhall
, sources = [ "src/**/*.purs", "test/**/*.purs" ]
}
