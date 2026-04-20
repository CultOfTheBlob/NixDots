{
  programs.lazygit = {
    enable = true;

    enableNushellIntegration = true;
    shellWrapperName = "lg";

    settings = {
      customCommands = [
        {
          key = "<c-p>";
          command = "just push";
          context = "global";
          description = "Push with just";
          loadingText = "Pushing";
        }
      ];
    };
  };
}
