{
  pkgs,
  user,
  ...
}: {
  wayland.windowManager.hyprland.settings = {
    bind = [
      #GENERAL
      "$mainMod, Q, killactive"
      "$mainMod ALT, Q, exec, hyprctl kill"

      "$mainMod, F, fullscreen"
      "$mainMod SHIFT, F, togglefloating"
      "$mainMod ALT, F, exec, hyprctl dispatch workspaceopt allfloat"

      "$mainMod ALT, G, exec, gameMode"

      #APPS
      "$mainMod, Return, exec, $term"
      "$mainMod, B, exec, $browser"
      "$mainMod, D, exec, dolphin"

      #LAUNCHER
      "$mainMod, A, exec, pkill rofi || rofi -show drun -show-icons"
      "$mainMod ALT, W, exec, pkill rofi || rofi -show window"
      "$mainMod, W, exec, pkill walker || ${pkgs.networkmanager_dmenu}/bin/networkmanager_dmenu"

      #SERVICES
      "$mainMod, N, exec, swaync-client -t -sw"
      "$mainMod, P, exec, pkill wlogout || wlogout --buttons-per-row 6 --primary-monitor DP-1"

      "$mainMod ALT, Return, exec, pypr toggle term"
      "$mainMod ALT, B, exec, pypr toggle blue"
      "$mainMod ALT, K, exec, pypr toggle proc"

      "$mainMod ALT, P, exec, ${pkgs.hyprpicker}/bin/hyprpicker -a"

      "$mainMod, S, exec, ${pkgs.hyprshot}/bin/hyprshot -m window -o /home/${user}/Pictures/Screenshots/"
      "$mainMod ALT, S, exec, ${pkgs.hyprshot}/bin/hyprshot -m region -o /home/${user}/Pictures/Screenshots/"

      #WINDOW MANAGEMENT
      "$mainMod CTRL, H, resizeactive,-50 0"
      "$mainMod CTRL, L, resizeactive,50 0"
      "$mainMod CTRL, K, resizeactive,0 -50"
      "$mainMod CTRL, J, resizeactive,0 50"

      "$mainMod ALT, H, movewindow, l"
      "$mainMod ALT, L, movewindow, r"
      "$mainMod ALT, K, movewindow, u"
      "$mainMod ALT, J, movewindow, d"

      "$mainMod, H, movefocus, l"
      "$mainMod, L, movefocus, r"
      "$mainMod, K, movefocus, u"
      "$mainMod, J, movefocus, d"

      "$mainMod, code:10, workspace, 1"
      "$mainMod, code:11, workspace, 2"
      "$mainMod, code:12, workspace, 3"
      "$mainMod, code:13, workspace, 4"
      "$mainMod, code:14, workspace, 5"
      "$mainMod, code:15, workspace, 6"
      "$mainMod, code:16, workspace, 7"
      "$mainMod, code:17, workspace, 8"
      "$mainMod, code:18, workspace, 9"
      "$mainMod, code:19, workspace, 10"

      "$mainMod SHIFT, code:10, movetoworkspace, 1, follow"
      "$mainMod SHIFT, code:11, movetoworkspace, 2, follow"
      "$mainMod SHIFT, code:12, movetoworkspace, 3, follow"
      "$mainMod SHIFT, code:13, movetoworkspace, 4, follow"
      "$mainMod SHIFT, code:14, movetoworkspace, 5, follow"
      "$mainMod SHIFT, code:15, movetoworkspace, 6, follow"
      "$mainMod SHIFT, code:16, movetoworkspace, 7, follow"
      "$mainMod SHIFT, code:17, movetoworkspace, 8, follow"
      "$mainMod SHIFT, code:18, movetoworkspace, 9, follow"
      "$mainMod SHIFT, code:19, movetoworkspace, 10, follow"
      "$mainMod SHIFT, bracketleft, movetoworkspace, -1"
      "$mainMod SHIFT, bracketright, movetoworkspace, +1"

      "$mainMod ALT, code:10, movetoworkspace, 1"
      "$mainMod ALT, code:11, movetoworkspace, 2"
      "$mainMod ALT, code:12, movetoworkspace, 3"
      "$mainMod ALT, code:13, movetoworkspace, 4"
      "$mainMod ALT, code:14, movetoworkspace, 5"
      "$mainMod ALT, code:15, movetoworkspace, 6"
      "$mainMod ALT, code:16, movetoworkspace, 7"
      "$mainMod ALT, code:17, movetoworkspace, 8"
      "$mainMod ALT, code:18, movetoworkspace, 9"
      "$mainMod ALT, code:19, movetoworkspace, 10"
      "$mainMod ALT, bracketleft, movetoworkspace, -1"
      "$mainMod ALT, bracketright, movetoworkspace, +1"

      "ALT, tab, cyclenext"
      "ALT, tab, bringactivetotop"

      "$mainMod, V, togglesplit"
    ];

    bindm = [
      #WINDOW MANAGEMENT
      "$mainMod, mouse:272, movewindow"
      "$mainMod, mouse:273, resizewindow"
    ];

    bindl = [
      #HOTKEYS
      ", xf86audioraisevolume, exec, pactl -- set-sink-volume 0 +5%"
      ", xf86audiolowervolume, exec, pactl -- set-sink-volume 0 -5%"
      ", print, exec, pactl -- set-source-mute 0 toggle"
      ", xf86audiomute, exec, pactl -- set-sink-mute 0 toggle"

      "$mainMod, C, exec, mediaControl --pause"

      ", xf86Sleep, exec, systemctl suspend"
    ];
  };
}
