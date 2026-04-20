{
  pkgs,
  host,
  ...
}: {
  environment.systemPackages = with pkgs; [
    home-manager

    nerd-fonts.jetbrains-mono
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
