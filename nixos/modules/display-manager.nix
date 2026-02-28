{
  pkgs,
  lib,
  config,
  inputs,
  ...
}: {
  environment.systemPackages = with pkgs; [
    kdePackages.qtmultimedia
    graphite-cursors
    dejavu_fonts
  ];

  environment.etc = {
    "xdg/weston/weston.ini".text =
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

    "sddm/wallpaper.png".source = ./assets/loginWallpaper.png;
  };

  imports = [inputs.silentSDDM.nixosModules.default];
  programs.silentSDDM = {
    enable = true;
    theme = "default-right";

    backgrounds = {
      nord = ./assets/loginWallpaper.png;
    };

    settings = {
      "LoginScreen" = {
        background = "loginWallpaper.png";
      };

      "LockScreen" = {
        background = "loginWallpaper.png";
      };

      "LockScreen.Clock" = {
        color = "#${config.colors.base07}";
      };

      "LockScreen.Date" = {
        color = "#${config.colors.base07}";
      };

      "LockScreen.Message" = {
        color = "#${config.colors.base07}";
      };
      "LoginScreen.LoginArea.Avatar" = {
        active-border-color = "#${config.colors.base07}";
        inactive-border-color = "#${config.colors.base07}";
      };

      "LoginScreen.LoginArea.Username" = {
        color = "#${config.colors.base07}";
      };

      "LoginScreen.LoginArea.PasswordInput" = {
        content-color = "#${config.colors.base07}";
        background-color = "#${config.colors.base0D}";
        border-color = "#${config.colors.base07}";
      };

      "LoginScreen.LoginArea.LoginButton" = {
        background-color = "#${config.colors.base0D}";
        active-background-color = "#${config.colors.base0D}";
        content-color = "#${config.colors.base07}";
        active-content-color = "#${config.colors.base07}";
        border-color = "#${config.colors.base07}";
      };

      "LoginScreen.LoginArea.Spinner" = {
        color = "#${config.colors.base07}";
      };

      "LoginScreen.LoginArea.WarningMessage" = {
        normal-color = "#${config.colors.base07}";
        warning-color = "#${config.colors.base07}";
        error-color = "#${config.colors.base08}";
      };

      "LoginScreen.MenuArea.Popups" = {
        background-color = "#${config.colors.base0D}";
        active-option-background-color = "#${config.colors.base0D}";
        content-color = "#${config.colors.base07}";
        active-content-color = "#${config.colors.base07}";
        border-color = "#${config.colors.base07}";
      };

      "LoginScreen.MenuArea.Session" = {
        background-color = "#${config.colors.base0D}";
        content-color = "#${config.colors.base07}";
        active-content-color = "#${config.colors.base07}";
      };

      "LoginScreen.MenuArea.Layout" = {
        background-color = "#${config.colors.base0D}";
        content-color = "#${config.colors.base07}";
        active-content-color = "#${config.colors.base07}";
      };

      "LoginScreen.MenuArea.Keyboard" = {
        background-color = "#${config.colors.base0D}";
        content-color = "#${config.colors.base07}";
        active-content-color = "#${config.colors.base07}";
      };

      "LoginScreen.MenuArea.Power" = {
        background-color = "#${config.colors.base0D}";
        content-color = "#${config.colors.base07}";
        active-content-color = "#${config.colors.base07}";
      };

      "LoginScreen.VirtualKeyboard" = {
        background-color = "#${config.colors.base0D}";
        key-content-color = "#${config.colors.base07}";
        key-color = "#${config.colors.base07}";
        key-active-background-color = "#${config.colors.base0D}";
        key-active-opacity = 0.30;
        selection-background-color = "#${config.colors.base0D}";
      };

      "Tooltips" = {
        content-color = "#${config.colors.base07}";
        background-color = "#${config.colors.base0D}";
      };
    };
  };

  services.displayManager = {
    defaultSession = "hyprland-uwsm";

    sddm = {
      enable = true;

      package = pkgs.kdePackages.sddm;

      autoNumlock = true;

      settings = {
        General = {
          Numlock = "on";
        };

        Users = {
          RememberLastSession = false;
        };

        Theme = {
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
