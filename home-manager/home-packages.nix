{pkgs, ...}: {
  nixpkgs.config.allowUnfree = true;

  home.packages = with pkgs; [
    # Command line apps
    neovim
    yazi
    fastfetch
    dust

    # Command line utils
    git
    nix-output-monitor
    libnotify
    wl-clipboard
    axel
    caligula

    # Apps
    godot-mono
    blender
    nemo-with-extensions
    vlc
    prismlauncher
    file-roller
    obs-studio
    inkscape-with-extensions
    openrgb-with-all-plugins
    xfce.ristretto
    obsidian
    gparted

    # Utils
    networkmanagerapplet
    pulseaudio
    linuxHeaders
    xfce.tumbler
  ];
}
