{
  inputs,
  lib,
  system,
  ...
}: let
  inherit (inputs) nixpkgs home-manager nixos-generators;
in
  nixpkgs.lib.nixosSystem {
    inherit system;
  }
