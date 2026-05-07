{config, ...}: {
  programs.ssh = {
    enable = true;

    enableDefaultConfig = false;

    matchBlocks = {
      "*" = {
        serverAliveInterval = 60;
        serverAliveCountMax = 3;
      };

      "github.com" = {
        hostname = "github.com";
        user = "git";
        identityFile = config.sops.secrets.ssh_github_key.path;
        extraOptions = {
          IdentitiesOnly = "yes";
        };
      };
    };
  };
}
