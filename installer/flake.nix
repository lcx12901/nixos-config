{
  description = "NixOS configuration for intall";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    impermanence.url = "github:nix-community/impermanence";
    nixos-hardware.url = "github:NixOS/nixos-hardware";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs @ {
    nixpkgs,
    nixos-hardware,
    home-manager,
    ...
  }: {
    nixosConfigurations = {
      Icarus = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = inputs // {username = "wktl";};
        modules = [
          {
            networking.hostName = "Icarus";
            system.stateVersion = "23.11";
          }

          ../hosts/common/global/openssh.nix
          ../hosts/common/global/fish.nix
          ../hosts/common/global/optin-persistence.nix

          ../hosts/common/optional/systemd-boot.nix

          ../hosts/common/users/wktl

          ../hosts/Emilia/hardware-configuration.nix

          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;

            home-manager.extraSpecialArgs = specialArgs;
            home-manager.users.wktl = ./wktl.nix;
          }
        ];
      };
    };
  };
}
