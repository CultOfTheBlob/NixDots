{lib, ...}: {
  xdg.configFile.dolphin = {
    target = "dolphinrc";

    text = lib.generators.toINIWithGlobalSection {} {
      globalSection = {
        MenuBar = "Disabled";
      };

      sections = {
        ContentDisplay = {
          DirectorySizeMode = "ContentSize";
        };

        DetailsMode = {
          PreviewSize = 32;
        };

        FileDialogSize = {
          "2 screens: Window-Maximized" = true;
        };

        General = {
          DynamicView = true;
          Version = 202;
          ViewPropsTimestamp = "2025,8,25,20,19,34.267";
        };

        "KFileDialog Settings" = {
          "Places Icons Auto-resize" = false;
          "Places Icons Static Size" = 22;
        };

        MainWindow = {
          MenuBar = "Disabled";
        };

        PreviewSettings = {
          Plugins = "appimagethumbnail,audiothumbnail,comicbookthumbnail,cursorthumbnail,djvuthumbnail,ebookthumbnail,exrthumbnail,directorythumbnail,imagethumbnail,jpegthumbnail,kraorathumbnail,windowsexethumbnail,windowsimagethumbnail,opendocumentthumbnail,svgthumbnail";
        };

        UiSettings = {
          ColorScheme = "Nord";
        };
      };
    };
  };
}
