{
  config,
  pkgs,
  ...
}:
with config.lib.stylix.colors.withHashtag;
with config.stylix.fonts; {
  programs.waybar = {
    enable = true;
    settings = {
      mainBar = {
        layer = "top";
        position = "top";

        modules-left = ["mpris" "wireplumber"];
        modules-center = ["hyprland/workspaces"];
        modules-right = ["battery" "cpu" "memory" "network" "tray" "clock"];

        "mpris" = {
          format = ''{player_icon} {dynamic}'';
          format-paused = ''{status_icon} <i>{dynamic}</i>'';
          player-icons = {
            default = "▶";
            mpv = "🎵";
          };
          status-icons = {
            paused = "⏸";
          };
          max-length = 40;
        };

        "wireplumber" = {
          format = ''{volume}% {icon}'';
          format-muted = ''{volume}% '';
          on-click = "pamixer --toggle-mute";
          on-click-middle = "pavucontrol";
          on-scroll-up = "pamixer --increase 1";
          on-scroll-down = "pamixer --decrease 1";
          format-icons = ["" "" ""];
        };

        "cpu" = {
          interval = 10;
          format = "{}% ";
          max-length = 10;
        };

        # "cpu" = {
        # 	interval = 1;
        # 	format = ''{icon0}{icon1}{icon2}{icon3}{icon4}{icon5}{icon6}{icon7}'';
        # 	format-icons = [
        # 		''<span color='#69ff94'>▁</span>'' # green
        #       	''<span color='#2aa9ff'>▂</span>'' # blue
        #       	''<span color='#f8f8f2'>▃</span>'' # white
        #       	''<span color='#f8f8f2'>▄</span>'' # white
        #       	''<span color='#ffffa5'>▅</span>'' # yellow
        #       	''<span color='#ffffa5'>▆</span>'' # yellow
        #       	''<span color='#ff9977'>▇</span>'' # orange
        #       	''<span color='#dd532e'>█</span>''
        # 	];
        # };

        "memory" = {
          interval = 30;
          format = ''{}% '';
          max-length = 10;
        };

        "tray" = {
          spacing = 5;
        };

        "battery" = {
          interval = 60;
          states = {
            warning = 30;
            critical = 15;
          };
          format = ''{capacity}% {icon}'';
          format-icons = ["" "" "" "" ""];
          max-length = 25;
        };

        "network" = {
          format = ''{ifname}'';
          format-wifi = ''{essid} ({signalStrength}%) '';
          format-ethernet = ''{ipaddr}/{cidr} '';
          format-disconnected = ''disconnected'';
          tooltip-format = ''{ifname} via {gwaddr} '';
          tooltip-format-wifi = ''{essid} ({signalStrength}%) '';
          tooltip-format-ethernet = ''{ifname}'';
          tooltip-format-disconnected = ''Disconnected'';
          max-length = 50;
          on-click = "kitty nmtui";
        };

        "temperature" = {
          format = "{temperatureC}°C ";
        };
      };
    };

    # style = ''
    #  	* {
    #    			font-family: "FiraMono Nerd Font";
    #    			font-size: 18px;
    #    			font-weight: 500;
    #    			padding: 0.5;
    #    			margin: 0;
    #    			margin-right: 15px;
    #    			margin-left: 15px;
    #    			transition-delay: 3s;
    #  	}
    # '';

    style = ''
      @define-color base00 ${base00};
      @define-color base01 ${base01};
      @define-color base02 ${base02};
      @define-color base03 ${base03};
         @define-color base04 ${base04};
      @define-color base05 ${base05};
      @define-color base06 ${base06};
      @define-color base07 ${base07};
         @define-color base08 ${base08};
      @define-color base09 ${base09};
      @define-color base0A ${base0A};
      @define-color base0B ${base0B};
         @define-color base0C ${base0C};
      @define-color base0D ${base0D};
      @define-color base0E ${base0E};
      @define-color base0F ${base0F};

      * {
      	border: none;
      	border-radius: 0px;
      	font-family: "${sansSerif.name}";
      	font-size: 14px;
      	min-height: 0;
      }

      window#waybar {
      		background: transparent;
      }

      #workspaces {
      		background: @base01;
      		margin: 5px 5px;
      		padding: 8px 5px;
      		border-radius: 16px;
      		color: @base01
      }
      #workspaces button {
      		padding: 0px 5px;
      		margin: 0px 3px;
      		border-radius: 16px;
      		color: transparent;
      		/*background: @base01;*/
      		transition: all 0.3s ease-in-out;
      }

      #workspaces button.active {
      		background-color: @base0A;
      		color: @base01;
      		border-radius: 16px;
      		min-width: 50px;
      		background-size: 400% 400%;
      		transition: all 0.3s ease-in-out;
      }

      #workspaces button:hover {
      		background-color: #f5f5f5;
      		color: #11111B;
      		border-radius: 16px;
      		min-width: 50px;
      		background-size: 400% 400%;
      }

      #tray, #pulseaudio, #network, #battery, #memory, #cpu, #mpris, #wireplumber {
      		color: #f5f5f5;
      		background: @base01;
      		border-radius: 24px 24px 24px 24px;
      		padding: 0 20px;

      		font-weight: bold;
      		margin: 9px 2px 0 2px;
      		opacity: 1;
      }


      #clock {
      		color: #f5f5f5;
      		background: @base01;
      		border-radius: 0px 0px 0px 40px;
      		padding: 10px 10px 15px 25px;
      		margin-left: 7px;
      		font-weight: bold;
      		font-size: 16px;
      }


      #window{
      		/*background: #25253a; */
      		padding-left: 15px;
      		padding-right: 15px;
      		border-radius: 16px;
      		margin-top: 5px;
      		margin-bottom: 5px;
      		font-weight: normal;
      		font-style: normal;
      		opacity: 0.1;
      }
    '';
  };
}
