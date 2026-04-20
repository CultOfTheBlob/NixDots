{
  programs.television = {
    enable = true;

    enableFishIntegration = true;

    settings = {
      ui = {
        theme = "nord-dark";

        input_bar = {
          prompt = "->";
        };

        preview_panel = {
          size = 50;
        };

        status_bar = {
          hidden = true;
        };
      };

      keybindings = {
        esc = "";
        ctrl-q = "quit";
      };
    };

    channels = {
      projects = {
        metadata = {
          name = "projects";
          description = "Browse and preview projects";
          requirements = ["nu"];
        };

        source = {
          command = "projman list";
        };

        preview = {
          command = " projman info {}";
        };

        keybindings = {
          enter = "actions:open";
        };

        actions = {
          open = {
            description = "Open the selected project";
            command = "projman open {}";
            mode = "execute";
          };
        };

        ui = {
          preview_panel = {
            size = 26;
          };
        };
      };

      dotfiles = {
        metadata = {
          name = "dotfiles";
          description = "Browse and edit dotfiles";
          requirements = ["fd" "bat"];
        };

        source = {
          command = "fd -t f . $env.flake_path";
        };

        preview = {
          command = "bat -n --style numbers,changes --color=always '{}'";
        };

        keybindings = {
          enter = "actions:edit";
        };

        actions = {
          edit = {
            description = "Edit the selected dotfile";
            command = "nu -c 'exec $env.editor '{}''";
            mode = "execute";
          };
        };
      };

      files = {
        metadata = {
          name = "files";
          description = "Browse files and directories";
          requirements = ["fd" "bat"];
        };

        source = {
          command = ["fd -t f" "fd -t f -H"];
        };

        preview = {
          command = "bat -n --style numbers,changes --color=always '{}'";
        };

        keybindings = {
          enter = "actions:edit";
        };

        actions = {
          edit = {
            description = "Opens the selected entries";
            command = "nu -c 'exec $env.editor '{}''";
            mode = "execute";
          };
        };
      };

      history = {
        metadata = {
          name = "history";
          description = "Browse command history";
          requirements = ["nu" "wl-copy"];
        };

        source = {
          command = "nu -c 'open $nu.history-path | lines | uniq | reverse | to text'";
          no_sort = true;
          frecency = false;
        };

        keybindings = {
          enter = "actions:copy";
        };

        actions = {
          copy = {
            description = "Opens the selected entries";
            command = "wl-copy '{}'";
            mode = "execute";
          };
        };
      };

      alias = {
        metadata = {
          name = "";
          description = "";
        };
        source.command = "echo";
      };
      text = {
        metadata = {
          name = "";
          description = "";
        };
        source.command = "echo";
      };
      bash-history = {
        metadata = {
          name = "";
          description = "";
        };
        source.command = "echo";
      };
      dirs = {
        metadata = {
          name = "";
          description = "";
        };
        source.command = "echo";
      };
      docker-images = {
        metadata = {
          name = "";
          description = "";
        };
        source.command = "echo";
      };
      env = {
        metadata = {
          name = "";
          description = "";
        };
        source.command = "echo";
      };
      git-branch = {
        metadata = {
          name = "";
          description = "";
        };
        source.command = "echo";
      };
      git-diff = {
        metadata = {
          name = "";
          description = "";
        };
        source.command = "echo";
      };
      git-log = {
        metadata = {
          name = "";
          description = "";
        };
        source.command = "echo";
      };
      git-repos = {
        metadata = {
          name = "";
          description = "";
        };
        source.command = "echo";
      };
    };
  };
}
