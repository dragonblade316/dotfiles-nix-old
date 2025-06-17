{pkgs, ...}: {
  home.packages = with pkgs; [
    (pkgs.discord.override {
      # remove any overrides that you don't want
      withOpenASAR = true;
      withVencord = false;
    })
    fractal
  ];

  services.easyeffects.enable = true;
}
