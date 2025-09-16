{pkgs, ...}: {
  boot = {
    loader = {
      timeout = -1;

      grub = {
        enable = true;

        device = "nodev";
        efiSupport = true;
        useOSProber = true;
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
