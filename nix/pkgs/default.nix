{ pkgs }:

{
  havm = pkgs.callPackage ./havm { };
  nolimips = pkgs.callPackage ./nolimips { };
  reflex = pkgs.callPackage ./reflex { };
}
