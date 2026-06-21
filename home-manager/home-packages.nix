{
  pkgs,
  inputs,
  system,
  ...
}: let
  drift = pkgs.buildGoModule {
    pname = "drift";
    version = "0.1.0";
    src = pkgs.fetchFromGitHub {
      owner = "phlx0";
      repo = "drift";
      rev = "main";
      sha256 = "sha256-hkbgxwUgKB/mWQRnn/BJVHV+JyY+rPRTtTl9VpHm4V0=";
    };
    vendorHash = "sha256-FsNa9qp2MnPk1onv/O13mFi+82yP7D4LdILZsNzHs+4=";
  };
in {
  nixpkgs.config = {
    allowUnfree = true;
  };

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
    speedtest-rs
    drift

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
    neovim-remote

    # Apps
    godot-mono
    blender
    kdePackages.dolphin
    kdePackages.dolphin-plugins
    kdePackages.kompare
    kdePackages.qt6ct
    kdePackages.qtstyleplugin-kvantum
    kdePackages.okular
    file-roller
    obs-studio
    inkscape-with-extensions
    gimp-with-plugins
    ristretto
    obsidian
    gparted
    qalculate-gtk
    cavalier
    keymapp

    # Utils
    inputs.quickshell.packages.${system}.default
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
