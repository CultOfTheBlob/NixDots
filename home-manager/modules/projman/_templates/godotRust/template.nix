{
  dir_structure = [
    {
      name = "assets";
      sub_dirs = [];
    }
    {
      name = "src";
      sub_dirs = [
        {
          name = "utils";
          sub_dirs = [];
        }
        {
          name = "components";
          sub_dirs = [];
        }
        {
          name = "objects";
          sub_dirs = [];
        }
        {
          name = "scenes";
          sub_dirs = [];
        }
      ];
    }
    {
      name = "target";
      sub_dirs = [
        {
          name = "debug";
          sub_dirs = [];
        }
      ];
    }
    {
      name = "tests";
      sub_dirs = [];
    }
    {
      name = "bin";
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
      path = "Cargo.toml";
      content = builtins.readFile ./files/cargo.toml;
      tracked = false;
    }
    {
      path = "src/lib.rs";
      content =
        /*
        rust
        */
        ''
          //! `GDExtension` module.

          use godot::prelude::*;

          mod error;
          mod prelude;
          mod utils;

          struct GDExtension;

          ///SAFETY: This is a zero sized marker struct and thus always safe.
          #[gdextension]
          unsafe impl ExtensionLibrary for GDExtension {}
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
          #[derive(thiserror::Error, Debug)]
          pub enum Error {}
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

          #[expect(unused)]
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
          #[expect(unused_imports)]
          use crate::prelude::*;
        '';
      tracked = false;
    }
    {
      path = "src/components/mod.rs";
      content =
        /*
        rust
        */
        ''
          #[expect(unused_imports)]
          use crate::prelude::*;
        '';
      tracked = false;
    }
    {
      path = "src/objects/mod.rs";
      content =
        /*
        rust
        */
        ''
          #[expect(unused_imports)]
          use crate::prelude::*;
        '';
      tracked = false;
    }
    {
      path = "src/scenes/mod.rs";
      content =
        /*
        rust
        */
        ''
          #[expect(unused_imports)]
          use crate::prelude::*;
        '';
      tracked = false;
    }
    {
      path = "project.godot";
      content =
        /*
        toml
        */
        ''
          config_version=5

          [application]
            config/name="#{name}"
            config/features=PackedStringArray("4.6", "Forward Plus")

          [dotnet]
            project/assembly_name="#{name}"


          [file_customization]

          folder_colors={
          "res://assets/": "yellow",
            "res://bin/": "gray",
            "res://src/": "purple",
            "res://src/components/": "blue",
            "res://src/objects/": "teal",
            "res://src/scenes/": "red",
            "res://src/utils/": "orange",
            "res://tests/": "green"
          }
        '';
      tracked = false;
    }
    {
      path = "#{name}.gdextension";
      content =
        /*
        toml
        */
        ''
          [configuration]
          entry_symbol = "gdext_rust_init"
          compatibility_minimum = 4.6
          reloadable = true

          [libraries]
          linux.debug.x86_64 =     "res://target/debug/lib#{name}.so"
          linux.release.x86_64 =   "res://target/release/lib#{name}.so"
          windows.release.x86_64 = "res://target/release/#{name}.dll"
          macos.release =          "res://target/release/lib#{name}.dylib"
          macos.release.arm64 =    "res://target/release/lib#{name}.dylib"
        '';
    }
    {
      path = "target/.gdignore";
      content = "";
    }
    {
      path = ".rgignore";
      content = ''
        *

        !src/
        !src/**

        src/**/*.*

        !*.rs
        !*.gd
        !*.gdshader
        !*.glsl
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
        .godot/
        .nomedia/
        .import/
        export.cfg
        export_credentials.cfg
        *.translation
        data_*/
        debug
        target
        **/*.rs.bk
        *.pdb
        **/mutants.out*/
        result
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
          default:
            @cargo build

          fmt:
            @gdformat .
            @cargo fmt

          lint: fmt
            @gdlint .
            @cargo clippy -- -D warnings

          test: lint
            @cargo test

          build: test
            @cargo build

          push: build
            @git push
        '';
      tracked = true;
    }
    {
      path = "assets/godot_icon.svg";
      content = builtins.readFile ./files/godotIcon.svg;
      tracked = false;
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
        "exec"
        "."
        "just"
        "build"
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
      program = "godot4.6-mono";
      args = [
        "--editor"
        "--path ."
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
        "--"
        "--listen"
        "/tmp/godot.pipe"
      ];
    }
  ];
  included_paths = ["src" "tests"];
  excluded_paths = ["bin" ".godot" "target"];
}
