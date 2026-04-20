{
  programs.direnv = {
    enable = true;

    enableNushellIntegration = true;
    silent = true;

    nix-direnv = {
      enable = true;
    };
  };
}
