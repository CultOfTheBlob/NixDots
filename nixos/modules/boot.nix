{pkgs, ...}: {
  boot = {
    loader = {
      timeout = 4;

      grub = {
        enable = true;

        device = "nodev";
        efiSupport = true;
      };

      efi = {
        canTouchEfiVariables = true;
      };

      systemd-boot = {
        enable = false;
      };
    };

    plymouth = {
      enable = true;

      theme = "breeze";
      logo = "${pkgs.nixos-icons}/share/icons/hicolor/128x128/apps/nix-snowflake.png";
    };

    kernelPackages = pkgs.linuxPackages_latest;
  };
}
