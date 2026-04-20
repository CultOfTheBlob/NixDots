{
  dir_structure = [
    {
      name = "lua";
      sub_dirs = [
        {
          name = "#{name}";
          sub_dirs = [];
        }
      ];
    }
    {
      name = "nix";
      sub_dirs = [];
    }
  ];
  files = [
    {
      path = "flake.nix";
      content = builtins.readFile ./files/flake.nix;
      tracked = true;
    }
    {
      path = "nix/package.nix";
      content = builtins.readFile ./files/package.nix;
      tracked = false;
    }
    {
      path = "nix/outputs.nix";
      content = builtins.readFile ./files/outputs.nix;
      tracked = false;
    }
    {
      path = "nix/shell.nix";
      content = builtins.readFile ./files/shell.nix;
      tracked = false;
    }
    {
      path = "lua/#{name}/init.lua";
      content =
        /*
        lua
        */
        ''
          local M = {}

          function M.setup(opts) end

          return M
        '';
      tracked = false;
    }
    {
      path = ".luarc.json";
      content =
        /*
        json
        */
        ''
          {
            "diagnostics.globals": ["vim"]
          }
        '';
      tracked = true;
    }
    {
      path = ".luacheckrc";
      content =
        /*
        lua
        */
        ''
          globals = { "vim" }
        '';
      tracked = true;
    }
    {
      path = ".rgignore";
      content = ''
        *
        !lua/
        !lua/**
      '';
      tracked = true;
    }
    {
      path = ".envrc";
      content = ''
        use flake
      '';
      tracked = true;
    }
    {
      path = ".gitignore";
      content = ''
        .nvimlog
        nvim.log
        luac.out
        *.tar.gz
        *.o
        *.os
        *.ko
        *.obj
        *.elf
        *.gch
        *.pch
        *.lib
        *.a
        *.la
        *.lo
        *.def
        *.exp
        *.dll
        *.so
        *.so.*
        *.dylib
        *.out
        *.app
        *.i*86
        *.x86_64
        *.hex
        /result
        .direnv
      '';
      tracked = true;
    }
    {
      path = ".justfile";
      content =
        /*
        just
        */
        ''
          default: run

          run:
            @nvim-dev

          push:
            @git push
        '';
      tracked = true;
    }
  ];
  build = [
    {
      program = "git";
      args = [
        "add"
        "-A"
      ];
    }
    {
      program = "nix";
      args = [
        "develop"
      ];
    }
    {
      program = "direnv";
      args = [
        "allow"
      ];
    }
  ];
  run = [
    {
      program = "kitty";
      args = [
        "--detach"
        "--class"
        "console"
      ];
    }
    {
      program = "direnv";
      args = [
        "exec"
        "."
        "neovide"
        "--wayland_app_id"
        "editor"
      ];
    }
  ];
  included_paths = ["lua" "nix"];
  excluded_paths = [];
}
