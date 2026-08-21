{
  programs.projman.templates.Odin = {
    icon = ./icon.svg;

    dir_structure = [
      {
        name = "src";
        sub_dirs = [];
      }
    ];
    files = [
      {
        path = "flake.nix";
        contents = builtins.readFile ./_files/flake.nix;
      }
      {
        path = "ols.json";
        contents =
          /*
          json
          */
          ''
            {
            	"$schema": "https://raw.githubusercontent.com/DanielGavin/ols/master/misc/ols.schema.json",
            	"collections": [],
            	"enable_semantic_tokens": false,
            	"enable_document_symbols": true,
            	"enable_hover": true,
            	"enable_snippets": true,
            	"profile": "default",
            	"profiles": [
            		{ "name": "default", "checker_path": ["src"], "defines": { "ODIN_DEBUG": "false" }},
            		{ "name": "linux_profile", "os": "linux", "checker_path": ["src/main.odin"], "defines": { "ODIN_DEBUG": "false" }},
            		{ "name": "mac_profile", "os": "darwin", "arch": "arm64", "defines": { "ODIN_DEBUG": "false" }},
            		{ "name": "windows_profile", "os": "windows", "checker_path": ["src"], "defines": { "ODIN_DEBUG": "false" }}
            	]
            }
          '';
      }
      {
        path = "src/main.odin";
        contents =
          /*
          odin
          */
          ''
            package main

            main :: proc() {}
          '';
      }
      {
        path = ".rgignore";
        contents = ''
          *
          !src/
          !src/**
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
          /result
          .direnv
        '';
      }
      {
        path = ".justfile";
        contents =
          /*
          just
          */
          ''
            default: run

            run:
              @odin run src

            push:
              @nix build
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
    included_paths = ["src"];
    excluded_paths = [];
  };
}
