{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-22.11";
    futils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, futils }:
    let
      inherit (futils.lib) eachSystem flattenTree;
      systems = [ "x86_64-linux" ];
    in
    eachSystem systems (system: {
      packages = flattenTree
        (import ./pkgs {
          pkgs = import nixpkgs { inherit system; };
        });
    });
}
