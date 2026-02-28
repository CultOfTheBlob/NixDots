{pkgs, ...}: {
  programs.zsh.enable = true;

  users = {
    groups = {
      plugdev = {};
    };

    defaultUserShell = pkgs.zsh;
    users.blob = {
      isNormalUser = true;
      description = "Cult Of The Blob";
      extraGroups = ["networkmanager" "wheel" "storage" "plugdev"];
    };
  };
}
