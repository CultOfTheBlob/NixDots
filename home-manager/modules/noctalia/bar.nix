{
  programs.noctalia-shell.settings.bar = {
    barType = "framed";
    position = "top";
    monitors = [
      "DP-1"
    ];
    density = "comfortable";
    showOutline = false;
    showCapsule = true;
    capsuleOpacity = 1;
    capsuleColorKey = "none";
    widgetSpacing = 6;
    contentPadding = 2;
    fontScale = 1;
    enableExclusionZoneInset = true;
    backgroundOpacity = 0.93;
    useSeparateOpacity = false;
    marginVertical = 4;
    marginHorizontal = 4;
    frameThickness = 8;
    frameRadius = 12;
    outerCorners = true;
    hideOnOverview = false;
    displayMode = "always_visible";
    autoHideDelay = 500;
    autoShowDelay = 150;
    showOnWorkspaceSwitch = true;
    widgets = {
      left = [
        {
          colorizeSystemIcon = "none";
          customIconPath = "";
          enableColorization = false;
          icon = "rocket";
          id = "Launcher";
          useDistroLogo = true;
        }
        {
          id = "Spacer";
          width = 10;
        }
        {
          clockColor = "none";
          customFont = "";
          formatHorizontal = "h:mm:ss AP / ddd-dd MMM-MM yyyy";
          formatVertical = "HH mm - dd MM";
          id = "Clock";
          tooltipFormat = "HH:mm ddd; MMM dd";
          useCustomFont = false;
        }
        {
          compactMode = false;
          diskPath = "/";
          iconColor = "none";
          id = "SystemMonitor";
          showCpuCores = false;
          showCpuFreq = false;
          showCpuTemp = false;
          showCpuUsage = false;
          showDiskAvailable = false;
          showDiskUsage = false;
          showDiskUsageAsPercent = false;
          showGpuTemp = false;
          showLoadAverage = false;
          showMemoryAsPercent = false;
          showMemoryUsage = false;
          showNetworkStats = true;
          showSwapUsage = false;
          textColor = "primary";
          useMonospaceFont = true;
          usePadding = false;
        }
        {
          compactMode = true;
          hideMode = "hidden";
          id = "MediaMini";
          maxWidth = 145;
          panelShowAlbumArt = false;
          scrollingMode = "hover";
          showAlbumArt = false;
          showArtistFirst = false;
          showProgressRing = true;
          showVisualizer = true;
          textColor = "none";
          useFixedWidth = false;
          visualizerType = "linear";
        }
      ];
      center = [
        {
          characterCount = 2;
          colorizeIcons = false;
          emptyColor = "tertiary";
          enableScrollWheel = false;
          focusedColor = "primary";
          followFocusedScreen = false;
          fontWeight = "bold";
          groupedBorderOpacity = 1;
          hideUnoccupied = false;
          iconScale = 0.9;
          id = "Workspace";
          labelMode = "index";
          occupiedColor = "tertiary";
          pillSize = 0.6;
          showApplications = true;
          showApplicationsHover = false;
          showBadge = true;
          showLabelsOnlyWhenOccupied = false;
          unfocusedIconsOpacity = 1;
        }
      ];
      right = [
        {
          hideWhenZero = false;
          hideWhenZeroUnread = true;
          iconColor = "none";
          id = "NotificationHistory";
          showUnreadBadge = true;
          unreadBadgeColor = "primary";
        }
        {
          blacklist = [];
          chevronColor = "none";
          colorizeIcons = false;
          drawerEnabled = true;
          hidePassive = false;
          id = "Tray";
        }
        {
          iconColor = "none";
          id = "KeepAwake";
          textColor = "none";
        }
        {
          id = "Spacer";
          width = 10;
        }
        {
          displayMode = "alwaysShow";
          iconColor = "none";
          id = "Network";
          textColor = "none";
        }
        {
          displayMode = "onhover";
          iconColor = "none";
          id = "Bluetooth";
          textColor = "none";
        }
        {
          id = "Spacer";
          width = 10;
        }
        {
          displayMode = "alwaysShow";
          iconColor = "none";
          id = "Volume";
          middleClickCommand = "wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle";
          textColor = "none";
        }
        {
          displayMode = "onhover";
          iconColor = "none";
          id = "Microphone";
          middleClickCommand = "wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle";
          textColor = "none";
        }
        {
          id = "Spacer";
          width = 10;
        }
        {
          iconColor = "error";
          id = "SessionMenu";
        }
      ];
    };
    mouseWheelAction = "none";
    reverseScroll = false;
    mouseWheelWrap = true;
    middleClickAction = "none";
    middleClickFollowMouse = false;
    middleClickCommand = "";
    rightClickAction = "none";
    rightClickFollowMouse = true;
    rightClickCommand = "";
    screenOverrides = [
      {
        enabled = false;
        name = "DP-1";
      }
      {
        density = "mini";
        displayMode = "always_visible";
        enabled = false;
        name = "DP-2";
        position = "bottom";
        widgets = {
          center = [];
          left = [];
          right = [];
        };
      }
    ];
  };
}
