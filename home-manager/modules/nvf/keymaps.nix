{
  programs.nvf.settings.vim = {
    keymaps = [
      {
        key = "gb";
        mode = "n";
        action = "o/**/<Esc>hi<Enter><Enter><Esc>ka<Space>";
      }
      {
        key = "gB";
        mode = "n";
        action = "O/**/<Esc>hi<Enter><Enter><Esc>ka<Space>";
      }

      {
        key = "<leader>sv";
        mode = "n";
        action = ":vsplit<cr>";
      }
      {
        key = "<leader>sh";
        mode = "n";
        action = ":split<cr>";
      }

      {
        key = "<c-h>";
        mode = "n";
        action = ":wincmd h<cr>";
      }
      {
        key = "<c-j>";
        mode = "n";
        action = ":wincmd j<cr>";
      }
      {
        key = "<c-k>";
        mode = "n";
        action = ":wincmd k<cr>";
      }
      {
        key = "<c-l>";
        mode = "n";
        action = ":wincmd l<cr>";
      }

      {
        key = "<c-]>";
        mode = "n";
        action = ":bnext<cr>";
      }
      {
        key = "<c-[>";
        mode = "n";
        action = ":bprev<cr>";
      }

      {
        key = "<leader>h";
        mode = "n";
        action = ":nohlsearch<CR>";
        desc = "Clear Search";
      }

      {
        key = "<leader>pf";
        mode = "n";
        action = ":Pick files<CR>";
        desc = "Pick Files";
      }
      {
        key = "<leader>pb";
        mode = "n";
        action = ":Pick buffers<CR>";
        desc = "Pick Buffers";
      }
      {
        key = "<leader>pl";
        mode = "n";
        action = ":Pick buf_lines<CR>";
        desc = "Pick Lines";
      }
      {
        key = "<leader>pg";
        mode = "n";
        action = ":Pick grep_live<CR>";
        desc = "Pick Grep";
      }
      {
        key = "<leader>pr";
        mode = "n";
        action = ":Pick registers<CR>";
        desc = "Pick Registers";
      }

      {
        key = "<leader>e";
        mode = "n";
        action = ":lua MiniFiles.open()<CR>";
        desc = "File Explorer";
      }

      {
        key = "<C-I>";
        mode = "i";
        action = "<cmd>lua require('luasnip').jump(1)<CR>";
      }
      {
        key = "<C-E>";
        mode = "i";
        action = "<cmd>lua require('luasnip').jump(-1)<CR>";
      }

      {
        key = "<up>";
        mode = ["n" "i"];
        action = "<nop>";
      }
      {
        key = "<down>";
        mode = ["n" "i"];
        action = "<nop>";
      }
      {
        key = "<left>";
        mode = ["n" "i"];
        action = "<nop>";
      }
      {
        key = "<right>";
        mode = ["n" "i"];
        action = "<nop>";
      }
    ];
  };
}
