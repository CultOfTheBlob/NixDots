{config, ...}: {
  programs.noctalia-shell.settings.wallpaper = {
    enabled = true;
    overviewEnabled = false;
    directory = "/home/blob/Pictures/Wallpapers";
    monitorDirectories = [];
    enableMultiMonitorDirectories = false;
    showHiddenFiles = false;
    viewMode = "single";
    setWallpaperOnAllMonitors = true;
    linkLightAndDarkWallpapers = true;
    fillMode = "crop";
    fillColor = "#${config.colors.base00}";
    useSolidColor = false;
    solidColor = "#${config.colors.base01}";
    automationEnabled = false;
    wallpaperChangeMode = "random";
    randomIntervalSec = 300;
    transitionDuration = 1500;
    transitionType = [
      "stripes"
    ];
    skipStartupTransition = false;
    transitionEdgeSmoothness = 0.05;
    panelPosition = "follow_bar";
    hideWallpaperFilenames = false;
    useOriginalImages = false;
    overviewBlur = 0.4;
    overviewTint = 0.6;
    useWallhaven = false;
    wallhavenQuery = "";
    wallhavenSorting = "relevance";
    wallhavenOrder = "desc";
    wallhavenCategories = "111";
    wallhavenPurity = "100";
    wallhavenRatios = "";
    wallhavenApiKey = "";
    wallhavenResolutionMode = "atleast";
    wallhavenResolutionWidth = "";
    wallhavenResolutionHeight = "";
    sortOrder = "name";
    favorites = [];
  };

  home.file.".cache/noctalia/wallpapers.json" = {
    text = builtins.toJSON {
      defaultWallpaper = toString ../assets/wallpaper-dp1.png;
      wallpapers = {
        "DP-1" = toString ../assets/wallpaper-dp1.png;
        "DP-2" = toString ../assets/wallpaper-dp2.png;
      };
    };
  };
}
