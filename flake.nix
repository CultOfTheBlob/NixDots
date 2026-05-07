{
  description = "System Flake";
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    nixpkgs-stable.url = "github:NixOS/nixpkgs/nixos-25.11";

    import-tree.url = "github:vic/import-tree";

    nix-index-database = {
      url = "github:nix-community/nix-index-database";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    sops-nix.url = "github:Mic92/sops-nix";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    stylix = {
      url = "github:danth/stylix/";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    niri = {
      url = "github:sodiboo/niri-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    quickshell = {
      url = "git+https://git.outfoxxed.me/outfoxxed/quickshell";

      inputs.nixpkgs.follows = "nixpkgs";
    };

    noctalia = {
      url = "github:noctalia-dev/noctalia-shell";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    projman = {
      url = "github:CultOfTheBlob/ProjMan";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nvf = {
      url = "github:notashelf/nvf";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    godot-scenetree = {
      url = "github:CultOfTheBlob/godot-scenetree.nvim";
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

    drift = {
      url = "github:phlx0/drift";
      flake = false;
    };

    qml-language-server = {
      url = "github:cushycush/qml-language-server";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    zen-browser = {
      url = "github:0xc000022070/zen-browser-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };
  outputs = {nixpkgs, ...} @ inputs: let
    pkgsStable = inputs.nixpkgs-stable.legacyPackages.${system};
    system = "x86_64-linux";
    user = "blob";
    hosts = ["yog-sothoth"];
    host = builtins.elemAt hosts 0;
  in {
    nixosConfigurations.${host} = nixpkgs.lib.nixosSystem {
      specialArgs = {inherit inputs user host pkgsStable;};
      modules = [
        (inputs.import-tree ./nixos)
        (inputs.import-tree ./home-manager/colors)
        ./hosts/${host}/hardware-configuration.nix
        inputs.stylix.nixosModules.stylix
        inputs.niri.nixosModules.niri
        inputs.nix-index-database.nixosModules.default
        {programs.nix-index-database.comma.enable = true;}
      ];
    };
    homeConfigurations.${user} = inputs.home-manager.lib.homeManagerConfiguration {
      pkgs = nixpkgs.legacyPackages.${system};
      extraSpecialArgs = {inherit inputs user system pkgsStable;};
      modules = [
        (inputs.import-tree ./home-manager)
        inputs.sops-nix.homeManagerModules.sops
        inputs.projman.homeManagerModules.default
        inputs.niri.homeModules.niri
        inputs.noctalia.homeModules.default
        inputs.stylix.homeModules.stylix
        inputs.nvf.homeManagerModules.default
        inputs.nixcord.homeModules.nixcord
        inputs.spicetify-nix.homeManagerModules.default
        inputs.zen-browser.homeModules.default
      ];
    };
  };
}
