{pkgs, ...}: {
  home.packages = with pkgs; [
    steam
    gamescope
    winetricks
    protontricks
    (lutris.override {extraLibraries = pkgs: [pkgs.libunwind];})
    heroic
    xonotic
    grapejuice
    prismlauncher

    sidequest
    alvr
  ];
}
