{config, ...}: {
  sops = {
    defaultSopsFile = ../../secrets/ssh_github_key;
    defaultSopsFormat = "binary";

    age = {
      sshKeyPaths = [];
      keyFile = null;
    };

    gnupg = {
      home = "${config.home.homeDirectory}/.gnupg";
      sshKeyPaths = [];
    };

    secrets.ssh_github_key = {};
  };
}
