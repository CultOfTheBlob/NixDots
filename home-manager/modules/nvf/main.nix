{
  programs.nvf = {
    enable = true;

    settings.vim = {
      theme = {
        enable = true;
        name = "nord";
      };

      globals = {
        mapleader = " ";
      };

      lineNumberMode = "relNumber";

      undoFile.enable = true;

      options = {
        tabstop = 2;
        shiftwidth = 2;
        expandtab = true;
        mouse = "";
      };

      autocmds = [
        {
          enable = true;

          desc = "Change tab width to 4 in c# file.";

          command = "setlocal tabstop=4 shiftwidth=4";
          event = ["FileType"];
          pattern = ["cs"];
        }

        {
          enable = true;

          desc = "Setup comments for gdshader.";

          command = "set commentstring=//%s";
          event = ["FileType"];
          pattern = ["gdshader"];
        }
      ];

      clipboard = {
        registers = "unnamedplus";

        providers = {
          wl-copy.enable = true;
        };
      };
    };
  };
}
