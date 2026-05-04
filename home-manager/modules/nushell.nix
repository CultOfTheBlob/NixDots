{
  home.shell.enableNushellIntegration = true;

  programs.nushell = {
    enable = true;

    settings = {
      show_banner = false;
      buffer_editor = "neovide";
      table.mode = "rounded";
      cursor_shape = {
        vi_normal = "block";
        vi_insert = "block";
        emacs = "line";
      };
    };

    shellAliases = {
      nv = "neovide";

      hist = "tv history";
      dots = "tv dotfiles";
      pj = "tv projects";

      ssh = "kitty +kitten ssh";
      download = "axel --alternate -n 20";

      x = "exit";
    };

    extraConfig =
      /*
      nu
      */
      ''
        $env.flake_path = do { $env.home | path join ".nix" }

        def "nx" [...args] {
          let task = { nh os switch $env.flake_path; nh home switch $env.flake_path }

          let start = date now
          let result = do $task
          let end = date now

          let total = $end - $start | format duration sec
          let body = $"Finished in ($total)"
          notify-send -u low "System Rebuilt!" $body
          return $result
        }

        def "nx os" [...args] {
          let task = { nh os switch $env.flake_path }

          let start = date now
          let result = do $task
          let end = date now

          let total = $end - $start | format duration sec
          let body = $"Finished in ($total)"
          notify-send -u low "Nixos Rebuilt!" $body
          return $result
        }

        def "nx hm" [...args] {
          let task = { nh home switch $env.flake_path }

          let start = date now
          let result = do $task
          let end = date now

          let total = $end - $start | format duration sec
          let body = $"Finished in ($total)"
          notify-send -u low "Home Manager Rebuilt!" $body
          return $result
        }

        def "nx up" [...args] {
          let task = { nix flake update --flake $env.flake_path }

          let start = date now
          let result = do $task
          let end = date now

          let total = $end - $start | format duration sec
          let body = $"Finished in ($total)"
          notify-send -u low "Flake Updated!" $body
          return $result
        }
      '';
  };
}
