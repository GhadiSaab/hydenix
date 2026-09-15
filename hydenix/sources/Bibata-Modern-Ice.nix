{
  lib,
  stdenv,
  pkgs,
}:

stdenv.mkDerivation {
  pname = "Bibata-Modern-Ice";
  version = "1.0.0";

  src = pkgs.fetchurl {
    # Previously fetched from HyDE-Project/HyDE's `master` branch, a moving
    # target; that file was removed upstream, breaking the build. Source
    # directly from the upstream cursor project instead, pinned to a release
    # tag for reproducibility.
    url = "https://github.com/ful1e5/Bibata_Cursor/releases/download/v2.0.7/Bibata-Modern-Ice.tar.xz";
    sha256 = "sha256-poyuYMTccGNQ4ZTryRxf5IvHvJ1Z4RlVWDSip+5QeO8=";
  };

  nativeBuildInputs = with pkgs; [
    jdupes
  ];

  installPhase = ''
    mkdir -p $out/share/icons/
    tar -xf $src -C $out/share/icons/
    jdupes --recurse $out/share/icons/
  '';

  meta = {
    description = "Bibata Modern Ice cursor theme";
    homepage = "https://github.com/HyDE-Project/HyDE";
    license = lib.licenses.gpl3;
    platforms = lib.platforms.all;
    maintainers = [ ];
  };
}
