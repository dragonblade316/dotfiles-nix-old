{
  imports = [
    ../../programs/git.nix
    ../../programs/misc.nix
    ../../themeing.nix
    ../../wayland/hypr
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
    ../../programs/remote.nix
  ];

  #ignore the weird scaling factor
  wayland.windowManager.hyprland.extraConfig = ''
    monitor= eDP-1, 2256x1504@60, 0x0, 1.566667
  '';
}
