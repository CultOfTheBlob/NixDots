{ pkgs, ... }:
let
  nordTheme = pkgs.fetchurl {
    url = "https://raw.githubusercontent.com/nushell/nu_scripts/refs/heads/main/themes/nu-themes/nord.nu";
    hash = "sha256-1EHOWrrBhE3RmWWOgIdZdQBnK71FspdkDe4Mt0M488k=";
  };
in
{
  home.shell.enableNushellIntegration = true;

  programs.nushell = {
    enable = true;

    loadSessionVariables = true;

    settings = {
      show_banner = false;
      buffer_editor = "helix";
      table.mode = "rounded";
      edit_mode = "helix";
      cursor_shape = {
        helix_insert = "line";
        helix_normal = "block";
        helix_select = "underscore";
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

    extraConfig = /* nu */ ''
      source ${nordTheme}

      $env.ls_colors = (${pkgs.vivid}/bin/vivid generate nord)
      $env.config.ls.use_ls_colors = true
      $env.config.completions.use_ls_colors = true

      $env.config.keybindings ++= [
        {
          name: tab_ide_completion_menu
          modifier: none
          keycode: tab
          mode: [helix_insert helix_normal helix_insert]
          event: {
            until: [
              { send: menu name: ide_completion_menu }
              { send: menunext }
              { edit: complete }
            ]
          }
        }
        {
          name: disable_ctrl_space
          modifier: control
          keycode: char_u0020
          mode: [helix_insert helix_normal helix_insert]
          event: null
        }
      ]

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

      def "nx ed" [...args] {
        ^$env.editor $env.flake_path
      }

      def "nx mn" [...args] {
        ^zellij --new-session-with-layout nix
      }


      def --env "nix shell" [...args: string] {
          with-env { IN_NIX_SHELL: "true" } {
              ^nix shell ...$args
          }
      }
    '';
  };
}
