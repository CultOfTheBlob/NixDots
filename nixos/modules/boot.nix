{
  pkgs,
  config,
  ...
}: {
  boot = {
    loader = {
      timeout = 4;

      limine = {
        enable = true;

        efiSupport = true;
        maxGenerations = 32;

        style = {
          wallpapers = [./assets/bootWallpaper.png];
          wallpaperStyle = "centered";

          interface = {
            resolution = "3440x1440";
            brandingColor = 4;
            branding = " ";
          };

          graphicalTerminal = {
            marginGradient = 24;
            margin = 8;

            palette = with config.colors; "${base01};${base0F};${base0B};${base09};${base0D};${base0E};${base0A};${base05}";
            background = "50${config.colors.base00}";
            foreground = config.colors.base05;

            brightPalette = with config.colors; "${base01};${base0F};${base0B};${base09};${base0D};${base0E};${base0A};${base05}";
            brightBackground = "50${config.colors.base00}";
            brightForeground = config.colors.base05;
          };
        };

        extraConfig = ''
          timeout: 4
          remember_last_entry: yes
          interface_help_hidden: yes
        '';
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
