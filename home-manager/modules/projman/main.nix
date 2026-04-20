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
      rustWithIced = import ./_templates/rustWithIced/template.nix;

      neovimPlugin = import ./_templates/neovimPlugin/template.nix;
    };

    icons = {
      rustWithIced = ./_templates/rustWithIced/icon.svg;
      neovimPlugin = ./_templates/neovimPlugin/icon.svg;
    };

    projects = [
      {
        name = "NewProject";
        path = "/home/blob/Projects/NewProject";
        template_name = "rustWithIced";
        repo = "https://github.com/CultOfTheBlob/TestProject.git";
        license = "MIT";
      }
    ];
  };
}
