{ lib
, fetchgit
, stdenv
, pkgs
}:

stdenv.mkDerivation rec {
  pname = "nolimips";
  version = "0.11";

  src = fetchgit {
    url = "https://gitlab.lre.epita.fr/tiger/nolimips.git";
    rev = "ee03e7821ff2a07147c7621f3b3da39df765ff19";
    sha256 = "sha256-fmQyTAVFrnPcJ1r7nfpG0qQOO8tXdvzGThQwrfCMpJQ=";
  };

  enableParallelBuilding = true;

  preConfigure = ''
    patchShebangs --build ./dev/
    patchShebangs --build ./doc/
    patchShebangs --build ./src/inst/
    patchShebangs --build ./src/parse/
    ./bootstrap
  '';

  nativeBuildInputs = with pkgs; [
    libtool
    autoconf
    autoconf-archive
    automake
    gnum4
    bison
    flex
    clang
    texinfo
    python3
    perl
  ];

  doCheck = true;
  doInstallCheck = true;

  meta = with lib; {
    description = "Nolimips, basic MIPS architecture simulator";
    homepage = "https://www.lrde.epita.fr/wiki/Nolimips";
    license = licenses.gpl2;
    platforms = platforms.all;
  };
}
