{
  pkgs,
  lib,
  user,
  ...
}: {
  programs.niri = {
    enable = true;

    package = pkgs.niri;

    settings = {
      hotkey-overlay.skip-at-startup = true;
      prefer-no-csd = true;

      input = {
        focus-follows-mouse.enable = false;
        warp-mouse-to-focus.enable = true;
        workspace-auto-back-and-forth = true;

        keyboard = {
          xkb.layout = "us";

          repeat-delay = 300;
          repeat-rate = 50;
        };
      };

      cursor = {
        hide-after-inactive-ms = 10000;
        hide-when-typing = true;
      };

      xwayland-satellite = {
        enable = true;

        path = lib.getExe pkgs.xwayland-satellite;
      };

      gestures = {
        hot-corners.enable = false;
      };
    };
  };

  home.file.".config/niri/main.kdl".text =
    /*
    kdl
    */
    ''
      include "/home/${user}/.config/niri/config.kdl"

      window-rule {
        background-effect {
          blur true
          noise 0.05
          saturation 1.0
        }

        border {
          on
        }

        draw-border-with-background false
      }
    '';
}
