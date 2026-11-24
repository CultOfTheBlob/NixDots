{ user, ... }: {
  programs.zellij = {
    enable = true;

    settings = {
      theme = "nord";
      pane_frames = false;
      default_layout = "default";
      default_mode = "normal";
      mouse_mode = false;
    };

    extraConfig = /* kdl */ ''
      keybinds clear-defaults=true {
        normal {
            bind "Alt q" { Quit; }
            bind "Alt d" { Detach; }

            bind "Alt p" { SwitchToMode "pane"; }
            bind "Alt r" { SwitchToMode "resize"; }
            bind "Alt t" { SwitchToMode "tab"; }
            bind "Alt s" { SwitchToMode "scroll"; }
            bind "Alt m" { SwitchToMode "move"; }

            bind "Alt n" { NewPane; }

            bind "Alt h" { MoveFocusOrTab "Left"; }
            bind "Alt j" { MoveFocus "Down"; }
            bind "Alt k" { MoveFocus "Up"; }
            bind "Alt l" { MoveFocusOrTab "Right"; }

            bind "Alt Tab" { GoToNextTab; }
            bind "Alt Shift Tab" { GoToPreviousTab; }

            bind "Alt +" { Resize "Increase"; }
            bind "Alt -" { Resize "Decrease"; }
            bind "Alt \\" { FocusLastPane; }
        }

        pane {
          bind "Enter" "Esc" "Space" { SwitchToMode "normal"; }

          bind "h" "Left" { NewPane "Left"; }
          bind "l" "Right" { NewPane "Right"; }
          bind "j" "Down" { NewPane "Down"; }
          bind "k" "Up" { NewPane "Up"; }

          bind "Alt h" "Left" { MoveFocus "Left"; }
          bind "Alt l" "Right" { MoveFocus "Right"; }
          bind "Alt j" "Down" { MoveFocus "Down"; }
          bind "Alt k" "Up" { MoveFocus "Up"; }

          bind "p" { SwitchFocus; }
          bind "n" { NewPane; }
          bind "x" { CloseFocus; }
          bind "f" { ToggleFocusFullscreen; }
          bind "Shift f" { ToggleFocusNoUiFullscreen; }
          bind "z" { TogglePaneFrames; }
        }

        tab {
          bind "Enter" "Esc" "Space" { SwitchToMode "normal"; }

          bind "h" "Left" { GoToPreviousTab; }
          bind "l" "Right" { GoToNextTab; }

          bind "n" { NewTab; }
          bind "x" { CloseTab; }
          bind "s" { ToggleActiveSyncTab; }

          bind "1" { GoToTab 1; }
          bind "2" { GoToTab 2; }
          bind "3" { GoToTab 3; }
          bind "4" { GoToTab 4; }
          bind "5" { GoToTab 5; }
          bind "6" { GoToTab 6; }
          bind "7" { GoToTab 7; }
          bind "8" { GoToTab 8; }
          bind "9" { GoToTab 9; }
        }

        resize {
          bind "Enter" "Esc" "Space" { SwitchToMode "normal"; }

          bind "h" "Left" { Resize "Left"; }
          bind "j" "Down" { Resize "Down"; }
          bind "k" "Up" { Resize "Up"; }
          bind "l" "Right" { Resize "Right"; }

          bind "=" "+" { Resize "Increase"; }
          bind "-" { Resize "Decrease"; }
        }

        move {
          bind "Enter" "Esc" "Space" { SwitchToMode "normal"; }

          bind "h" "Left" { MovePane "Left"; }
          bind "j" "Down" { MovePane "Down"; }
          bind "k" "Up" { MovePane "Up"; }
          bind "l" "Right" { MovePane "Right"; }
        }

        scroll {
          bind "Enter" "Esc" { SwitchToMode "normal"; }

          bind "e" { EditScrollback; SwitchToMode "normal"; }
          bind "Alt c" { ScrollToBottom; SwitchToMode "normal"; }

          bind "j" "Down" { ScrollDown; }
          bind "k" "Up" { ScrollUp; }
          bind "d" { HalfPageScrollDown; }
          bind "u" { HalfPageScrollUp; }
          bind "Alt f" "PageDown" { PageScrollDown; }
          bind "Alt b" "PageUp" { PageScrollUp; }

          bind "s" { SwitchToMode "entersearch"; SearchInput 0; }
        }

        search {
          bind "Alt s" "Enter" "Esc" "Space" { SwitchToMode "normal"; }

          bind "s" { SwitchToMode "entersearch"; SearchInput 0; }
          bind "n" { Search "Down"; }
          bind "p" { Search "Up"; }
          bind "c" { SearchToggleOption "CaseSensitivity"; }
          bind "w" { SearchToggleOption "Wrap"; }
          bind "o" { SearchToggleOption "WholeWord"; }
        }

        entersearch {
          bind "Enter" { SwitchToMode "search"; }
          bind "Alt c" "Esc" { SearchInput 27; SwitchToMode "scroll"; }
        }

        locked clear-defaults=true {}
        renamepane clear-defaults=true {}
        renametab clear-defaults=true {}
        session clear-defaults=true {}
        tmux clear-defaults=true {}
      }
    '';

    layouts.nix = /* kdl */ ''
      layout {
        cwd "/home/${user}/.nix"

        tab name="Edit" {
          pane split_direction="vertical" {
            pane command="nu" {
              args "--login" "--execute" "nx ed"
            }
            pane command="nu" {
              args "--login" "--execute" "yy"
            }
          }
        }

        tab name="Build" {
          pane split_direction="vertical" {
            pane
            pane command="nu" {
              args "--login" "--execute" "lg"
            }
          }
        }
      }
    '';
  };
}
