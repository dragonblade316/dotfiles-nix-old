{pkgs, ...}: {
  #there is no home manager module for intellij but ima still put this here
  home.packages = with pkgs; [
    jetbrains.idea-community
  ];
}
