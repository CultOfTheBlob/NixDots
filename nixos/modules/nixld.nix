{pkgs, ...}: {
  programs.nix-ld = {
    enable = true;

    libraries = with pkgs; [
      fontconfig
      alsa-lib
      libGL
      vulkan-loader
      libx11
      libXcursor
      libXext
      libXfixes
      libXi
      libXinerama
      libxkbcommon
      libXrandr
      libXrender
      dbus
      wayland
      libdecor
    ];
  };
}
