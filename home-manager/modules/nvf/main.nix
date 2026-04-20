{config, ...}: {
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
        clipboard = "unnamedplus";
        foldlevel = 99;
        foldlevelstart = 99;
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

      highlight = {
        LspInlayHint = {
          fg = "#${config.colors.base09}";
          italic = true;
        };
      };
    };
  };
}
