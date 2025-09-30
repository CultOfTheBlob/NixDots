{
  programs.fzf = {
    enable = true;

    defaultCommand = "fd --type f --hidden --follow --exclude /nix/store/";
  };
}
