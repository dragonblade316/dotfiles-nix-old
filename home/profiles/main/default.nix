{
  imports = [
    ../../programs/git.nix
    ../../programs/misc.nix
    ../../themeing.nix
    ../../wayland/hypr
    # ../../programs/eww
    ../../wayland/waybar.nix
    ../../terminals/kitty.nix
    ../../programs/mako.nix
    ../../editors/vscode
    ../../editors/intellij-idea
    ../../programs/art.nix
    ../../programs/comms.nix
    ../../programs/games.nix
    ../../programs/misc.nix
    ../../programs/fuzzel.nix
    ../../programs/dev.nix
    ../../programs/syncthing.nix
    # ../../programs/rstreamdeck.nix
    ../../programs/remote.nix
  ];
  wayland.windowManager.hyprland.extraConfig = ''
    #monitor=,preferred,auto,auto
    monitor= DP-3, 3840x2160@60, 1920x0, 1.5
    # workspace 1, monitor: DP-3,
    monitor= HDMI-A-1, 1920x1080@60, 0x1080, 1
    # workspace=HDMI-A-1,2
  '';
}
