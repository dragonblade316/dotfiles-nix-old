{
  appimageTools,
  fetchurl,
  SDL2,
  openal,
  fuse,
  fusePackages,
  nss_latest,
  gtk3,
  binutils,
}:
appimageTools.wrapType2 {
  name = "beyond_all_reason";

  src = fetchurl {
    url = "https://github.com/beyond-all-reason/BYAR-Chobby/releases/download/v1.2470.0/Beyond-All-Reason-1.2470.0.AppImage";
    sha256 = "sha256-nWt/ONvlv72wvDGW2J4F+YY1tFRjhXw8viC53H2+sck=";
  };

  extraPkgs = pkgs: [
    SDL2
    openal
    fuse
    fusePackages.fuse_2
    nss_latest
    gtk3
    binutils
  ];
}
