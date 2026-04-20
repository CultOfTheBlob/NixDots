{
  programs.nvf.settings.vim.terminal = {
    toggleterm = {
      enable = true;

      setupOpts = {
        direction = "float";
        shell = "direnv exec . nu";
      };

      mappings = {
        open = "<C-t>";
      };

      lazygit = {
        enable = true;

        direction = "float";

        mappings = {
          open = "<leader>G";
        };
      };
    };
  };
}
