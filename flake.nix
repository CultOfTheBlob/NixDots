{
  description = "System Flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixpkgs-stable.url = "github:NixOS/nixpkgs/nixos-25.11";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    stylix = {
      url = "github:danth/stylix/";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    hyprland.url = "github:hyprwm/Hyprland";

    hyprland-plugins = {
      url = "github:hyprwm/hyprland-plugins";
      inputs.hyprland.follows = "hyprland";
    };

    nvf = {
      url = "github:notashelf/nvf";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nixcord = {
      url = "github:kaylorben/nixcord";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    spicetify-nix = {
      url = "github:Gerg-L/spicetify-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    firefox-addons = {
      url = "gitlab:rycee/nur-expressions?dir=pkgs/firefox-addons";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    silentSDDM = {
      url = "github:uiriansan/SilentSDDM";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = {
    nixpkgs,
    home-manager,
    ...
  } @ inputs: let
    pkgsStable = inputs.nixpkgs-stable.legacyPackages.${system};

    system = "x86_64-linux";
    user = "blob";

    hosts = ["yog-sothoth"];
    host = builtins.elemAt hosts 0;
  in {
    nixosConfigurations.${host} = nixpkgs.lib.nixosSystem {
      specialArgs = {inherit inputs user host pkgsStable;};

      modules = [
        ./nixos/configuration.nix
        ./hosts/${host}/hardware-configuration.nix

        inputs.stylix.nixosModules.stylix
      ];
    };

    homeConfigurations.${user} = home-manager.lib.homeManagerConfiguration {
      pkgs = nixpkgs.legacyPackages.${system};

      extraSpecialArgs = {inherit inputs user system pkgsStable;};

      modules = [
        ./home-manager/home.nix
        inputs.stylix.homeModules.stylix
        inputs.nvf.homeManagerModules.default
        inputs.nixcord.homeModules.nixcord
        inputs.spicetify-nix.homeManagerModules.default
      ];
    };
  };
}
