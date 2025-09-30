{
  pkgs,
  lib,
  ...
}: let
  sddm-astronaut-theme =
    pkgs.sddm-astronaut.override
    {
      embeddedTheme = "astronaut";
    };
in {
  environment.systemPackages = with pkgs; [
    kdePackages.qtmultimedia
    sddm-astronaut-theme
    graphite-cursors
    dejavu_fonts
  ];

  environment.etc."xdg/weston/weston.ini".text =
    lib.generators.toINI {} {
      keyboard = {
        keymap_layout = "us";
        keymap_model = "pc104";
        keymap_options = "terminate:ctrl_alt_bksp";
        keymap_variant = "";
      };

      libinputs = {
        enable-tap = true;
        left-handed = false;
      };
    }
    + lib.generators.toINI {} {
      output = {
        name = "DP-1";
        mode = "3440x1440";
      };
    }
    + lib.generators.toINI {} {
      output = {
        name = "DP-2";
        mode = "off";
      };
    };

  services.displayManager = {
    defaultSession = "hyprland-uwsm";

    sddm = {
      enable = true;

      package = pkgs.kdePackages.sddm;

      extraPackages = [
        sddm-astronaut-theme
      ];

      autoNumlock = true;

      theme = "sddm-astronaut-theme";
      settings = {
        General = {
          Numlock = "on";
        };

        Users = {
          RememberLastSession = false;
        };

        Theme = {
          Current = "sddm-astronaut-theme";
          CursorTheme = "graphite-dark-nord";
          Font = "DejaVu Sans";
        };
      };

      wayland = {
        enable = true;

        compositorCommand = "${pkgs.weston}/bin/weston --shell=kiosk -c /etc/xdg/weston/weston.ini";
      };
    };
  };
}
