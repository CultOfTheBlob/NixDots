{pkgs, ...}: {
  programs.nix-ld = {
    enable = true;

    libraries = with pkgs; [
      fontconfig
      alsa-lib
      libGL
      vulkan-loader
      libx11
      xorg.libXcursor
      xorg.libXext
      xorg.libXfixes
      xorg.libXi
      xorg.libXinerama
      libxkbcommon
      xorg.libXrandr
      xorg.libXrender
      dbus
      wayland
      libdecor
    ];
  };
}
