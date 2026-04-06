{
  dir_structure = [
    {
      name = "src";
      sub_dirs = [
        {
          name = "utils";
          sub_dirs = [];
        }
      ];
    }
    {
      name = "tests";
      sub_dirs = [];
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
      path = "Cargo.toml";
      content = ''
        [package]
        name = "#{name}"
        version = "0.1.0"
        edition = "2024"

        [dependencies]
        thiserror = "2.0.18"
        iced = "0.14.0"
      '';
      tracked = false;
    }
    {
      path = "src/main.rs";
      content =
        /*
        rust
        */
        ''
          mod error;
          mod prelude;
          mod utils;

          fn main() -> Result<()> { Ok(()) }
        '';
      tracked = false;
    }
    {
      path = "src/error.rs";
      content =
        /*
        rust
        */
        ''
          #[derive(thiserror::Error), Debug]
          pub enum Error;
        '';
      tracked = false;
    }
    {
      path = "src/prelude.rs";
      content =
        /*
        rust
        */
        ''
          pub use crate::error::Error;

          pub type Result<T> = core::result::Result<T, Error>;
        '';
      tracked = false;
    }
    {
      path = "src/utils/mod.rs";
      content =
        /*
        rust
        */
        ''
          use crate::prelude::*;
        '';
      tracked = false;
    }
    {
      path = ".fdignore";
      content = ''
        *
        !src/
        !src/**
      '';
      tracked = true;
    }
    {
      path = ".gitignore";
      content = ''
        debug
        target
        **/*.rs.bk
        *.pdb
        **/mutants.out*/
        /target
        /result
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
      program = "cp";
      args = [
        "/home/blob/Projects/ProjMan/flake.lock"
        "flake.lock"
      ];
    }
    {
      program = "nix";
      args = [
        "develop"
      ];
    }
    {
      program = "cargo";
      args = [
        "fmt"
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
        "--"
        "nix"
        "develop"
      ];
    }
    {
      program = "kitty";
      args = [
        "--detach"
        "--"
        "nix"
        "develop"
        "--command"
        "nv"
      ];
    }
  ];
  included_paths = ["src" "tests"];
  excluded_paths = ["target"];
}
