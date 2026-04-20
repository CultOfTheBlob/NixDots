{
  wayland.windowManager.hyprland.settings = {
    windowrule = [
      "match:title (steam_app*)$, no_blur on"
      "match:title ^(steam_app.*)$, border_size 0"

      "match:title ^(Picture-in-Picture)$, move 200 400"
      "match:title ^(Picture-in-Picture)$, float on"
      "match:title ^(Picture-in-Picture)$, keep_aspect_ratio on"

      "match:class ^(org.kde.dolphin)$, opacity 1.5 1.5 override"

      "match:class ^(.*)$, idle_inhibit fullscreen"
      "match:title ^(.*)$, idle_inhibit fullscreen"

      "match:title ^(Godot)$, tile on"

      "match:class (blender)$, size 1200 800"
      "match:class (blender)$, move 100 100"

      "match:class ^(org.kde.polkit-kde-authentication-agent-1)$, float on"
      "match:class ^(xdg-desktop-portal-gtk)$, float on"
      "match:class ^(pavucontrol|org.pulseaudio.pavucontrol|com.saivert.pwvucontrol)$, float on"
      "match:class ^(nm-applet|nm-connection-editor|blueman-manager)$, float on"
      "match:class ^([Ss]team)$ title:^((?![Ss]team).*|[Ss]team [Ss]ettings)$, float on"
      "match:title ^(Picture-in-Picture)$, float on"

      "match:class ^(editor)$, workspace 2"
      "match:class ^(console)$, workspace 1"
      "match:title ^(Godot)$, workspace 1"
      "match:class ^(org.kde.dolphin)$, workspace 3"
      "match:class ^([Ff]loorp)$, workspace 4"
      "match:class ^(com.obsproject.Studio)$, workspace 7"
      "match:class ^([Ss]team)$, workspace 8"
      "match:class ^([Dd]iscord)$, workspace 9"
      "match:class ^([Ee]lement)$, workspace 9"
      "match:class ^([Ss]potify)$, workspace 10"

      "match:class ^(virt-manager)$, workspace 6 silent"
      "match:class ^([Aa]udacious)$, workspace 9 silent"

      "match:class ^(xdg-desktop-portal-gtk)$, size 70% 70%"
    ];

    layerrule = [
      "match:namespace selection, no_anim on"
    ];
  };
}
