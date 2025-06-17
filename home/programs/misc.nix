{pkgs, ...}: let
  selfbuilt = import ../../pkgs {inherit pkgs;};
in {
  nixpkgs.config.permittedInsecurePackages = [
    "electron-24.8.6"
    "electron-25.9.0"
    "electron-19.1.9"
  ];
  #eventually all of this will probably be moved to other files as the config grows but for now this is a dumping ground
  home.packages = with pkgs; [
    libreoffice
    obsidian
    via #probably will not work until I reset udev rules
    vlc
    gparted
    wdisplays
    gnome.nautilus
    libsForQt5.dolphin
    gnome.gnome-system-monitor
    brave
    thunderbird
    zoom
    ardour
    # selfbuilt.cascadeur
    wineWowPackages.waylandFull
    # xwaylandvideobridge
    blueman
    steam-run
    pavucontrol
    localsend
    xwaylandvideobridge
    bottles
    # etcher
    rstreamdeck
    # warp-terminal
    xfce.thunar
    samba
  ];
}
