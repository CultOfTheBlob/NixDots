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
    cava

    # Command line utils
    linuxHeaders
    libnotify
    wl-clipboard
    rich-cli
    trash-cli
    ouch
    duckdb
    mediainfo
    inetutils

    # Apps
    godot-mono
    blender
    kdePackages.dolphin
    kdePackages.dolphin-plugins
    kdePackages.kompare
    kdePackages.qt6ct
    kdePackages.qtstyleplugin-kvantum
    file-roller
    obs-studio
    inkscape-with-extensions
    gimp-with-plugins
    ristretto
    obsidian
    gparted
    qalculate-gtk
    cavalier

    # Utils
    networkmanagerapplet
    pulseaudio
    tumbler
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
