{
  inputs,
  system,
  pkgs,
  ...
}:
with inputs; let
  sharedModules = [
    ../.
    ../shell
    ../editors/nixvim
    inputs.stylix.homeManagerModules.stylix
    inputs.nixvim.homeManagerModules.nixvim
    inputs.nix-index-database.hmModules.nix-index
  ];

  mkHome = {conf}: (
    hm.lib.homeManagerConfiguration {
      inherit pkgs;
      modules = [conf] ++ sharedModules; # ++ imports;
    }
  );
in {
  "dragonblade316@dragonblade316" = mkHome {conf = ./main;};
  "dragonblade316@framework" = mkHome {conf = ./framework;};
  "dragonblade316@halcyon" = mkHome {conf = ./halcyon;};
  "dragonblade316@thomeserver" = mkHome {conf = ./homeserver;};
  "dragonblade316@wsl" = mkHome {conf = ./wsl;};
}
