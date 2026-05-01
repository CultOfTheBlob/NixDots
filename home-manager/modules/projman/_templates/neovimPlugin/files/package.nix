{
  self,
  pkgs,
}:
pkgs.vimUtils.buildVimPlugin {
  pname = "#{name}.nvim";
  version = self.shortRev or "dev";
  src = self;
}
