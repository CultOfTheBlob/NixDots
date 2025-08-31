{pkgs, ...}: {
  nixpkgs.config.allowUnfree = true;

  home.packages = with pkgs; [
    # Command line apps
    neovim
    yazi
    fastfetch

    # Command line utils
    git
    nix-output-monitor
    libnotify
    wl-clipboard

    # Apps
    godot-mono
    godot
    blender
    kdePackages.dolphin
    xfce.thunar
    krusader
    vlc
    prismlauncher
    file-roller
    obs-studio
    inkscape-with-extensions
    openrgb-with-all-plugins

    # Utils
    networkmanagerapplet
    pulseaudio
    linuxHeaders
  ];
}
