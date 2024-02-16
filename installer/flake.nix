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

          ./host.nix

          ../hosts/common/global

          # ../hosts/common/global/optin-persistence.nix

          ../hosts/common/optional/systemd-boot.nix

          ../hosts/Icarus/hardware-configuration.nix

          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.wktl = ./hm.nix;
          }
        ];
      };
    };
  };
}
