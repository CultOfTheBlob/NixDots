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
      opacity = 0.95;
    }
    {
      matches = [{is-focused = false;}];
      opacity = 0.9;
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
      matches = [{app-id = "org.freedesktop.impl.portal.desktop.kde";}];
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
      matches = [{app-id = "zen-beta";}];
      open-on-output = "DP-1";
    }
    {
      matches = [{app-id = "steam";}];
      open-on-output = "DP-1";
    }
    {
      matches = [{app-id = "vesktop";}];
      open-on-output = "DP-2";
    }
    {
      matches = [{app-id = "element";}];
      open-on-output = "DP-2";
    }
    {
      matches = [{app-id = "spotify";}];
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
      matches = [{app-id = "org.godotengine.*";}];
      open-on-output = "DP-1";
    }

    {
      matches = [{app-id = "console";}];
      open-on-output = "DP-1";
    }
    {
      matches = [{app-id = "editor";}];
      open-on-output = "DP-2";
    }
  ];
}
