{
  programs.noctalia-shell = {
    enable = true;
    settings = {
      settingsVersion = 59;
      general = {
        avatarImage = toString ../assets/face.jpg;
        dimmerOpacity = 0.2;
        showScreenCorners = true;
        forceBlackScreenCorners = true;
        scaleRatio = 1;
        radiusRatio = 1;
        iRadiusRatio = 1;
        boxRadiusRatio = 1;
        screenRadiusRatio = 0.64;
        animationSpeed = 1;
        animationDisabled = false;
        compactLockScreen = false;
        lockScreenAnimations = true;
        lockOnSuspend = true;
        showSessionButtonsOnLockScreen = true;
        showHibernateOnLockScreen = true;
        enableLockScreenMediaControls = true;
        enableShadows = true;
        enableBlurBehind = true;
        shadowDirection = "bottom_right";
        shadowOffsetX = 2;
        shadowOffsetY = 3;
        language = "";
        allowPanelsOnScreenWithoutBar = true;
        showChangelogOnStartup = true;
        telemetryEnabled = false;
        enableLockScreenCountdown = true;
        lockScreenCountdownDuration = 10000;
        autoStartAuth = false;
        allowPasswordWithFprintd = false;
        clockStyle = "analog";
        clockFormat = "hh\nmm";
        passwordChars = false;
        lockScreenMonitors = ["DP-1"];
        lockScreenBlur = 0.5;
        lockScreenTint = 0.1;
        keybinds = {
          keyUp = ["Up"];
          keyDown = ["Down"];
          keyLeft = ["Left"];
          keyRight = ["Right"];
          keyEnter = ["Return" "Enter"];
          keyEscape = ["Esc"];
          keyRemove = ["Backspace"];
        };
        reverseScroll = false;
        smoothScrollEnabled = true;
      };
    };
  };
}
