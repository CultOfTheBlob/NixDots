{config, ...}: {
  sops = {
    defaultSopsFile = ../../secrets/ssh_github_key;
    defaultSopsFormat = "json";

    age = {
      keyFile = "${config.home.homeDirectory}/.config/sops/age/keys.txt";
      sshKeyPaths = [];
    };

    secrets.ssh_github_key = {
      path = "${config.home.homeDirectory}/.ssh/id_github";
      key = "data";
    };
  };
}
