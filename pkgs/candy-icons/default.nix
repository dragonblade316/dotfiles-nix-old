{
  stdenv,
  fetchFromGitHub,
}:
stdenv.mkDerivation {
  name = "candy-icons";

  src = fetchFromGitHub {
    owner = "EliverLara";
    repo = "candy-icons";
    rev = "master"; # Replace with a specific version if desired
    sha256 = "..."; # Obtain the SHA-256 checksum for verification
  };

  installPhase = ''
    mkdir -p $out/share/icons
    cp -r Candy-icons $out/share/icons/
  '';
}
