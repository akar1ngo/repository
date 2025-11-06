{
  inputs.nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
  inputs.flake-utils.url = "github:numtide/flake-utils";

  outputs =
    { nixpkgs, flake-utils, ... }:
    flake-utils.lib.eachDefaultSystem (
      system:
      let
        pkgs = nixpkgs.legacyPackages.${system};
        packages = import ./packages { inherit pkgs; };
      in
      {
        packages = {
          inherit (pkgs) zed-editor;
          inherit (packages) litestream;
        };
      }
    );
}
