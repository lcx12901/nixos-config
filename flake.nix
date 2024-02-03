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

  outputs = inputs @ { self, nixpkgs, nur, home-manager, nixos-wsl, nix-ld, vscode-server, ... }:
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

      Nezuko_modules = {
        nixos-modules = [
          vscode-server.nixosModules.default
          ({ config, pkgs, ... }: {
            services.vscode-server.enable = true;
          })
          ./hosts/Nezuko
        ];
        home-module = import ./home/wktl/Nezuko.nix;
      };

      x64_specialArgs =
        {
          inherit username userfullname useremail;
          pkgs = import nixpkgs {
            system = x64_system; # refer the `system` parameter form outer scope recursively
            overlays = [ 
              nur.overlay
            ];
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
        # WSL
        Mikasa = nixosSystem (Mikasa_modules // base_args);
        # VM
        Nezuko = nixosSystem (Nezuko_modules // base_args);
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
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nur.url = "github:nix-community/NUR";

    nixos-wsl = {
      url = "github:nix-community/NixOS-WSL";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    hardware.url = "github:nixos/nixos-hardware";

    impermanence.url = "github:nix-community/impermanence";

    nix-index-database = {
      url = "github:Mic92/nix-index-database";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nix-ld = {
      url = "github:Mic92/nix-ld";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    hyprland = {
      url = "github:hyprwm/Hyprland";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    agenix = {
      url = "github:ryantm/agenix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    
    vscode-server.url = "github:nix-community/nixos-vscode-server";

    # it's a private repository, use ssh protocol to authenticate via ssh-agent/ssh-key, and shallow clone to save time
    # need system key, by sudo ssh-keygen -f /etc/ssh/ssh_host_key -N '' -t rsa to change  
    mysecrets = {
      url = "git+ssh://git@github.com/lcx12901/nix-secrets.git?shallow=1";
      flake = false;
    };

    clash-subscribe = {
      url = "git+ssh://git@github.com/lcx12901/iQZone.git?shallow=1";
      flake = false;
    };
  };
}
