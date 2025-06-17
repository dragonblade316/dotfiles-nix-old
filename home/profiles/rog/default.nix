{
  imports = [
    ../../programs/git.nix
    ../../programs/misc.nix
    ../../themeing.nix
    ../../wayland/hypr
    ../../programs/eww
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
    ../../shell/nushell.nix
    ../../programs/kdeconnect.nix
  ];

  wayland.windowManager.hyprland.enableNvidiaPatches = true;
}
