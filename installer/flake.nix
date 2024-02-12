{
  description = "NixOS configuration for intall";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    impermanence.url = "github:nix-community/impermanence";
    nixos-hardware.url = "github:NixOS/nixos-hardware";
  };

  outputs = inputs @ {
    nixpkgs,
    nixos-hardware,
    ...
  }: {
    nixosConfigurations = {
      Emilia = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = inputs // {username = "wktl";};
        modules = [
          {networking.hostName = "Emilia";}

          ../hosts/common/global/openssh.nix
          ../hosts/common/global/option-persistence.nix

          ../hosts/common/optional/system-boot.nix

          ../hosts/common/users/wktl

          ../hosts/Emilia/hardware-configuration.nix
        ];
      };
    };
  };
}
