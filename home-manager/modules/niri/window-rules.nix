{
  programs.niri.settings.window-rules = [
    {
      matches = [];

      geometry-corner-radius = {
        top-left = 10.0;
        top-right = 10.0;
        bottom-left = 10.0;
        bottom-right = 10.0;
      };

      clip-to-geometry = true;
    }
    {
      matches = [];
      opacity = 0.9;
    }
    {
      matches = [{is-focused = false;}];
      opacity = 0.85;
    }

    {
      matches = [{app-id = "org.kde.polkit-kde-authentication-agent-1";}];
      open-floating = true;
    }
    {
      matches = [{app-id = "xdg-desktop-portal-gtk";}];
      open-floating = true;
      default-window-height = {proportion = 0.7;};
      default-column-width = {proportion = 0.7;};
    }
    {
      matches = [{app-id = "pavucontrol|org.pulseaudio.pavucontrol|com.saivert.pwvucontrol";}];
      open-floating = true;
    }
    {
      matches = [{app-id = "nm-applet|nm-connection-editor|blueman-manager";}];
      open-floating = true;
    }
    {
      matches = [{title = "Picture-in-Picture";}];
      open-floating = true;
    }

    {
      matches = [{app-id = "[Ff]loorp";}];
      open-on-output = "DP-1";
    }
    {
      matches = [{app-id = "org.kde.dolphin";}];
      open-on-output = "DP-1";
    }
    {
      matches = [{app-id = "[Ss]team";}];
      open-on-output = "DP-2";
    }
    {
      matches = [{app-id = "vesktop";}];
      open-on-output = "DP-2";
    }
    {
      matches = [{app-id = "[Ee]lement";}];
      open-on-output = "DP-2";
    }
    {
      matches = [{app-id = "[Ss]potify";}];
      open-on-output = "DP-2";
    }
    {
      matches = [{app-id = "com.obsproject.Studio";}];
      open-on-output = "DP-2";
    }
    {
      matches = [{app-id = "virt-manager";}];
      open-on-output = "DP-2";
    }
    {
      matches = [{title = "Godot";}];
      open-on-output = "DP-1";
    }

    {
      matches = [{app-id = "[Ss]team";}];
      excludes = [{title = "[Ss]team";}];
      open-floating = true;
    }
  ];
}
