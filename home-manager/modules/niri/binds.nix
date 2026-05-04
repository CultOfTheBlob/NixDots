{pkgs, ...}: let
  shell = "noctalia-shell ipc call";
  term = "kitty";
  browser = "zen-beta";
  files = "dolphin";
in {
  programs.niri.settings.binds = {
    "Mod+Q".action.close-window = {};
    "Mod+Alt+Q".action.spawn = ["sh" "-c" "niri msg action close-window --at-cursor"];
    "Mod+F".action.fullscreen-window = {};
    "Mod+Shift+F".action.toggle-window-floating = {};

    "Mod+Return".action.spawn = [term];
    "Mod+B".action.spawn = [browser];
    "Mod+D".action.spawn = [files];

    "Mod+A".action.spawn = ["sh" "-c" "${shell} launcher toggle"];
    "Mod+N".action.spawn = ["sh" "-c" "${shell} notifications toggleHistory"];

    "Mod+P".action.spawn = ["sh" "-c" "${shell} sessionMenu toggle"];
    "Mod+Alt+P".action.spawn = ["${pkgs.hyprpicker}/bin/hyprpicker" "-a"];

    "Mod+S".action.screenshot-window = {};
    "Mod+Alt+S".action.screenshot = {};
    "Mod+Shift+S".action.screenshot-screen = {};

    "Mod+H".action.focus-column-left = {};
    "Mod+L".action.focus-column-right = {};
    "Mod+K".action.focus-workspace-up = {};
    "Mod+J".action.focus-workspace-down = {};

    "Mod+Alt+H".action.move-column-left = {};
    "Mod+Alt+L".action.move-column-right = {};
    "Mod+Alt+K".action.move-column-to-workspace-up = {};
    "Mod+Alt+J".action.move-column-to-workspace-down = {};

    "Mod+Tab".action.toggle-overview = {};

    "Mod+Shift+H".action.consume-or-expel-window-left = {};
    "Mod+Shift+L".action.consume-or-expel-window-right = {};

    "Mod+BracketLeft".action.focus-monitor-left = {};
    "Mod+BracketRight".action.focus-monitor-right = {};

    "Mod+Alt+BracketLeft".action.move-column-to-monitor-left = {};
    "Mod+Alt+BracketRight".action.move-column-to-monitor-right = {};

    "Mod+V".action.switch-preset-column-width = {};
    "Mod+M".action.maximize-column = {};

    "XF86AudioRaiseVolume" = {
      action.spawn = ["sh" "-c" "${shell} volume increase"];
      allow-when-locked = true;
    };
    "XF86AudioLowerVolume" = {
      action.spawn = ["sh" "-c" "${shell} volume decrease"];
      allow-when-locked = true;
    };
    "XF86AudioMute" = {
      action.spawn = ["sh" "-c" "${shell} volume muteOutput"];
      allow-when-locked = true;
    };
    "XF86AudioPlay" = {
      action.spawn = ["sh" "-c" "${shell} media playPause"];
      allow-when-locked = true;
    };
    "XF86AudioNext" = {
      action.spawn = ["sh" "-c" "${shell} media next"];
      allow-when-locked = true;
    };
    "XF86AudioPrev" = {
      action.spawn = ["sh" "-c" "${shell} media previous"];
      allow-when-locked = true;
    };
  };
}
