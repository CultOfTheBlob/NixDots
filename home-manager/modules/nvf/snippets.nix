{
  programs.nvf.settings.vim.snippets = {
    luasnip = {
      enable = true;

      providers = ["friendly-snippets"];

      setupOpts = {
        enable_autosnippets = true;
      };

      customSnippets = {
        snipmate = {
          cs = [
            {
              trigger = "/doc";
              body = ''
                /**
                * $1
                */
              '';
            }

            {
              trigger = "export";
              body = ''
                [Export]
                private $\{1:int\} $2;
              '';
            }
            {
              trigger = "public";
              body = ''
                public $1 $2
                {
                    get => $3;
                    set => $3 = value;
                }
              '';
            }
            {
              trigger = "public_readonly";
              body = ''
                public $1 $2
                {
                    get => $3;
                }
              '';
            }
          ];

          rust = [
            {
              trigger = "/doc";
              body = ''
                /**
                $1
                */
              '';
            }
          ];
        };
      };
    };
  };
}
