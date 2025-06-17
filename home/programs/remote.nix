{pkgs, ...}: {
  home.packages = with pkgs; [
    ngrok
    parsec-bin
  ];
}
