{ user, ... }: {
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

    projects = [
      {
        name = "ProjMan";
        path = "/home/blob/Projects/ProjMan";
        template_name = "Rust";
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
      {
        name = "BlackHole";
        path = "/home/blob/Projects/BlackHole";
        template_name = "Odin";
        repo = "git@github.com:CultOfTheBlob/BlackHole.git";
        license = "MIT";
      }
      {
        name = "ExperimentVector";
        path = "/home/blob/Projects/ExperimentVector/";
        template_name = "GodotRust";
        repo = "git@github.com:MalfractureStudios/ExperimentVector.git";
        license = "MIT";
      }
      {
        name = "ReanimateAnimations";
        path = "/home/blob/Projects/ReanimateAnimations";
        repo = "git@github.com:CultOfTheBlob/ReanimateAnimations.git";
        license = "MIT";
        template_name = "HaskellReanimate";
      }
    ];
  };
}
