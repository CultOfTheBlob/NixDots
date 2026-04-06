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
      rustWithIced = import ./rustWithIced/template.nix;
    };

    icons = {
      rustWithIced = ./rustWithIced/icon.svg;
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
