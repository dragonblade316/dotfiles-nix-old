{pkgs, ...}: {
  home.packages = with pkgs; [
    rstreamdeck
  ];
}
