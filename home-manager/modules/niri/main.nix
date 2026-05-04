{
  pkgs,
  lib,
  ...
}: {
  programs.niri = {
    enable = true;

    settings = {
      hotkey-overlay.skip-at-startup = true;
      prefer-no-csd = true;

      input = {
        focus-follows-mouse.enable = false;
        warp-mouse-to-focus.enable = true;
        workspace-auto-back-and-forth = true;

        keyboard = {
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
    };
  };
}
