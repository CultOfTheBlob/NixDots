{
  programs.noctalia-shell.settings.sessionMenu = {
    enableCountdown = true;
    countdownDuration = 500;
    position = "top_right";
    showHeader = true;
    showKeybinds = true;
    largeButtonsStyle = false;
    largeButtonsLayout = "single-row";
    powerOptions = [
      {
        action = "lock";
        command = "";
        countdownEnabled = true;
        enabled = true;
        keybind = "L";
      }
      {
        action = "suspend";
        command = "systemctl hybrid-sleep";
        countdownEnabled = true;
        enabled = true;
        keybind = "S";
      }
      {
        action = "hibernate";
        command = "";
        countdownEnabled = true;
        enabled = true;
        keybind = "H";
      }
      {
        action = "reboot";
        command = "";
        countdownEnabled = true;
        enabled = true;
        keybind = "R";
      }
      {
        action = "logout";
        command = "";
        countdownEnabled = true;
        enabled = true;
        keybind = "G";
      }
      {
        action = "shutdown";
        command = "";
        countdownEnabled = true;
        enabled = true;
        keybind = "P";
      }
      {
        action = "rebootToUefi";
        command = "";
        countdownEnabled = true;
        enabled = false;
        keybind = "";
      }
      {
        action = "userspaceReboot";
        command = "";
        countdownEnabled = true;
        enabled = false;
        keybind = "";
      }
    ];
  };
}
