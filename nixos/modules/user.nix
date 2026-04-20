{pkgs, ...}: {
  users = {
    groups = {
      plugdev = {};
    };

    defaultUserShell = pkgs.nushell;
    users.blob = {
      isNormalUser = true;
      description = "Cult Of The Blob";
      extraGroups = ["networkmanager" "wheel" "storage" "plugdev"];
    };
  };
}
