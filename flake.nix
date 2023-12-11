#           ▜███▙       ▜███▙  ▟███▛
#            ▜███▙       ▜███▙▟███▛
#             ▜███▙       ▜██████▛
#      ▟█████████████████▙ ▜████▛     ▟▙
#     ▟███████████████████▙ ▜███▙    ▟██▙
#            ▄▄▄▄▖           ▜███▙  ▟███▛
#           ▟███▛             ▜██▛ ▟███▛
#          ▟███▛               ▜▛ ▟███▛
# ▟███████████▛                  ▟██████████▙
# ▜██████████▛                  ▟███████████▛
#       ▟███▛ ▟▙               ▟███▛
#      ▟███▛ ▟██▙             ▟███▛
#     ▟███▛  ▜███▙           ▝▀▀▀▀
#     ▜██▛    ▜███▙ ▜██████████████████▛
#      ▜▛     ▟████▙ ▜████████████████▛
#            ▟██████▙       ▜███▙
#           ▟███▛▜███▙       ▜███▙
#          ▟███▛  ▜███▙       ▜███▙
#          ▝▀▀▀    ▀▀▀▀▘       ▀▀▀▘
# » Implemented machines:
#    • wsl → WSL on the daily driver.

{
  description = "A tough try on NixOS";

  outputs = input @ { self, nixpkgs, home-manager, nixos-wsl, nix-ld, ... }:
    let
      username = "wktl";
      userfullname = "wktl Lin";
      useremail = "wktl1991504424@gmail.com";

      x64_system = "x86_64-linux";
      allSystems = [x64_system];

      nixosSystem = import ./lib/nixosSystem.nix;

      Mikasa_modules = {
        nixos-modules = [
          nixos-wsl.nixosModules.wsl
          ./hosts/Mikasa
        ];
        home-module = import ./home/wktl/Mikasa.nix;
      };

      x64_specialArgs =
        {
          inherit username userfullname useremail;
          pkgs = import nixpkgs {
            system = x64_system; # refer the `system` parameter form outer scope recursively
            # To use chrome, we need to allow the installation of non-free software
            config.allowUnfree = true;
          };
        }
        // inputs;
    in
    {
      nixosConfigurations = let
        base_args = {
          inherit home-manager;
          nixpkgs = nixpkgs;
          system = x64_system;
          specialArgs = x64_specialArgs;
        };
      in {
        Mikasa = nixosSystem (Mikasa_modules // base_args);
      };

      # format the nix code in this flake
      # alejandra is a nix formatter with a beautiful output
      formatter = nixpkgs.lib.genAttrs allSystems (
        system:
          nixpkgs.legacyPackages.${system}.alejandra
      );
    };

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager/release-23.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nur.url = "github:nix-community/NUR";

    nixos-wsl = {
      url = "github:nix-community/NixOS-WSL";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nix-index-database = {
      url = "github:Mic92/nix-index-database";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nix-ld = {
      url = "github:Mic92/nix-ld";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };
}
