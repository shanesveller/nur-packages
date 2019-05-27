{ lib, pkgs, stdenv, fetchFromGitHub }:

stdenv.mkDerivation rec {
  name = "dockutil-${version}";
  version = "2.0.5";

  # nix-prefetch-git https://github.com/kcrawford/dockutil.git --rev 2.0.5
  src = fetchFromGitHub {
    owner = "kcrawford";
    repo = "dockutil";
    rev = "${version}";
    sha256 = "000y3jqbyk9hwcs27x7v2bifgjjfpmrafc5sfgqxn2lkw2wy9l7j";
  };

  buildInputs = [ pkgs.python27 ];

  phases = [ "unpackPhase" "installPhase" "fixupPhase" ];

  sourceRoot = ".";

  installPhase = ''
    mkdir -p $out/bin
    cp $src/scripts/dockutil $out/bin/dockutil
    chmod +x $out/bin/dockutil
  '';

  meta = {
    description = "Command line tool for managing dock items";
    homepage = https://github.com/kcrawford/dockutil;
    license = lib.licenses.asl20;
    maintainers = [];
    platforms = stdenv.lib.platforms.all;
  };
}
