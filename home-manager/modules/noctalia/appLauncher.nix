{
  programs.noctalia-shell.settings.appLauncher = {
    enableClipboardHistory = false;
    autoPasteClipboard = false;
    enableClipPreview = true;
    clipboardWrapText = true;
    enableClipboardSmartIcons = true;
    enableClipboardChips = true;
    clipboardWatchTextCommand = "wl-paste --type text --watch cliphist store";
    clipboardWatchImageCommand = "wl-paste --type image --watch cliphist store";
    position = "bottom_center";
    pinnedApps = [];
    sortByMostUsed = true;
    terminalCommand = "kitty -e";
    customLaunchPrefixEnabled = false;
    customLaunchPrefix = "";
    viewMode = "list";
    showCategories = false;
    iconMode = "tabler";
    showIconBackground = true;
    enableSettingsSearch = false;
    enableWindowsSearch = false;
    enableSessionSearch = false;
    ignoreMouseInput = false;
    screenshotAnnotationTool = "";
    overviewLayer = false;
    density = "comfortable";
  };
}
