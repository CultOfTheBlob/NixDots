{config, ...}: {
  programs.nvf.settings.vim.terminal = {
    toggleterm = {
      enable = true;

      setupOpts = {
        direction = "float";
        shell = "direnv exec . nu";

        highlights = with config.colors; {
          FloatBorder = {
            guifg = "#${base07}";
          };
        };

        float_opts = {
          border = "curved";
        };
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
