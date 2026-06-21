{
  programs.noctalia-shell.settings.idle = {
    enabled = true;
    screenOffTimeout = 0;
    lockTimeout = 1800;
    suspendTimeout = 0;
    fadeDuration = 5;
    screenOffCommand = "";
    lockCommand = "";
    suspendCommand = "";
    resumeScreenOffCommand = "";
    resumeLockCommand = "";
    resumeSuspendCommand = "";
    customCommands = builtins.toJSON [
      {
        name = "Turn on screensaver DP-1";
        timeout = 600;
        command = "kitty +kitten panel --edge=center --layer=overlay --focus-policy=exclusive --output-name=DP-1 -- drift --scene orrery --theme nord";
        resumeCommand = "pkill -f 'drift'";
      }
      {
        name = "Turn on screensaver DP-2";
        timeout = 600;
        command = "kitty +kitten panel --edge=center --layer=overlay --focus-policy=exclusive --output-name=DP-2 -- drift --scene rain --theme nord";
        resumeCommand = "pkill -f 'drift'";
      }
    ];
  };
}
