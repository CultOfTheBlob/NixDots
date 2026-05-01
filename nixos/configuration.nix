{
  pkgs,
  host,
  ...
}: {
  environment.systemPackages = with pkgs; [
    home-manager
  ];

  fonts.packages = with pkgs; [
    nerd-fonts.fira-code
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
