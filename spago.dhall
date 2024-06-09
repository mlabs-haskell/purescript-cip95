{ name = "cip95"
, dependencies =
  [ "aff", "aff-promise", "console", "effect", "newtype", "prelude" ]
, packages = ./packages.dhall
, sources = [ "src/**/*.purs", "test/**/*.purs" ]
}
