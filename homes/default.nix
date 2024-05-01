{
  inputs',
  self',
  self,
  config,
  lib,
  ...
}: let
  inherit (self) inputs;
  inherit (lib.modules) mkIf;
  inherit (lib.attrsets) genAttrs;
  inherit (config) modules;

  env = modules.useEnv;
  sys = modules.system;
  defaults = sys.programs.default;

  specialArgs = {inherit inputs self inputs' self' defaults;};
in {
  home-manager = mkIf env.useHomeManager {
    verbose = true;
    useGlobalPkgs = true;
    useUserPackages = true;
    extraSpecialArgs = specialArgs;

    users = genAttrs config.modules.system.users (name: ./${name});
  };
}
