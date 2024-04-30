{inputs}: let
  inherit (inputs.nixpkgs) lib;
  inherit (lib) foldl;
  inherit (import ./core.nix {inherit lib;}) import' mergeRecursively;

  builders = import' ./builders.nix {inherit inputs;};
  hardware = import' ./hardware.nix;

  importLibs = [builders hardware];
in
  lib.extend (_: _: foldl mergeRecursively {} importLibs)
