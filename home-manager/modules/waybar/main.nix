{
  programs.waybar = {
    enable = true;

    settings = {
      mainBar = {
        layer = "top";
        exclusive = true;
        passthrough = false;
        position = "top";
        height = 30;
        spacing = 3;
        fixed-center = true;
        ipc = true;
        margin-top = 3;
        margin-left = 8;
        margin-right = 8;

        modules-left = [
          "custom/menu"
          "hyprland/workspaces"
          "custom/separator#dot-line"
          "group/mobo_drawer"
          "custom/separator#dot-line"
          "mpris"
          "cava"
        ];
        modules-center = [
          "custom/separator#dot-line"
          "clock"
          "custom/separator#dot-line"
        ];
        modules-right = [
          "network#speed"
          "custom/separator#dot-line"
          "tray"
          "custom/separator#dot-line"
          "pulseaudio"
          "pulseaudio#microphone"
          "custom/separator#dot-line"
          "custom/power"
        ];
      };
    };
  };
}
