{pkgs, ...}: {
  nixpkgs.config.allowUnfree = true;

  home.packages = with pkgs; [
    # Command line apps
    neovim
    fastfetch
    dust
    axel
    caligula
    git
    nix-output-monitor

    # Command line utils
    libnotify
    wl-clipboard
    rich-cli
    trash-cli
    mediainfo
    ouch

    # Apps
    godot-mono
    blender
    kdePackages.dolphin
    kdePackages.dolphin-plugins
    kdePackages.kompare
    prismlauncher
    file-roller
    obs-studio
    krita
    inkscape-with-extensions
    gimp-with-plugins
    xfce.ristretto
    obsidian
    gparted
    qalculate-gtk
    kdePackages.qt6ct
    kdePackages.qtstyleplugin-kvantum

    # Utils
    networkmanagerapplet
    pulseaudio
    linuxHeaders
    xfce.tumbler
    libsForQt5.qt5ct
    libsForQt5.qtstyleplugin-kvantum
    kdePackages.kdf
    kdePackages.kio
    kdePackages.kio-fuse
    kdePackages.kio-extras
    kdePackages.kio-admin
    kdePackages.qtwayland
    kdePackages.plasma-integration
    kdePackages.kdegraphics-thumbnailers
    kdePackages.breeze-icons
    kdePackages.qtsvg
    kdePackages.kservice
    kdePackages.kmenuedit
    kdePackages.kde-cli-tools
    kdePackages.plasma-workspace
  ];
}
