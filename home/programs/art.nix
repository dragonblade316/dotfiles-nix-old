{pkgs, ...}: {
  home.packages = with pkgs; [
    gimp
    krita

    obs-studio
    audacity
    easyeffects
    noisetorch
    # davinci-resolve
    cura
    #		(blender.override {
    #     cudaSupport = true;
    #  })

    blender-hip
    natron

    freecad
    godot_4
    mixxx
  ];
}
