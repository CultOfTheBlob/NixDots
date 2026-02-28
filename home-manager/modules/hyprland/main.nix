{
  lib,
  config,
  ...
}: {
  wayland.windowManager.hyprland = {
    enable = true;

    settings = {
      general = {
        border_size = "2";
        gaps_in = "3";
        gaps_out = "4";

        "col.active_border" = lib.mkForce "rgba(${config.colors.base0D}ee) rgba(${config.colors.base07}ee) 45deg";

        resize_on_border = "true";

        layout = "dwindle";
      };

      dwindle = {
        preserve_split = true;
      };

      misc = {
        disable_splash_rendering = "true";
        disable_xdg_env_checks = "true";
        vfr = "true";
        mouse_move_enables_dpms = "true";
        enable_swallow = "true";
        swallow_regex = "^(kitty)$";
        focus_on_activate = "false";
        initial_workspace_tracking = "0";
        middle_click_paste = "false";
      };

      binds = {
        workspace_back_and_forth = "true";
        allow_workspace_cycles = "true";
        pass_mouse_when_bound = "false";
      };

      render = {
        direct_scanout = "false";
      };

      cursor = {
        no_hardware_cursors = "false";
        enable_hyprcursor = "true";
        warp_on_change_workspace = "true";
        no_warps = "true";
      };

      ecosystem = {
        no_update_news = "true";
        no_donation_nag = "true";
      };
    };
  };
}
