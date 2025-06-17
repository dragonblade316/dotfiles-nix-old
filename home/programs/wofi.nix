{pkgs, ...}: {
  programs.wofi = {
    enable = true;
    settings = {
      term = "${pkgs.kitty}/bin/kitty";
      show = "run";
      allow_images = true;
    };

    style = ''
      #window {
      	border-radius: 10px;
      }
    '';
  };
}
