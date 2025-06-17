{
  appimageTools,
  fetchurl,
}:
appimageTools.wrapType2 {
  name = "warp-terminal";

  src = fetchurl {
    url = "https://app.warp.dev/download?package=appimage";
    sha256 = "sha256-p9aLcV20BDJIk4phjXXerSD9b2AwKdbjWSQIs5m7Wsc=";
  };
}
