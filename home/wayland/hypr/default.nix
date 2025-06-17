{pkgs, ...}: {
  #imports = [./config.nix];
  wayland.windowManager.hyprland = {
    enable = true;
    settings = {
      exec-once = [
        "waybar"
        "udiskie &"
        # "hyprpaper"
        "xwaylandvideobridge"
        "blueman-applet"
        "Rstreamdeck"
      ];

      input = {
        kb_layout = "us";
        follow_mouse = 1;
      };

      general = {
        gaps_in = 5;
        gaps_out = 20;
        border_size = 2;
        #col.active_border = rgba(33ccffee) rgba(00ff99ee) 45deg
        #col.inactive_border = rgba(595959aa)
      };

      decoration = {
        rounding = 10;
        drop_shadow = true;
        shadow_range = 4;
        shadow_render_power = 3;
      };

      animations = {
        #enable = "yes";

        bezier = ["pop, 0.05, 0.9, 0.1, 1.05"];

        animation = [
          "windows, 1, 7, pop"
          "windowsOut, 1, 10, default"
          "border, 1, 10, default"
          "borderangle, 1, 8, default"
          "fade, 1, 7, default"
          "workspaces, 1, 6, default"
        ];
      };

      # misc = {
      # 	vrr = 1;
      # };
      #

      bind = [
        "SUPER, Q, exec, kitty"
        "SUPER, C, killactive"
        "SUPER, M, exec, swaylock"
        "SUPERSHIFTALT, M, exit"
        "SUPER, E, exec, thunar"
        "SUPER, F, togglefloating"
        "SUPERALT, F, fullscreen"
        "SUPER, R, exec, fuzzel"
        #need a toggle split keybind
        "SUPER, G, togglesplit"
        "SUPER, S, exec, grim -g $(slurp) - | swappy -f -"
        "SUPERALT, j, exec, makoctl dismiss"
        "SUPERALT, k, exec, makoctl restore"

        #vim bindings
        "SUPER, h, movefocus, l"
        "SUPER, l, movefocus, r"
        "SUPER, k, movefocus, u"
        "SUPER, j, movefocus, d"

        "SUPERSHIFT, h, movewindow, l"
        "SUPERSHIFT, l, movewindow, r"
        "SUPERSHIFT, j, movewindow, u"
        "SUPERSHIFT, k, movewindow, d"

        #standard bindings
        #"SUPER, left, move, l"

        "SUPER, 1, workspace, 1"
        "SUPER, 2, workspace, 2"
        "SUPER, 3, workspace, 3"
        "SUPER, 4, workspace, 4"
        "SUPER, 5, workspace, 5"
        "SUPER, 6, workspace, 6"
        "SUPER, 7, workspace, 7"
        "SUPER, 8, workspace, 8"
        "SUPER, 9, workspace, 9"
        "SUPER, 0, workspace, 10"

        "SUPERSHIFT, 1, movetoworkspace, 1"
        "SUPERSHIFT, 2, movetoworkspace, 2"
        "SUPERSHIFT, 3, movetoworkspace, 3"
        "SUPERSHIFT, 4, movetoworkspace, 4"
        "SUPERSHIFT, 5, movetoworkspace, 5"
        "SUPERSHIFT, 6, movetoworkspace, 6"
        "SUPERSHIFT, 7, movetoworkspace, 7"
        "SUPERSHIFT, 8, movetoworkspace, 8"
        "SUPERSHIFT, 9, movetoworkspace, 9"
        "SUPERSHIFT, 0, movetoworkspace, 10"
      ];

      env = [
        "WLR_NO_HARDWARE_CURSORS, 1"
      ];
    };

    extraConfig = ''
      #monitor=,preferred,auto,auto
      # monitor= eDP-1, 2560x1440@165, 5760x720, 1
      # workspace=eDP-1,2
      # monitor= DP-1, 3840x2160@60, 1920x0, 1
      # workspace DP-1,1
      # monitor= HDMI-A-1, 1920x1080@60, 0x1080, 1
      # workspace=HDMI-A-1,3

      #for some reason home manager did not like the windowrulev2. will need to figure out how to set it up but I am too tired right now.
      windowrulev2 = opacity 0.0 override 0.0 override,class:^(xwaylandvideobridge)$
      windowrulev2 = noanim,class:^(xwaylandvideobridge)$
      windowrulev2 = nofocus,class:^(xwaylandvideobridge)$
      windowrulev2 = noinitialfocus,class:^(xwaylandvideobridge)$
    '';

    # plugins = [
    # 	inputs.hyprland-plugins.packages.${pkgs.system}.csgo-vulkan-fix
    # ];
  };

  home.packages = with pkgs; [
    grim
    slurp
    wl-clipboard
    swappy
  ];
}
