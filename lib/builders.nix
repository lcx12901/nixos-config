{
  inputs,
  lib,
  ...
}: let
  inherit (inputs) self nixpkgs;
  inherit (lib.lists) singleton concatLists;
  inherit (lib.modules) mkDefault;
  inherit (lib.attrsets) recursiveUpdate;

  # shorthand alias to `lib.nixosSystem`
  mkSystem = lib.nixosSystem;

  # global module path for nixos modules
  # while using nixosSystem, this will be set as a specialArgs internally
  modulesPath = "${nixpkgs}/nixos/modules";

  # https://flake.parts/module-arguments#withsystem
  mkNixosSystem = {
    withSystem,
    system,
    hostname,
    ...
  } @ args:
    withSystem system ({
      inputs',
      self',
      ...
    }:
      mkSystem {
        specialArgs = recursiveUpdate {
          inherit lib modulesPath;
          inherit inputs self inputs' self';
        } (args.specialArgs or {});

        modules = concatLists [
          (singleton {
            networking.hostname = args.hostname;
            nixpkgs = {
              hostPlatform = mkDefault args.system;
              flake.source = nixpkgs.outPath;
            };
          })

          (args.modules or {})
        ];
      });
in {
  inherit mkSystem mkNixosSystem;
}
