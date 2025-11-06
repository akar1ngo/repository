{ pkgs, ... }:

{
  litestream = pkgs.callPackage ./litestream.nix { };
}
