{
  programs = {
    git = {
      enable = true;

      signing.format = "openpgp";

      settings = {
        user = {
          name = "CultOfTheBlob";
          email = "human.choupani@gmail.com";
        };

        init.defaultBranch = "main";
      };
    };
  };
}
