{pkgs, ...}: {
  home.packages = with pkgs; [
    zip
    unzip
    unrar

    btop

    ripgrep
    fzf

    imagemagick

    neofetch

    #busybox is already on the system but its version of wget does not support a spesific option that lutris needs
    wget
  ];

  programs.zoxide = {
    enable = true;
    enableFishIntegration = true;
    enableNushellIntegration = true;
    options = ["--cmd cd"];
  };
}
