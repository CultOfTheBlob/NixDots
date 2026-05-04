{
  programs.noctalia-shell.settings.controlCenter = {
    position = "close_to_bar_button";
    diskPath = "/";
    shortcuts = {
      left = [
        {
          id = "Network";
        }
        {
          id = "Bluetooth";
        }
        {
          id = "WallpaperSelector";
        }
        {
          id = "NoctaliaPerformance";
        }
      ];
      right = [
        {
          id = "Notifications";
        }
        {
          id = "PowerProfile";
        }
        {
          id = "KeepAwake";
        }
        {
          id = "NightLight";
        }
      ];
    };
    cards = [
      {
        enabled = true;
        id = "profile-card";
      }
      {
        enabled = true;
        id = "shortcuts-card";
      }
      {
        enabled = true;
        id = "audio-card";
      }
      {
        enabled = false;
        id = "brightness-card";
      }
      {
        enabled = false;
        id = "weather-card";
      }
      {
        enabled = false;
        id = "media-sysmon-card";
      }
    ];
  };
}
