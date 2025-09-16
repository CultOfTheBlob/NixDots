{
  pkgs,
  host,
  ...
}: {
  imports = [
    ./modules
  ];

  environment.systemPackages = [
    pkgs.home-manager

    pkgs.libsForQt5.qt5.qtgraphicaleffects
  ];

  networking.hostName = host;

  system = {
    stateVersion = "24.11";

    nixos = {
      label = "Main";
    };
  };

  nixpkgs.config = {
    allowUnfree = true;
  };
}
