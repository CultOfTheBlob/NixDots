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
                * <summary>
                * $1
                * </summary>
                */
              '';
            }

            {
              trigger = "Match";
              body = ''
                    Match
                \(
                    some: value =>
                    {
                        $1
                    },
                    none: () =>
                    {
                        $2
                    }
                \);
              '';
            }

            {
              trigger = "Match";
              body = ''
                    Match
                (
                    ok: value =>
                    {
                    },
                    err: value =>
                    {
                    }
                );
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
