{
  wayland.windowManager.hyprland.settings = {
    decoration = {
      rounding = "5";

      active_opacity = "0.95";
      inactive_opacity = "0.9";
      fullscreen_opacity = "1.0";

      dim_inactive = "true";
      dim_strength = "0.1";
      dim_special = "0.8";

      shadow = {
        enabled = "true";

        range = "2";
        render_power = "1";
      };

      blur = {
        enabled = "true";

        size = "6";
        passes = "2";
        ignore_opacity = "true";
        new_optimizations = "true";
        special = "true";
      };
    };

    animations = {
      enabled = true;

      bezier = [
        "wind, 0.05, 0.9, 0.1, 1.05"
        "winIn, 0.1, 1.1, 0.1, 1.1"
        "winOut, 0.3, -0.3, 0, 1"
        "liner, 1, 1, 1, 1"
      ];

      animation = [
        "windows, 1, 6, wind, slide"
        "windowsIn, 1, 6, winIn, slide"
        "windowsOut, 1, 5, winOut, slide"
        "windowsMove, 1, 5, wind, slide"
        "border, 1, 1, liner"
        "borderangle, 1, 30, liner, loop"
        "fade, 1, 10, default"
        "layersIn, 1, 3, winIn, slide top"
        "layersOut, 1, 1.6, winOut"
        "fadeLayersIn, 1, 2, winIn"
        "fadeLayersOut, 1, 4.5, winOut"
        "workspaces, 1, 5, wind"
      ];
    };
  };
}
