{pkgs, ...}: {
  programs.zsh.enable = true;

  users = {
    defaultUserShell = pkgs.zsh;
    users.blob = {
      isNormalUser = true;
      description = "Cult Of The Blob";
      extraGroups = ["networkmanager" "wheel" "storage"];
    };
  };
}
