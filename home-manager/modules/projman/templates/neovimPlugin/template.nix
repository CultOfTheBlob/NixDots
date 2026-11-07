{
  programs.projman.templates.NeovimPlugin = {
    icon = ./icon.svg;

    dir_structure = [
      {
        name = "lua";
        sub_dirs = [
          {
            name = "#{name}";
            sub_dirs = [ ];
          }
        ];
      }
      {
        name = "nix";
        sub_dirs = [ ];
      }
    ];
    files = [
      {
        path = "flake.nix";
        contents = builtins.readFile ./_files/flake.nix;
      }
      {
        path = "lua/#{name}/init.lua";
        contents = /* lua */ ''
          local M = {}

          function M.setup(opts) end

          return M
        '';
      }
      {
        path = ".luacheckrc";
        contents = /* lua */ ''
          globals = { "vim" }
        '';
      }
      {
        path = ".rgignore";
        contents = ''
          *
          !lua/
          !lua/**
        '';
      }
      {
        path = ".envrc";
        contents = ''
          use flake
        '';
      }
      {
        path = ".gitignore";
        contents = ''
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
      }
      {
        path = ".justfile";
        contents = /* just */ ''
          default: run

          run:
            @nvim-dev

          push:
            @git push
        '';
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
    included_paths = [
      "lua"
      "nix"
    ];
    excluded_paths = [ ];
  };
}
