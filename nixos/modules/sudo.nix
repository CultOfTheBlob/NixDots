{ user, ... }: {
  security.sudo = {
    extraRules = [
      {
        users = [ user ];
        commands = [
          {
            command = "ALL";
            options = [ "NOPASSWD" ];
          }
        ];
      }
    ];
  };
}
