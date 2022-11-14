# ic-management-canister

IC Management Canister types

To import, add this to your vessel package-set

```
// package-set.dhall
let upstream =
  https://github.com/dfinity/vessel-package-set/releases/download/mo-0.6.21-20220215/package-set.dhall sha256:b46f30e811fe5085741be01e126629c2a55d4c3d6ebf49408fb3b4a98e37589b

let packages = [
  { name = "management-canister"
  , repo = "https://github.com/krpeacock/ic-management-canister"
  , version = "main"
  , dependencies = [ "base" ]
  },
]

in  upstream # packages
```

```
// vessell.dhall
{ dependencies = [ "base", "management-canister" ], compiler = Some "0.6.21" }
```

**note**
You may want to update your compiler or Motoko versions.

Then, in your code:
