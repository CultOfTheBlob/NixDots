{
  self,
  pkgs,
}:
pkgs.vimUtils.buildVimPlugin {
  pname = "my-neovim-plugin";
  version = self.shortRev or "dev";
  src = ./.;
}
