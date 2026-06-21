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

    templates = {
      RustWithIced = import ./_templates/rustWithIced/template.nix;
      NeovimPlugin = import ./_templates/neovimPlugin/template.nix;
      GodotMono = import ./_templates/godotMono/template.nix;
      GodotRust = import ./_templates/godotRust/template.nix;
      Odin = import ./_templates/odin/template.nix;
    };

    icons = {
      RustWithIced = ./_templates/rustWithIced/icon.svg;
      NeovimPlugin = ./_templates/neovimPlugin/icon.svg;
      GodotMono = ./_templates/godotMono/icon.svg;
      GodotRust = ./_templates/godotRust/icon.svg;
      Odin = ./_templates/odin/icon.svg;
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
