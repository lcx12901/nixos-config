{
  withSystem,
  inputs,
  ...
}: let
  # self.lib is an extended version of nixpkgs.lib
  inherit (inputs.self) lib;
  inherit (lib) concatLists mkNixosSystem;

  ### flake inputs ###
  agenix = inputs.agenix.nixosModules.default;
  hm = inputs.home-manager.nixosModules.default;

  # serializing the modulePath to a variable
  # this is in case the modulePath changes depth (i.e modules becomes nixos/modules)
  modulePath = ../modules;

  coreModules = modulePath + /core; # the path where common modules reside

  # common modules
  # to be shared across all systems without exception
  common = coreModules + /common; # the self-proclaimed sane defaults for all my systems

  # home-manager
  homesDir = ../home;
  homes = [hm homesDir];

  # a list of shared modules that All system need
  shared = [
    common
    agenix
  ];
in {
  # M600 Ryzen 9 6900HX with Radeon Graphics
  Nezuko = mkNixosSystem {
    inherit withSystem;
    hostname = "Nezuko";
    system = "x86_64-linux";
    modules =
      [
        ./Nezuko
      ]
      ++ concatLists [shared homes];
    specialArgs = {inherit lib;};
  };
}
