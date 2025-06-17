{pkgs, ...}: {
  home.packages = with pkgs; [
    winetricks
    protontricks
    bottles
  ];
}
