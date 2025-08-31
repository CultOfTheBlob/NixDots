{
  pkgs,
  config,
  ...
}: {
  programs.zsh = {
    enable = true;

    dotDir = config.xdg.configHome;

    enableCompletion = true;

    autosuggestion = {
      enable = true;
    };

    syntaxHighlighting = {
      enable = true;
    };

    shellAliases = with pkgs; {
      ".." = "cd ..";

      lg = "lazygit";

      ls = "${eza}/bin/eza -a --icons";
      ll = "${eza}/bin/eza -al --icons";
      la = "${eza}/bin/eza -a --tree --level=2 --icons";

      fman = "compgen -c | fzf | xargs man";
      fzf = "fzf -m --preview 'bat --style numbers,changes --color=always {}'";
      fzfo = "nvim $(fzf -m --preview 'bat --style numbers,changes --color=always {}')";

      ssh = "kitty +kitten ssh";

      x = "exit";
    };

    oh-my-zsh = {
      enable = true;

      plugins = [
        "sudo"
        "git"
        "copyfile"
        "copybuffer"
      ];
    };
  };
}
