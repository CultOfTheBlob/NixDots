{
  pkgs,
  lib,
  user,
  host,
  ...
}:
{
  programs.helix = {
    enable = true;

    extraPackages = with pkgs; [
      nixd
      nixfmt
    ];

    settings = {
      theme = "nord";

      editor = {
        line-number = "relative";
        bufferline = "always";

        cursor-shape = {
          insert = "bar";
          normal = "block";
          select = "underline";
        };
      };

      keys = {
        normal = {
          "C-g" = [
            ":write-all"
            ":insert-output lazygit >/dev/tty"
            ":redraw"
            ":reload-all"
          ];
          "C-]" = "goto_next_buffer";
          "C-[" = "goto_previous_buffer";
        };
      };
    };

    languages = {
      language-server.nixd = {
        command = lib.getExe pkgs.nixd;
        args = [ "--semantic-tokens=true" ];

        config.nixd =
          let
            nixosConfiguration = host;
            flakeRef = ''(builtins.getFlake "/home/${user}/.nix")'';
            nixosOpts = "${flakeRef}.nixosConfigurations.${nixosConfiguration}.options";
          in
          {
            nixpkgs.expr = "import ${flakeRef}.inputs.nixpkgs { }";

            options = {
              nixos.expr = nixosOpts;

              home-manager.expr = "${nixosOpts}.home-manager.users.type.getSubOptions []";
            };
          };
      };

      language = [
        {
          name = "nix";
          language-servers = [ "nixd" ];
          auto-format = true;
          formatter.command = lib.getExe pkgs.nixfmt;
        }
      ];
    };
  };
}
