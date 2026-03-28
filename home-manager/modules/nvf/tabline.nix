{
  programs.nvf.settings.vim.tabline = {
    nvimBufferline = {
      enable = true;

      setupOpts = {
        options = {
          always_show_bufferline = false;
          auto_toggle_bufferline = true;
          enforce_regular_tabs = true;
          diagnositcs = "nvim_lsp";
          sort_by = "insert_at_end";
        };
      };

      mappings = {
        closeCurrent = "<leader>bc";
        cycleNext = "<c-]>";
        cyclePrevious = "<c-[>";
        moveNext = "<leader>bm]";
        movePrevious = "<leader>bm[";

        pick = null;
        sortByDirectory = null;
        sortByExtension = null;
        sortById = null;
      };
    };
  };
}
