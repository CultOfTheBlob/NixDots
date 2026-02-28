{
  programs.nvf.settings.vim.utility = {
    ccc = {
      enable = true;

      mappings = {
        decrease10 = "<H>";
        increase10 = "<L>";
        quit = "<Esc>";
      };
    };

    yanky-nvim = {
      enable = true;

      setupOpts = {
        ring.storage = "sqlite";
      };
    };
  };
}
