{
  wayland.windowManager.hyprland.settings = {
    windowrule = [
      "noblur, title:^(gamescope)$"
      "fullscreen, title:^(gamescope)$"
      "workspace 6 silent, title:^(gamescope)$"

      "move 72% 7%,title:^(Picture-in-Picture)$ "

      "opacity 1.5 override, class:^(org.kde.dolphin)$"

      "idleinhibit fullscreen, class:^(*)$"
      "idleinhibit fullscreen, title:^(*)$"
      "idleinhibit fullscreen, fullscreen:1"

      "tile, title:^(Godot)$"

      "float, class:^(org.kde.polkit-kde-authentication-agent-1)$"
      "float, class:(xdg-desktop-portal-gtk)"
      "float, class:^(pavucontrol|org.pulseaudio.pavucontrol|com.saivert.pwvucontrol)$"
      "float, class:^(nm-applet|nm-connection-editor|blueman-manager)$"
      "float, class:^([Ss]team)$,title:^((?![Ss]team).*|[Ss]team [Ss]ettings)$"
      "float, title:^(Picture-in-Picture)$"

      "workspace 1, title:^(Godot)$"
      "workspace 3, class:^(org.kde.dolphin)$"
      "workspace 4, class:^([Ff]loorp)$"
      "workspace 7, class:^(com.obsproject.Studio)$"
      "workspace 8, class:^([Ss]team)$"
      "workspace 9, class:^([Dd]iscord)$"
      "workspace 10, class:^([Ss]potify)$"

      "workspace 6 silent, class:^(virt-manager)$"
      "workspace 9 silent, class:^([Aa]udacious)$"

      "size 70% 70%, class:^(xdg-desktop-portal-gtk)$"

      "keepaspectratio, title:^(Picture-in-Picture)$"
    ];

    layerrule = [
      "noanim, selection"
    ];
  };
}
