{
  programs.kitty = {
    enable = true;

    enableGitIntegration = true;

    settings = {
      confirm_os_window_close = 0;
      scrollback_lines = 2000;
      wheel_scroll_min_lines = 1;
      cursor_trail = 5;
      enable_audio_bell = false;
      paste_action = "no_op";
      clipboard_control = "write-clipboard write-primary read-clipboard read-primary";
    };

    keybindings = {
      "ctrl+shift+t" = "new_tab";
      "ctrl+shift+w" = "close_tab";
      "ctrl+shift+l" = "next_tab";
      "ctrl+shift+h" = "previous_tab";

      "ctrl+shift+enter" = "new_window";
      "ctrl+alt+q" = "close_window";
      "ctrl+alt+]" = "next_window";
      "ctrl+alt+[" = "previous_window";
    };
  };
}
