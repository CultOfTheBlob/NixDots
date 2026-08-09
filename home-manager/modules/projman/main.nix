{user, ...}: {
  programs.projman = {
    enable = true;

    settings = {
      general = {
        projects_dir = "/home/${user}/Projects/";
        delete_project_folder = false;
      };

      theme = {
        theme = "Nord";
      };
    };

    icons = {
      RustWithIced = ./templates/rustWithIced/icon.svg;
      NeovimPlugin = ./templates/neovimPlugin/icon.svg;
      GodotMono = ./templates/godotMono/icon.svg;
      GodotRust = ./templates/godotRust/icon.svg;
      Odin = ./templates/odin/icon.svg;
      Rust = ./templates/rust/icon.svg;
    };

    projects = [
      {
        name = "projman";
        path = "/home/blob/Projects/projman";
        template_name = "RustWithIced";
        repo = "git@github.com:CultOfTheBlob/ProjMan.git";
        license = "MIT";
      }
      {
        name = "godot-scenetree";
        path = "/home/blob/Projects/godot-scenetree";
        template_name = "NeovimPlugin";
        repo = "git@github.com:CultOfTheBlob/godot-scenetree.nvim.git";
        license = "MIT";
      }
    ];
  };
}
