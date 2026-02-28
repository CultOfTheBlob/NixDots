{pkgs, ...}: {
  programs.nvf.settings.vim.treesitter = {
    enable = true;

    grammars = with pkgs.vimPlugins.nvim-treesitter.builtGrammars; [
      gdscript
      gdshader
      godot_resource
      latex
    ];

    addDefaultGrammars = true;
    autotagHtml = true;
    fold = true;

    highlight = {
      enable = true;
    };

    indent = {
      enable = false;
    };

    textobjects = {
      enable = true;
    };
  };
}
