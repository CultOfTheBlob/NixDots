{
  programs.noctalia-shell.settings.notifications = {
    enabled = true;
    enableMarkdown = false;
    density = "default";
    monitors = [
      "DP-1"
    ];
    location = "bottom_right";
    overlayLayer = true;
    backgroundOpacity = 1;
    respectExpireTimeout = false;
    lowUrgencyDuration = 3;
    normalUrgencyDuration = 8;
    criticalUrgencyDuration = 15;
    clearDismissed = true;
    saveToHistory = {
      low = false;
      normal = true;
      critical = true;
    };
    sounds = {
      enabled = true;
      volume = 0.5;
      separateSounds = false;
      criticalSoundFile = "";
      normalSoundFile = "";
      lowSoundFile = "";
      excludedApps = "discord";
    };
    enableMediaToast = true;
    enableKeyboardLayoutToast = false;
    enableBatteryToast = false;
  };
}
