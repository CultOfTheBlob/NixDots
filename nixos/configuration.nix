{
  pkgs,
  host,
  ...
}: {
  imports = [
    ./modules
    ../home-manager/colors
  ];

  environment.systemPackages = with pkgs; [
    home-manager
  ];

  networking.hostName = host;

  system = {
    stateVersion = "24.11";

    nixos = {
      label = ":-:";
    };
  };

  nixpkgs.config = {
    allowUnfree = true;
  };
}
