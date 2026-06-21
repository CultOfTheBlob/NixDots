{pkgs, ...}: {
  users = {
    groups = {
      plugdev = {};
    };

    defaultUserShell = pkgs.nushell;
    users.blob = {
      isNormalUser = true;
      description = "Thomas";
      extraGroups = ["networkmanager" "wheel" "storage" "plugdev"];
    };
  };
}
