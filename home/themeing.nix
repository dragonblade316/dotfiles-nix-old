{
  config,
  pkgs,
  lib,
  ...
}: let
  #wallpaper = ./wallpapers/sans.png;
  #wallpaper = ./wallpapers/cat_bunnies.png;
  wallpaper = ./wallpapers/snellys.png;
  #the animated gif version has to be seperate because stylix cannot handle gifs
  animatedwallpaper = ./wallpapers/chill_with_gengar_and_mimikyu_loop.gif;

  nerdfont = "JetBrainsMono Nerd Font";
  home.packages = [pkgs.dconf];

  options.theming.useTilingWallPaper = lib.mkOption {
    type = lib.types.bool; # Set the data type (e.g., bool, string)
    default = true; # Define a default value (optional)
  };

  options.theming.animateTilingWallPaper = lib.mkOption {
    type = lib.types.bool; # Set the data type (e.g., bool, string)
    default = true; # Define a default value (optional)
  };
in {
  stylix = {
    image = wallpaper;
    polarity = "dark";
    opacity.terminal = 0.5;

    cursor = {
      package = pkgs.catppuccin-cursors;
      name = "macchiatoDark";
    };

    fonts = {
      serif = {
        package = pkgs.nerdfonts;
        name = "JetBrainsMono Nerd Font";
      };
      sansSerif = {
        package = pkgs.nerdfonts;
        name = "JetBrainsMono Nerd Font";
      };
      monospace = {
        package = pkgs.nerdfonts;
        name = "JetBrainsMono Nerd Font";
      };
      sizes = {
        desktop = 12;
        applications = 15;
        terminal = 15;
        popups = 12;
      };
    };
  };

  #stylix.base16Scheme = "${pkgs.base16-schemes}/share/themes/catppuccin-macchiato.yaml";
  stylix.base16Scheme = "${pkgs.base16-schemes}/share/themes/tokyo-city-dark.yaml";

  stylix.targets.bemenu.enable = false;

  #temp until I get candy icons working
  gtk.iconTheme = {
    package = pkgs.kora-icon-theme;
    name = "kora-grey";
  };

  #wallpaper stuff
  home = {
    file.".config/hypr/hyprpaper.conf".text = ''
      preload = ${wallpaper}
      wallpaper = HDMI-A-1, ${wallpaper}
      wallpaper = eDP-1, ${wallpaper}
      wallpaper = DP-3, ${wallpaper}
    '';

    packages = with pkgs; [
      hyprpaper
      swww
    ];
  };

  systemd = {
    user.startServices = "sd-switch";

    user.services.swww-daemon = {
      Unit = {
        description = "My Startup Script";
        Wants = "swww-picker.service";
      };
      Service = {
        Type = "simple";
        ExecStart = ''${pkgs.swww}/bin/swww-daemon'';

        Restarts = "always";
        StartLimitInterval = 15;
      };

      Install.WantedBy = ["graphical-session.target"]; # Starts after login
    };

    user.services.swww-picker = {
      Unit = {
        description = "swww wallpaper picker";
        #the way it works right now will not restart automatically after a homerebuild.
        After = ["swww-daemon.service"];
      };
      Install = {
        # WantedBy = [ "swww-daemon.service" ];
      };
      Service = {
        Type = "oneshot";
        ExecStart = "${pkgs.swww}/bin/swww img ${animatedwallpaper}";
      };
    };
  };
}
