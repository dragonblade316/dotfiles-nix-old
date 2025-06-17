{pkgs, ...}: {
  environment.systemPackages = [pkgs.distrobox];
  virtualisation.containers.enable = true;
  virtualisation.podman.enable = true;
}
