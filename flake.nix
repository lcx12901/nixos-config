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
{
  description = "A tough try on NixOS";

  outputs = inputs:
    with inputs; let
      username = "wktl";
      userfullname = "wktl Lin";
      useremail = "wktl1991504424@gmail.com";

      x64_system = "x86_64-linux";
      # allSystems = [x64_system];

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
          ({...}: {
            services.vscode-server.enable = true;
          })
          ./hosts/Nezuko
        ];
        home-module = import ./home/wktl/Nezuko.nix;
      };

      Icarus_modules = {
        nixos-modules = [
          ./hosts/Icarus
        ];
        home-module = import ./home/wktl/Icarus.nix;
      };

      x64_specialArgs =
        {
          inherit username userfullname useremail;
          pkgs = import nixpkgs {
            system = x64_system; # refer the `system` parameter form outer scope recursively
            overlays = [
              nur.overlay
              inputs.neovim-nightly-overlay.overlay
            ];
            # To use chrome, we need to allow the installation of non-free software
            config = {
              allowUnfree = true;
              permittedInsecurePackages = [
                "openssl-1.1.1w"
              ];
            };
          };
        }
        // inputs;
    in {
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
        # M600
        Nezuko = nixosSystem (Nezuko_modules // base_args);
        # office
        Icarus = nixosSystem (Icarus_modules // base_args);
      };
    };

  nixConfig = {
    # substituers will be appended to the default substituters when fetching packages
    extra-substituters = [
      "https://nix-community.cachix.org"
      "https://hyprland.cachix.org"
      "https://nix-gaming.cachix.org"
    ];
    extra-trusted-public-keys = [
      "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
      "hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc="
      "nix-gaming.cachix.org-1:nbjlureqMbRAxR1gJ/f3hxemL9svXaZF/Ees8vCUUs4="
    ];
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

    nix-gaming.url = "github:fufexan/nix-gaming";

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
    # hyprland = {
    #   url = "github:hyprwm/Hyprland/da839f20f1b1a57ec78d6b041f8d1369150d253e";
    #   inputs.nixpkgs.follows = "nixpkgs";
    # };

    hypr-contrib.url = "github:hyprwm/contrib";

    agenix = {
      url = "github:ryantm/agenix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    neovim-nightly-overlay.url = "github:nix-community/neovim-nightly-overlay";

    vscode-server.url = "github:nix-community/nixos-vscode-server";

    nix-vscode-extensions.url = "github:nix-community/nix-vscode-extensions";

    nix-colors.url = "github:misterio77/nix-colors";

    # it's a private repository, use ssh protocol to authenticate via ssh-agent/ssh-key, and shallow clone to save time
    # need system key, by sudo ssh-keygen -f /etc/ssh/ssh_host_key -N '' -t rsa to change
    mysecrets = {
      url = "git+ssh://git@github.com/lcx12901/nix-secrets.git?shallow=1";
      flake = false;
    };

    metacubexd = {
      url = "github:MetaCubeX/metacubexd/gh-pages";
      flake = false;
    };

    clash-subscribe = {
      url = "git+ssh://git@github.com/lcx12901/iQZone.git?shallow=1";
      flake = false;
    };
  };
}
